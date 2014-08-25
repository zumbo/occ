OCCModule.controller('MintmarkController', function ($scope, $resource) {
    $scope.title = 'Mint marks';
    $scope.data = { columns: ['name', 'mintname'], columnTitles: ['Name', 'Mint']};
    $scope.filterByTerritory = true;

    OCCModule.CrudBase.call(this, $scope, 'mintmark', $resource);
});
