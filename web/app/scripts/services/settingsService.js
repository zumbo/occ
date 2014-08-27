OCCModule.factory('Settings', function () {
    var languages = [
        {name: "English", code: "en"},
        {name: "Deutsch", code: "de"}
    ];
    var languageSelection = languages[0];
    var mainTerritorySelection = {};
    var subTerritorySelection = {};
    function getTerritory() {
        return subTerritorySelection || mainTerritorySelection;
    }
    function getTerritoryId() {
        var territory = getTerritory();
        if (territory && territory.id) {
            return territory.id;
        }
        return 0;
    }
    return {
        languages: languages,
        getLanguage: function() { return languageSelection; },
        getLanguageCode: function() { return languageSelection.code; },
        setLanguage: function(newSelection) { languageSelection = newSelection; },
        getTerritory: getTerritory,
        getTerritoryId: getTerritoryId,
        getMainTerritory: function() { return mainTerritorySelection;},
        setMainTerritory: function(newSelection) { mainTerritorySelection = newSelection; subTerritorySelection = null; },
        getSubTerritory: function() { return subTerritorySelection;},
        setSubTerritory: function(newSelection) { subTerritorySelection = newSelection; }
    };
})