OCCModule.controller('MetalController', function ($scope, $resource) {
    $scope.title = 'Metals';
    $scope.data = { columns: ['name', 'abbr'], columnTitles: ['Name', 'Abbreviation']};
    OCCModule.CrudBase.call(this, $scope, 'metal', $resource);
});




