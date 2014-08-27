OCCModule.controller('MetalController', function ($scope, MetalService, dataItems, LanguageSelection) {
    $scope.title = 'Metals';
    $scope.data = { columns: ['name', 'abbr'], columnTitles: ['Name', 'Abbreviation']};

    OCCModule.CrudBase.call(this, $scope, MetalService, dataItems, LanguageSelection);
});




