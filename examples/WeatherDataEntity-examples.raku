use v6.d;

use lib '.';
use lib './lib';

use DSL::Entity::WeatherData;
use DSL::Entity::WeatherData::ResourceAccess;

use Pretty::Table;
use Data::Reshapers;

my $pCOMMAND = DSL::Entity::WeatherData::Grammar;

$pCOMMAND.set-resources(DSL::Entity::WeatherData::resource-access-object());

say "Words    : ", DSL::Entity::WeatherData::resource-access-object().getKnownNameWords.map({ $_.keys => $_.value.elems });
say "Entities : ", DSL::Entity::WeatherData::resource-access-object().getKnownNames.map({ $_.keys => $_.value.elems });

say $pCOMMAND.parse('max temperature', rule => 'weather-data-entity-command');

say $pCOMMAND.parse('cloud cover fraction',
        rule => 'weather-data-entity-command',
        actions => DSL::Entity::WeatherData::Actions::WL::System.new(resources=>DSL::Entity::WeatherData::resource-access-object())
        ).made;

my @testCommands = (
'max temperature',
'MinTemperature',
'MeanTemperature',
'cloud cover fraction',
'cloud cover fractions',
'KACQ',
'F0664',
);


my @targets = <WL-Entity WL-System Raku::System>;

my @tbl =
        gather {
            for @testCommands -> $c {
                for @targets -> $t {
                    my $start = now;
                    my $res = ToWeatherDataEntityCode($c, $t);
                    my $timing = now - $start;
                    take %( command => $c, target => $t, :$timing, parsed => $res)
                }
            }
        };

say to-pretty-table(@tbl.sort({ -$_<timing> }));
