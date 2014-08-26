OCCModule.controller('QualityController', function ($scope, QualityService, dataItems) {
    $scope.title = 'Minting qualities';
    $scope.data = { columns: ['name', 'abbr'], columnTitles: ['Name', 'Abbreviation']};

    OCCModule.CrudBase.call(this, $scope, QualityService, dataItems);
});
