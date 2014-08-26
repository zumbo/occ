OCCModule.factory('EpochService', function ($resource) {
    return OCCModule.CrudService($resource, 'epoch');
});
