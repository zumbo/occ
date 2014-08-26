OCCModule.factory('GradeService', function ($resource) {
    return OCCModule.CrudService($resource, 'grade');
});
