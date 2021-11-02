# -*- cperl -*-

use Test::More;
use Git;
use Term::ANSIColor qw(:constants);
use JSON;

use File::Slurper qw(read_text);
use YAML qw(LoadFile);

use v5.14; # For say

my $student_repo = Git->repository ( Directory => '.' );
my $hito = $ENV{'HITO'};

my @repo_files = $student_repo->command("ls-files");

doing( "Hito 0 de $hito");
for my $f (qw( .gitignore README.md LICENSE ) ) {
  ok grep( $f, @repo_files ), "Fichero $f presente";
}

done_testing() if $hito <= 0;

doing( "Hito 1 de $hito" );
# Fase 2
my ($readme_file) = grep( /^README/, @repo_files );
my $README =  read_text( $readme_file );
my $cc;

eval { $cc = LoadFile("iv.yaml"); };

say "Error $@ leyendo cc.yaml";


ok( !$@, "cc.yaml leído sin problemas");

unless ( $@ ) {
  for my $k (qw(lenguaje entidad)) {
    ok( $cc->{$k}, "Clave $k presente en cc.yaml" );
  }
}

done_testing();


# ------------------------------- Subs -----------------------------------
sub doing {
  my $what = shift;
  diag "\n\t✔ Comprobando $what\n";
}

sub check {
  return BOLD.GREEN ."✔ ".RESET.join(" ",@_);
}

sub fail_x {
  return BOLD.MAGENTA."✘".RESET.join(" ",@_);
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
