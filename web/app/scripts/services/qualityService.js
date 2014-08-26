OCCModule.factory('QualityService', function ($resource) {
    return OCCModule.CrudService($resource, 'quality');
});