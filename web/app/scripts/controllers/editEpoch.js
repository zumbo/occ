OCCModule.controller('EpochController', function ($scope, $resource) {
    $scope.title = 'Epochs';
    var toColumn = new
        String('endYear');
    toColumn.isOptional = true;
    $scope.data = { columns: ['name', 'startYear', toColumn], columnTitles: ['Name', 'From', 'To']};
    $scope.filterByTerritory = true;

    OCCModule.CrudBase.call(this, $scope, 'epoch', $resource);
});
