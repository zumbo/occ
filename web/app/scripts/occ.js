var OCCModule = angular.module('OCC', [ 'ngResource', 'ngRoute', /*, 'angucomplete-alt'*/ ]).
    run(function ($locale, $controller) {
        $locale.id = 'en';
        OCCModule.getLanguage = function () {
            if ($locale && $locale.id && $locale.id.length >= 2) {
                return $locale.id.substr(0, 2);
            }
            return 'en';
        }
        OCCModule.getTerritory = function () {
            if (OCCModule.selectedTerritory) {
                return OCCModule.selectedTerritory.id;
            }
        }
    });

OCCModule.config(['$routeProvider', '$httpProvider', function ($routeProvider, $httpProvider) {
    $routeProvider
        .when('/grade', {
            templateUrl: '../partials/crudLanguageView.html',
            controller: 'GradeController'
        })
        .when('/metal', {
            templateUrl: '../partials/crudLanguageView.html',
            controller: 'MetalController'
        })
        .when('/quality', {
            templateUrl: '../partials/crudLanguageView.html',
            controller: 'QualityController'
        })
        .when('/mintmark', {
            templateUrl: '../partials/crudTerritoryView.html',
            controller: 'MintmarkController'
        })
        .when('/epoch', {
            templateUrl: '../partials/crudTerritoryView.html',
            controller: 'EpochController'
        })
        .otherwise({
            templateUrl: '../partials/home.html'
        });
    $httpProvider.defaults.useXDomain = true;
    delete $httpProvider.defaults.headers.common['X-Requested-With'];
}
]);



