OCCModule.controller('QualityController', function ($scope, QualityService, dataItems, Settings) {
    $scope.title = 'Minting qualities';
    $scope.data = { columns: ['name', 'abbr'], columnTitles: ['Name', 'Abbreviation']};

    OCCModule.CrudBase.call(this, $scope, QualityService, dataItems, Settings);
});
