OCCModule.factory('QualityService', function ($resource, LanguageSelection) {
    return OCCModule.CrudService($resource, 'quality', LanguageSelection);
});