OCCModule.controller('QualityController', function ($scope, $injector, QualityService, dataItems) {
    $scope.title = 'Minting qualities';
    $scope.data = { columns: ['name', 'abbr'], columnTitles: ['Name', 'Abbreviation']};

    $injector.invoke(OCCModule.CrudBase, this, {$scope: $scope, service: QualityService, dataItems: dataItems});
});
