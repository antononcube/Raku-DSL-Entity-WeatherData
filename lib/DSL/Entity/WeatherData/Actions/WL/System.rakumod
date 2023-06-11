use v6;

use DSL::Entity::WeatherData::Grammar;
use DSL::Entity::WeatherData::ResourceAccess;
use DSL::Shared::Actions::English::WL::PipelineCommand;
use DSL::Shared::Entity::Actions::WL::System;

class DSL::Entity::WeatherData::Actions::WL::System
        is DSL::Shared::Entity::Actions::WL::System
        is DSL::Shared::Actions::English::WL::PipelineCommand {

    has DSL::Entity::WeatherData::ResourceAccess $.resources;

    ##========================================================
    ## Grammar methods
    ##========================================================

    method TOP($/) {
        make $/.values[0].made;
    }

    method weather-data-entity-command($/) {
        make $/.values[0].made;
    }

    method entity-variable-name($/) {
        my $nm = $!resources.name-to-entity-id('Variable', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }

    method entity-station-name($/) {
        my $nm = $!resources.name-to-entity-id('Station', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }
}
