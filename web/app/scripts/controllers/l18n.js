OCCModule.controller('L18n', function ($scope, $route, $locale) {
    $scope.languages = [
        {name: "English", code: "en"},
        {name: "Deutsch", code: "de"}
    ];
    $scope.displayLanguage = $scope.languages[0];
    $scope.update = function() {
        $locale.id = $scope.displayLanguage.code;
        $scope.reload();
    };
});
