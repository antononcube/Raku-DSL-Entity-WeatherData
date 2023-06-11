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
ok $pCOMMAND.parse('max temperature', rule => 'weather-data-entity-command'), 'max temperature';

## 2
ok $pCOMMAND.parse('min temperature', rule => 'weather-data-entity-command'), 'min temperature';

## 3
ok $pCOMMAND.parse('MaxTemperature', rule => 'weather-data-entity-command'), 'MaxTemperature';

## 4
ok $pCOMMAND.parse('cloud cover fraction', rule => 'weather-data-entity-command'), 'cloud cover fraction';

## 5
ok $pCOMMAND.parse('mean dew point', rule => 'weather-data-entity-command'), 'mean dew point';


done-testing;
