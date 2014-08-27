OCCModule.factory('MintmarkService', function ($resource, LanguageSelection) {
    return OCCModule.CrudService($resource, 'mintmark', LanguageSelection);
});
