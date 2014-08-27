OCCModule.factory('Territory', [ '$resource', 'Settings', function ($resource, Settings) {
    return $resource('http://localhost:8080/occ/rest/territory/:territoryId', {
        territoryId: '@id'
    }, {
        load: {
            method: 'GET',
            params: {
                parent: 0,
                lang: Settings.getLanguageCode
            },
            isArray: true
        }
    });
} ]);

OCCModule.controller('TerritoryController', function ($scope, Territory, Settings) {
    $scope.selection = {
        territory: function (newTerritory) {
            if (angular.isDefined(newTerritory)) {
                Settings.setMainTerritory(newTerritory);
            }
            if (!Settings.getMainTerritory())
                console.log(0);
            return Settings.getMainTerritory();
        },
        subTerritory: function (newTerritory) {
            if (angular.isDefined(newTerritory)) {
                Settings.setSubTerritory(newTerritory);
            }
            return Settings.getSubTerritory();
        },
        typedTerritory: ""
    };
    $scope.territoryData = { allTerritories: Territory.load({parent: null}), topTerritories: Territory.load(), subTerritories: [] };

    $scope.loadSubTerritories = function () {
        $scope.territoryData.subTerritories = Territory.load({ parent: $scope.selection.territory() && $scope.selection.territory().id });
    };
    $scope.loadTypedTerritory = function () {
        alert($scope.selection.typedTerritory);
    }
    $scope.update = function() {
        $scope.reload();
    }
});

