OCCModule.factory('GradeService', function ($resource, Settings) {
    return OCCModule.CrudService($resource, 'grade', Settings);
});
