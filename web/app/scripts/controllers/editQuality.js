OCCModule.controller('QualityController', function ($scope, $resource) {
    $scope.title = 'Minting qualities';
    $scope.data = { columns: ['name', 'abbr'], columnTitles: ['Name', 'Abbreviation']};

    OCCModule.CrudBase.call(this, $scope, 'quality', $resource);
});
