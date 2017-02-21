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
        #*{$AUTOLOAD} = sub { $_[0]->{$field} = $_[1] };
        *{$AUTOLOAD} = sub {
            my ( $self, $value ) = @_;
            if ( $self->validation( $value, $field ) ) {
                $self->{$field} = $value
            }
            else {
                die "$field failed validation"; 
            }
        };        
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
    # Завершить работу с ошибкой, если передан некорректный метод
    die "$_[0] вызван ошибочный метод $1\n";
}



sub validation { 
  my ($self, $value, $field) = @_;
  
  if ( $field eq 'Name' and $value =~ /^([а-яА-ЯёЁ]+)(\s)([а-яА-ЯёЁ]+)(\s)([а-яА-ЯёЁ]+)$/ ) {
     # validate Name
    return 1;
  }
  elsif ( $field eq 'Rank' and $value =~ /^\w+$/ ) {
    # validate Rank
    return 1;
  }
  elsif ( $field eq 'Specialty' and $value =~/командир|механик-водитель|наводчик|заряжающий|радист/ ) {
    # validate Specialty
    return 1;
  }
  elsif ( $field eq 'Life_time' and $value =~ /\d+/ ) {
    # validate Life_time
    return 1;
  }
  elsif ( $field eq 'Model' ) {
    # validate Model
    return 1;
  }

}

1;