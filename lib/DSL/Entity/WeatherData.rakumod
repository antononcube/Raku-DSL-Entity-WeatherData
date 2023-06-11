
=begin pod

=head1 DSL::Entity::WeatherData

C<DSL::Entity::WeatherData> package has grammar and action classes for the parsing and
interpretation of natural language commands that specify weather data variables or weather stations.

=head1 Synopsis

    use DSL::Entity::WeatherData;
    my $rcode = ToWeatherDataEntityCode('Station');

=end pod

unit module DSL::Entity::WeatherData;

use DSL::Shared::Utilities::CommandProcessing;

use DSL::Entity::WeatherData::Grammar;
use DSL::Entity::WeatherData::ResourceAccess;

use DSL::Entity::WeatherData::Actions::Raku::System;
use DSL::Entity::WeatherData::Actions::WL::Entity;
use DSL::Entity::WeatherData::Actions::WL::System;

use DSL::Entity::WeatherData::Actions::Bulgarian::Standard;

#-----------------------------------------------------------
my %targetToAction =
        "Mathematica"      => DSL::Entity::WeatherData::Actions::WL::System,
        "Raku"             => DSL::Entity::WeatherData::Actions::Raku::System,
        "Raku-System"      => DSL::Entity::WeatherData::Actions::Raku::System,
        "WL"               => DSL::Entity::WeatherData::Actions::WL::System,
        "WL-System"        => DSL::Entity::WeatherData::Actions::WL::System,
        "WL-Entity"        => DSL::Entity::WeatherData::Actions::WL::Entity,
        "Bulgarian"        => DSL::Entity::WeatherData::Actions::Bulgarian::Standard;

my %targetToAction2{Str} = %targetToAction.grep({ $_.key.contains('-') }).map({ $_.key.subst('-', '::').Str => $_.value }).Hash;
%targetToAction = |%targetToAction , |%targetToAction2;

#| Target to separators rules
my Str %targetToSeparator{Str} = DSL::Shared::Utilities::CommandProcessing::target-separator-rules();

#-----------------------------------------------------------
my DSL::Entity::WeatherData::ResourceAccess $resourceObj;

#| Get the resources access object.
our sub resource-access-object(--> DSL::Entity::WeatherData::ResourceAccess) { return $resourceObj; }

#-----------------------------------------------------------
#| Named entity recognition for metadata. (proto)
proto ToWeatherDataEntityCode(Str $command, Str $target = 'WL-System', | ) is export {*}

#| Named entity recognition for metadata
multi ToWeatherDataEntityCode( Str $command, Str $target = 'WL-System', *%args ) {

    my $pCOMMAND = DSL::Entity::WeatherData::Grammar;
    $pCOMMAND.set-resources(DSL::Entity::WeatherData::resource-access-object());

    my $ACTOBJ = %targetToAction{$target}.new(resources => DSL::Entity::WeatherData::resource-access-object());

    DSL::Shared::Utilities::CommandProcessing::ToWorkflowCode( $command,
                                                               grammar => $pCOMMAND,
                                                               actions => $ACTOBJ,
                                                               separator => %targetToSeparator{$target},
                                                               |%args )
}

#-----------------------------------------------------------
$resourceObj := BEGIN {
    my DSL::Entity::WeatherData::ResourceAccess $obj .= new;
    $obj.ingest-resource-files();
    $obj
}