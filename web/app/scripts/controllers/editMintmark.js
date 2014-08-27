OCCModule.controller('MintmarkController', function ($scope, MintmarkService, dataItems, Settings) {
    $scope.title = 'Mint marks';
    $scope.data = { columns: ['name', 'mintname'], columnTitles: ['Name', 'Mint']};
    $scope.filterByTerritory = true;
    OCCModule.CrudBase.call(this, $scope, MintmarkService, dataItems, Settings);
});
