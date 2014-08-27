OCCModule.factory('MintmarkService', function ($resource, Settings) {
    return OCCModule.CrudService($resource, 'mintmark', Settings);
});
