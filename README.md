# Raku DSL::Entity::WeatherData

Raku grammar classes for weather data entities. (Variable- and station names.)

------

## Installation

From Zef ecosystem:

```
zef install DSL::Entity::WeatherData
```

From GitHub:

```
zef install https://github.com/antononcube/Raku-DSL-Entity-WeatherData.git
```

------

## Examples

Here are examples of recognizing different types of data acquisition related specifications:

```perl6
use DSL::Entity::WeatherData;
use DSL::Entity::WeatherData::Grammar;
my $pCOMMAND = DSL::Entity::WeatherData::Grammar;
$pCOMMAND.set-resources(DSL::Entity::WeatherData::resource-access-object());

say $pCOMMAND.parse('MaxTemperature');
```
```
# ｢MaxTemperature｣
#  weather-data-entity-command => ｢MaxTemperature｣
#   entity-variable-name => ｢MaxTemperature｣
#    0 => ｢MaxTemperature｣
#     entity-name-part => ｢MaxTemperature｣
```

```perl6
say $pCOMMAND.parse('cloud cover fraction');
```
```
# ｢cloud cover fraction｣
#  weather-data-entity-command => ｢cloud cover fraction｣
#   entity-variable-name => ｢cloud cover fraction｣
#    0 => ｢cloud cover fraction｣
#     entity-name-part => ｢cloud｣
#     entity-name-part => ｢cover｣
#     entity-name-part => ｢fraction｣
```

```perl6
say $pCOMMAND.parse('KACQ');
```
```
# ｢KACQ｣
#  weather-data-entity-command => ｢KACQ｣
#   entity-station-name => ｢KACQ｣
#    0 => ｢KACQ｣
#     entity-name-part => ｢KACQ｣
```

------

## References

### Datasets

[WRI1]
Wolfram Research (2007),
[WeatherData](https://reference.wolfram.com/language/ref/WeatherData.html),
(introduced 2007), (updated 2016),
Wolfram Language function.

[WRI2] Wolfram Research, Inc.,
[WeatherData Source Information](https://reference.wolfram.com/language/note/WeatherDataSourceInformation.html).


### Packages

[AAp1] Anton Antonov,
[DSL::Shared Raku package](https://github.com/antononcube/Raku-DSL-Shared),
(2020),
[GitHub/antononcube](https://github.com/antononcube).

[AAp2] Anton Antonov,
[DSL::Entity::Geographics Raku package](https://github.com/antononcube/Raku-DSL-Entity-Geographics),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp3] Anton Antonov,
[DSL::Entity::Jobs Raku package](https://github.com/antononcube/Raku-DSL-Entity-Jobs),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp4] Anton Antonov,
[DSL::Entity::Foods Raku package](https://github.com/antononcube/Raku-DSL-Entity-Foods),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp5] Anton Antonov,
[Data::ExampleDatasets Raku package](https://github.com/antononcube/Raku-Data-ExampleDatasets),
(2021),
[GitHub/antononcube](https://github.com/antononcube).