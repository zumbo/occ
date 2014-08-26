OCCModule.controller('GradeController', function ($scope, GradeService, dataItems) {
    $scope.title = 'Grades';
    $scope.data = { columns: ['name', 'abbr'], columnTitles: ['Name', 'Abbreviation']};

    OCCModule.CrudBase.call(this, $scope, GradeService, dataItems);
});
