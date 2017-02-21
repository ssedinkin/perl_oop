#!/usr/bin/perl

package Crew;

use strict;

sub new {
	my($class) = @_;
	my $self = {
        Name => '',
        Rank => '',
        Specialty => '',
        Life_time => '',
        Model => ''
    };
    bless $self, $class;
}

sub AUTOLOAD {
    my @elements = qw(Name Rank Specialty Life_time Model);
    our $AUTOLOAD;
    # Устанавливаем
    if ($AUTOLOAD =~ /::set_(\w+)$/ and grep $1 eq $_, @elements) {
        my $field = ucfirst $1;
        {
        no strict 'refs';
        *{$AUTOLOAD} = sub { $_[0]->{$field} = $_[1] };
        }
        goto &{$AUTOLOAD};
    }
    # Получаем
    if ($AUTOLOAD =~ /::get_(\w+)$/ and grep $1 eq $_, @elements) {
        my $field = ucfirst $1;
        {
        no strict 'refs';
        *{$AUTOLOAD} = sub { $_[0]->{$field} };
        }
        goto &{$AUTOLOAD};
    }
}

1;