OCCModule.factory('Territory', [ '$resource', '$http', function ($resource) {
    return $resource('http://localhost:8080/occ/rest/territory/:territoryId', {
        territoryId: '@id'
    }, {
        load: {
            method: 'GET',
            params: {
                parent: 0,
                lang: OCCModule.getLanguage()
            },
            isArray: true
        }
    });
} ]);

OCCModule.controller('TerritoryController', function ($scope, Territory) {
    function getSelectedTerritory() {
        if ($scope.selection) {
            if ($scope.selection.subTerritory) {
                return $scope.selection.subTerritory;
            }
            if ($scope.selection.territory) {
                return $scope.selection.territory;
            }
        }
        return null;
    }
    $scope.selection = {territory: "", subTerritory: "", typedTerritory: "" };
    $scope.territoryData = { allTerritories: Territory.load({parent: null}), topTerritories: Territory.load(), subTerritories: [] };

    $scope.loadSubTerritories = function () {
        $scope.territoryData.subTerritories = Territory.load({ parent: $scope.selection.territory && $scope.selection.territory.id });
    };
    $scope.loadTypedTerritory = function () {
        alert($scope.selection.typedTerritory);
    }
    $scope.update = function() {
        OCCModule.selectedTerritory = getSelectedTerritory();
        $scope.reload();
    }
});

