OCCModule.controller('GradeController', function ($scope, $injector, GradeService, dataItems) {
    $scope.title = 'Grades';
    $scope.data = { columns: ['name', 'abbr'], columnTitles: ['Name', 'Abbreviation']};

    $injector.invoke(OCCModule.CrudBase, this, {$scope: $scope, service: GradeService, dataItems: dataItems});
});
