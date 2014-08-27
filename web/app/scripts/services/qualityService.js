OCCModule.factory('QualityService', function ($resource, Settings) {
    return OCCModule.CrudService($resource, 'quality', Settings);
});