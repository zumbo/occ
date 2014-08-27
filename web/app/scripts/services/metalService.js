OCCModule.factory('MetalService', function ($resource, LanguageSelection) {
    return OCCModule.CrudService($resource, 'metal', LanguageSelection);
});