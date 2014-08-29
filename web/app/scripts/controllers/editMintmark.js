OCCModule.controller('MintmarkController', function ($scope, $injector, MintmarkService, dataItems) {
    $scope.title = 'Mint marks';
    $scope.data = { columns: ['name', 'mintname'], columnTitles: ['Name', 'Mint']};
    $scope.filterByTerritory = true;

    $injector.invoke(OCCModule.CrudBase, this, {$scope: $scope, service: MintmarkService, dataItems: dataItems});
});
