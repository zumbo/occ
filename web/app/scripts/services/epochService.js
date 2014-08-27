OCCModule.factory('EpochService', function ($resource, LanguageSelection) {
    return OCCModule.CrudService($resource, 'epoch', LanguageSelection);
});
