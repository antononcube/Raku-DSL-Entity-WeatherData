use DSL::Shared::Roles::ErrorHandling;
use DSL::Entity::WeatherData::ResourceAccess;
use DSL::Entity::WeatherData::Grammar::EntityNames;

grammar DSL::Entity::WeatherData::Grammar
        does DSL::Shared::Roles::ErrorHandling
        does DSL::Entity::WeatherData::Grammar::EntityNames {

    my DSL::Entity::WeatherData::ResourceAccess $resources;

    method get-resources(--> DSL::Entity::WeatherData::ResourceAccess) { return $resources; }
    method set-resources(DSL::Entity::WeatherData::ResourceAccess $obj) { $resources = $obj; }

    # TOP
    regex TOP {
        | <pipeline-command>
        | <weather-data-entity-command> }

    regex weather-data-entity-command { <entity-variable-name> | <entity-station-name> }
}

