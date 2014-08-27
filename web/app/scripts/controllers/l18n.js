OCCModule.controller('L18n', function ($scope, $route, $locale, LanguageSelection) {
    $scope.languages = LanguageSelection.languages;
    $scope.displayLanguage = function (displayLanguage) {
        if (angular.isDefined(displayLanguage)) {
            LanguageSelection.setSelection(displayLanguage);
        }
        return LanguageSelection.getSelection();
    };

    $scope.update = function () {
        $locale.id = $scope.displayLanguage().code;
        $scope.reload();
    };
});
