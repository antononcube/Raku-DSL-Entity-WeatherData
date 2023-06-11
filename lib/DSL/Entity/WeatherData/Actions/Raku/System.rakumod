use v6;

use DSL::Entity::WeatherData::Grammar;
use DSL::Entity::WeatherData::ResourceAccess;
use DSL::Shared::Actions::English::Raku::PipelineCommand;
use DSL::Shared::Entity::Actions::Raku::System;


class DSL::Entity::WeatherData::Actions::Raku::System
        is DSL::Shared::Entity::Actions::Raku::System
        is DSL::Shared::Actions::English::Raku::PipelineCommand {

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
