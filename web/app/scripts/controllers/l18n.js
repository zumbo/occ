OCCModule.controller('L18n', function ($scope, $route, $locale, Settings) {
    $scope.languages = Settings.languages;
    $scope.displayLanguage = function (displayLanguage) {
        if (angular.isDefined(displayLanguage)) {
            Settings.setLanguage(displayLanguage);
        }
        return Settings.getLanguage();
    };

    $scope.update = function () {
        $locale.id = $scope.displayLanguage().code;
        $scope.reload();
    };
});
