use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Shared::Utilities::MetaSpecsProcessing;
use DSL::Shared::Entity::ResourceAccess;

class DSL::Entity::WeatherData::ResourceAccess
        is DSL::Shared::Entity::ResourceAccess {
    #-----------------------------------------------------------
    # OVERRIDE-START
    #-----------------------------------------------------------

    #| Override the parent class function in order to call
    #| DSL::Shared::Entity::ResourceAccess.make()
    #| with the correct file names.
    method get-resource-files( --> Hash) {
        my @fileNames = <Variable Station>;
        my %resources = @fileNames Z=> @fileNames.map({ $_ ~  'NameToEntityID_EN.csv' });
        %resources = %resources.map({ $_.key => %?RESOURCES{$_.value} });
        #note %resources.map({ $_ => slurp($_.value).lines.elems });
        return %resources;
    }

    #-----------------------------------------------------------
    # OVERRIDE-END
    #-----------------------------------------------------------


    ##========================================================
    ## Access
    ##========================================================

}
