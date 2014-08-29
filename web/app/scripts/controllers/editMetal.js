OCCModule.controller('MetalController', function ($scope, $injector, MetalService, dataItems) {
    $scope.title = 'Metals';
    $scope.data = { columns: ['name', 'abbr'], columnTitles: ['Name', 'Abbreviation']};

    $injector.invoke(OCCModule.CrudBase, this, {$scope: $scope, service: MetalService, dataItems: dataItems});
});




