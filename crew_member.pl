#!/usr/bin/perl

# Устанавливаем или получаем поля: Name, Rank, Specialty, Life_time, Model
# Получить поле Name: get_Name
# Установить поле Name: set_Name('Пупкин Иван Ильич')

use Crew;
use Data::Dumper;


my $crmem = Crew->new();
# Проверяем поля объекта
print Data::Dumper::Dumper( $crmem );

# Устанавливаем поля
###############$crmem->set_Name('иванов иван иванович');
# Проверяем, корректно ли установлены поля
print Data::Dumper::Dumper( $crmem );
# Продолжаем устанавливать поля
#$crmem->set_Name('absnext asd asd'); # Неправильно
$crmem->set_Rank('superman'); # Правильно
# $crmem->set_Rank('abs 123'); # Неправильно
$crmem->set_Specialty('командир'); # Правильно
#$crmem->set_Specialty('мотострелок'); # Неправильно
$crmem->set_Life_time('666'); # Правильно
#$crmem->set_Life_time('asd'); # Неправильно
$crmem->set_Model('railgun');
print Data::Dumper::Dumper( $crmem );

# Получаем поля
print $crmem->get_Specialty."\n";
print $crmem->get_Name."\n";

