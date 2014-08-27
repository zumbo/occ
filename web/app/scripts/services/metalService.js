OCCModule.factory('MetalService', function ($resource, Settings) {
    return OCCModule.CrudService($resource, 'metal', Settings);
});