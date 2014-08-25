OCCModule.controller('GradeController', function ($scope, $resource) {
    $scope.title = 'Grades';
    $scope.data = { columns: ['name', 'abbr'], columnTitles: ['Name', 'Abbreviation']};

    OCCModule.CrudBase.call(this, $scope, 'grade', $resource);
});
