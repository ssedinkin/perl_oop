#!/usr/bin/perl

use Crew;
use Data::Dumper;



my $crmem = Crew->new();

# Проверяем поля объекта
print Data::Dumper::Dumper( $crmem );
$crmem->name('Иванов Иван Иванович');
print Data::Dumper::Dumper( $crmem );
$crmem->rank('superman'); # Правильно
#$crmem->rrank('superman'); # Неправильно
# $crmem->set_Rank('abs 123'); # Неправильно
$crmem->specialty('командир'); # Правильно
#$crmem->set_Specialty('мотострелок'); # Неправильно
$crmem->life_time('666'); # Правильно
#$crmem->set_Life_time('asd'); # Неправильно
$crmem->model('railgun');
print Data::Dumper::Dumper( $crmem );

# Получаем поля
print $crmem->specialty . "\n";
print $crmem->name . "\n";
