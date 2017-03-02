#!/usr/bin/perl

package Crew;

use strict;
use Data::Dumper;


sub new {
    my ($class) = @_;
    my $self = {
        name => '',
        rank => '',
        specialty => '',
        life_time => '',
        model => ''
    };
    bless $self, $class;
}

sub AUTOLOAD {
    my ( $self, $value ) = @_;
    our $AUTOLOAD;

    if ( $AUTOLOAD =~ /::(\w+)$/ ) {
        my $field = $1;
        if ( @_ == 2 ) {
            $self->validation( $field, $value );
            $self->{$field} = $value;
        }
        return $self->{$field}; 
    }
    else {
        die "Вызван ошибочный метод $1\n";
    }
}

sub validation { 
    my ( $self, $field, $value ) = @_;

    my %validation = (
        name => '^[а-яА-ЯёЁ]+\s[а-яА-ЯёЁ]+\s[а-яА-ЯёЁ]+',
        rank => '^\w+$',
        specialty => '^(командир|механик-водитель|наводчик|заряжающий|радист)$',
        life_time => '^\d+$',
        model => '.*'
    );

    die "Не существует поле $field"
        unless exists $validation{$field};
    die "Ошибка валидации поля $field"
        unless $value =~ $validation{$field};
    return 1;
} 
  
1;
