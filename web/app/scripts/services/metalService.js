OCCModule.factory('MetalService', function ($resource) {
    return OCCModule.CrudService($resource, 'metal');
});