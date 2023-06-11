use v6;
use DSL::Entity::WeatherData::Grammar;

use DSL::Shared::Actions::English::WL::PipelineCommand;
use DSL::Shared::Actions::CommonStructures;

class DSL::Entity::WeatherData::Actions::Bulgarian::Standard
        is DSL::Shared::Actions::CommonStructures {

    # method TOP($/) { make $/.values[0].made; }

    method TOP($/) {
        make 'Not implemented.';
    }

}
