OCCModule.factory('MintmarkService', function ($resource) {
    return OCCModule.CrudService($resource, 'mintmark');
});
