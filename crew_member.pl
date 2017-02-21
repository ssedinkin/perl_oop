#!/usr/bin/perl

# Устанавливаем или получаем поля: Name, Rank, Specialty, Life_time, Model
# Получить поле Name: get_Name
# Установить поле Name: set_Name('Пупкин Иван Ильич')

use Crew;
use Data::Dumper;


my $crmem = Crew->new();
print Data::Dumper::Dumper( $crmem );
$crmem->set_Specialty('наводчик');
$crmem->set_Name('Иван Иванов');


print Data::Dumper::Dumper( $crmem );
print $crmem->get_Specialty()."\n";
print $crmem->get_Name."\n";


print Data::Dumper::Dumper( $crmem );
