OCCModule.controller('EpochController', function ($scope, $injector, EpochService, dataItems) {
    $scope.title = 'Epochs';
    var toColumn = new String('endYear');
    toColumn.isOptional = true;
    $scope.data = { columns: ['name', 'startYear', toColumn], columnTitles: ['Name', 'From', 'To']};
    $scope.filterByTerritory = true;

    $injector.invoke(OCCModule.CrudBase, this, {$scope: $scope, service: EpochService, dataItems: dataItems});
});
