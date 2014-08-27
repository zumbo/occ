OCCModule.factory('EpochService', function ($resource, Settings) {
    return OCCModule.CrudService($resource, 'epoch', Settings);
});
