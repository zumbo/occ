var OCCModule = angular.module('OCC', [ 'ngResource', 'ngRoute' ]);

OCCModule.config(['$routeProvider', '$httpProvider',
    function ($routeProvider, $httpProvider) {
        $routeProvider
            .when('/grade', {
                templateUrl: '../partials/crudLanguageView.html',
                controller: 'GradeController',
                resolve: {
                    dataItems: function(GradeService) {
                        return GradeService.load();
                    }
                }
            })
            .when('/metal', {
                templateUrl: '../partials/crudLanguageView.html',
                controller: 'MetalController',
                resolve: {
                    dataItems: function(MetalService) {
                        return MetalService.load();
                    }
                }
            })
            .when('/quality', {
                templateUrl: '../partials/crudLanguageView.html',
                controller: 'QualityController',
                resolve: {
                    dataItems: function(QualityService) {
                        return QualityService.load();
                    }
                }
            })
            .when('/mintmark', {
                templateUrl: '../partials/crudTerritoryView.html',
                controller: 'MintmarkController',
                resolve: {
                    dataItems: function(MintmarkService) {
                        return MintmarkService.load();
                    }
                }
            })
            .when('/epoch', {
                templateUrl: '../partials/crudTerritoryView.html',
                controller: 'EpochController',
                resolve: {
                    dataItems: function(EpochService) {
                        return EpochService.load();
                    }
                }
            })
            .otherwise({
                templateUrl: '../partials/home.html'
            });
        $httpProvider.defaults.useXDomain = true;
        delete $httpProvider.defaults.headers.common['X-Requested-With'];
    }
]);




