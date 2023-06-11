use v6.d;
use lib './lib';
use lib '.';
use DSL::Entity::WeatherData;
use Test;

##===========================================================
## Data formats
##===========================================================

my $pCOMMAND = DSL::Entity::WeatherData::Grammar;
$pCOMMAND.set-resources(DSL::Entity::WeatherData::resource-access-object());

plan *;

## 1
ok $pCOMMAND.parse('F0664', rule => 'weather-data-entity-command'), 'F0664';

## 2
ok $pCOMMAND.parse('KACQ', rule => 'weather-data-entity-command'), 'KACQ';


done-testing;
