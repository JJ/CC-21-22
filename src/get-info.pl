#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;

use GitHub::Actions;
use YAML qw(LoadFile);

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


my $CONF_FILE_NAME = "cc.yaml";
my $cc;
if ( -f $CONF_FILE_NAME ) {
  eval { $cc = LoadFile( $CONF_FILE_NAME ); };
  if ($@) {
    set_failed( "Hay algún problema leyendo «$CONF_FILE_NAME» ⤷ $@" );
  } else {
    warning "Fichero de configuración ⚙ «$CONF_FILE_NAME» encontrado";
    if ( $cc->{'make'} ) {
      if (ref($cc->{'make'}) eq 'ARRAY' ) {
        set_failed( "«make» debe ser un valor simple, no un ARRAY" );
      } else {
        set_output( 'CC_ORDEN_TAREAS', $cc->{'make'});
        set_env( 'CC_ORDEN_TAREAS', $cc->{'make'});
      }
    }
  }
}
