#Класс работы с членом экипажа
package Crew;

use strict;
use Data::Dumper;
use utf8;

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

    $AUTOLOAD =~ /::(\w+)$/ ;
    my $field = $1;
    if ( @_ == 2 ) {
        $self->validate( $field, $value );
        $self->{$field} = $value;
    }
    return $self->{$field};
}

sub validate {
    my ( $self, $field, $value ) = @_;

    my %validation = (
        name => '^[а-яА-ЯёЁ]+\s[а-яА-ЯёЁ]+\s[а-яА-ЯёЁ]+$',
        rank => '^\w+$',
        specialty => '^(командир|механик-водитель|наводчик|заряжающий|радист)$',
        life_time => '^\d+$',
        model => '.*'
    );

    exists $validation{$field}
        or die "Не существует поле $field";
    $value =~ $validation{$field}
        or die "Ошибка валидации поля $field";
    return 1;
} 
  
1;
