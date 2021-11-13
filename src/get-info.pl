#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;

use GitHub::Actions;
use YAML;

if ( -f "DOCKER_USER" ) {
  say "❢ Usuario de Docker alternativo";
  open( my $fh, "<", "DOCKER_USER" ) || die "No puedo abrir DOCKER_USER";
  my $docker_user = <$fh>;
  chomp $docker_user;
  set_output( 'docker_user', $docker_user );
  set_env( 'DOCKER_USER', $docker_user );
} else {
  set_output( 'docker_user', $ENV{'user'} );
  set_env( 'DOCKER_USER', $ENV{'user'} );
}

my $cc;
eval { $cc = LoadFile("cc.yaml"); };
if ($@) {
  set_failed( "Hay algún problema leyendo «cc.yaml» ⤷ $@" );
} else {
  debug "Fichero de configuración ⚙ «cc.yaml» encontrado";
  if ( $cc->{'make'} ) {
    set_output( 'CC_ORDEN_TAREAS', $cc->{'make'});
    set_env( 'CC_ORDEN_TAREAS', $cc->{'make'});
  }
}
