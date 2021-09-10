# -*- cperl -*-

use Test::More;
use Git;
use LWP::Simple;
use File::Slurper qw(read_text);
use Net::Ping;
use Term::ANSIColor qw(:constants);
use JSON;

use v5.14; # For say

my $repo = Git->repository ( Directory => '.' );
my $diff = $repo->command('diff','HEAD^1','HEAD');
my $diff_regex = qr/a\/proyectos\/(\d)\.md/;
my $github;

SKIP: {
  my ($this_hito) = ($diff =~ $diff_regex);
  skip "No hay envío de proyecto", 5 unless defined $this_hito;
  my $diag=<<EOC;

"Failed test" indica que no se cumple la condición indicada
Hay que corregir el envío y volver a hacer el pull request,
aumentando en uno el número de la versión del hito en el
fichero correspondiente.

EOC
  diag $diag;
  my @files = split(/diff --git/,$diff);
  my ($diff_hito) = grep( /$diff_regex/, @files);
  say "Tratando diff\n\t$diff_hito";
  my @lines = split("\n",$diff_hito);
  my @adds = grep(/^\+[^+]/,@lines);
  is( $#adds, 0, "Añade sólo una línea");
  my $url_repo;
  if ( $adds[0] =~ /\(http/ ) {
    ($url_repo) = ($adds[0] =~ /\((http\S+)\)/);
  } else {
    ($url_repo) = ($adds[0] =~ /^\+.+(http\S+)\b/s);
  }
  diag(check( "Encontrado URL del repo $url_repo" ));
  say $url_repo;
  isnt($url_repo,"","El envío incluye un URL");
  like($url_repo,qr/github.com/,"El URL es de GitHub");
  my ($user,$name) = ($url_repo=~ /github.com\/(\S+)\/(.+)/);
  my $este_fichero = fichero_objetivos($user);
  ok( $este_fichero, "$user ha enviado objetivos" ); # Test 4

  # Comprobar que los ha actualizado
  my $objetivos_actualizados = objetivos_actualizados( $repo, $este_fichero );
  is( $objetivos_actualizados, "",
       "Fichero de objetivos $este_fichero está actualizado")
    or skip "Fichero de objetivos actualizados hace $objetivos_actualizados" ;
  
  my $repo_dir = "/tmp/$user-$name";
  if (!(-e $repo_dir) or  !(-d $repo_dir) ) {
    mkdir($repo_dir);
    `git clone $url_repo $repo_dir`;
  }
  my $student_repo =  Git->repository ( Directory => $repo_dir );
  my @repo_files = $student_repo->command("ls-files");
  say "Ficheros\n\t→", join( "\n\t→", @repo_files);
  isnt( grep(/proyectos\/0.md/, @repo_files), 1, "No es el repositorio de la asignatura");

  # Necesitamos el README a partir de ahora.
  my $README =  read_text( "$repo_dir/README.md");
  unlike( $README, qr/[hH]ito/, "El README no debe incluir la palabra hito");

  # Comprueba que se use el nombre correcto para los ficheros de requisitos si existen
  my $with_pip = grep(/req\w+\.txt/, @repo_files);
  if ($with_pip) {
     ok( grep( /requirements.txt/, @repo_files), "Fichero de requisitos de Python con nombre correcto" );
   }

  if ( $this_hito > 1 ) { # Integración continua
    doing("hito 2");
    isnt( grep( /.travis.yml/, @repo_files), 0, ".travis.yml presente" );
    my $travis_domain = travis_domain( $README, $user, $name );
    ok( $travis_domain =~ /(com|org)/ , "Está presente el badge de Travis con enlace al repo correcto");
    if ( $travis_domain =~ /(com|org)/ ) {
      is( travis_status($README), 'Passing', "Los tests deben pasar en Travis");
    }

    my ($buildtool) = ($README =~ m{(?:buildtool:)\s+(\S+)\s+});
    ok( $buildtool, "Encontrado nombre del fichero buildtool" );
    isnt( grep( /\b$buildtool\b/, @repo_files), 0, "$buildtool presente" );
  }

  if ( $this_hito > 2 ) { # Integración continua
    doing("hito 3");
    isnt( grep( /Dockerfile/, @repo_files), 0, "Dockerfile presente" );
    # Comprobaciones sobre el Dockerfile
    my $dockerfile_content =   read_text( "$repo_dir/Dockerfile");
    ok( $dockerfile_content !~ /COPY \.\s+/, "Se deben copiar sólo los ficheros necesarios para la construcción" );

    # Comprobación del registry
    my ($registry) = ($README =~ m{(?:Contenedor:)\s+(\S+)\s+});
    ok( $registry, "Encontrado despliegue en registro $registry" );
    if ( $registry =~ /hub.docker.com/ ) {
      my $dockerfile = get "$registry/dockerfile";
      ok( $dockerfile, "Se descarga correctamente el URL del Dockerfile $registry/dockerfile" );
    } elsif ( $registry =~ /github.com/ ) {
      my $dockerfile = get $registry;
      ok( $dockerfile, "Se descarga correctamente el URL $registry" );
    } else {
      fail("$registry no es la dirección de un registro conocido");
    }
  }

  if ( $this_hito > 3 ) { # Integración continua
    doing("hito 4");
    my ($m_tool) = ($README =~ m{(?:Prestaciones:)\s+(\S+)\s+});
    ok( $m_tool, "Encontrado nombre del fichero de prestaciones $m_tool" );
    isnt( grep( /\b$m_tool\b/, @repo_files), 0, "Fichero de prestaciones $m_tool presente" );
  }

};

done_testing();


# ------------------------------- Subs -----------------------------------
sub doing {
  my $what = shift;
  diag "\n\t✔ Comprobando $what\n";
}

sub fichero_objetivos {
  my $user = shift;
  my @ficheros_objetivos = glob "objetivos/*.md";
  my @enviados = map { lc } @ficheros_objetivos;
  my $lc_user = lc $user;
  return grep( /$lc_user/, @enviados);
}

sub check {
  return BOLD.GREEN ."✔ ".RESET.join(" ",@_);
}

sub fail_x {
  return BOLD.MAGENTA."✘".RESET.join(" ",@_);
}

sub travis_domain {
  my ($README, $user, $name) = @_;
  my ($domain) = ($README =~ /.Build Status..https:\/\/travis-ci.(\w+)\/$user\/$name\.svg.+$name\)/i);
  return $domain;
}

sub travis_status {
  my $README = shift;
  my ($build_status) = ($README =~ /Build Status..([^\)]+)\)/);
  my $status_svg = `curl -L -s $build_status`;
  return $status_svg =~ /passing/?"Passing":"Fail";
}

sub check_ip {
  my $ip = shift;
  if ( $ip ) {
    diag "\n\t".check( "Detectada dirección de despliegue $ip" )."\n";
  } else {
    diag "\n\t".fail_x( "Problemas detectando dirección de despliegue" )."\n";
  }
  my $pinger = Net::Ping->new();
  $pinger->port_number(22); # Puerto ssh
  isnt($pinger->ping($ip), 0, "$ip es alcanzable");
}

sub objetivos_actualizados {
  my $repo = shift;
  my $objective_file = shift;
  my $date = $repo->command('log', '-1', '--date=relative', '--', "$objective_file");
  my ($hace,$unidad)= $date =~ /Date:.+?(\d+)\s+(\w+)/;
  if ( $unidad =~ /(semana|week|minut)/ ) {
    return "";
  } elsif ( $unidad =~ /ho/ ) {
    return ($hace > 1 )?"":"Objetivos actualizados demasiado recientemente";
  } elsif ( $unidad =~ /d\w+/ ){
    return ($hace < 7)?"":"Los objetivos no han sido actualizados en la semana anterior";
  }

}
