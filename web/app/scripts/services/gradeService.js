OCCModule.factory('GradeService', function ($resource, LanguageSelection) {
    return OCCModule.CrudService($resource, 'grade', LanguageSelection);
});
