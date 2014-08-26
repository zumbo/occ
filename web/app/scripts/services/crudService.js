OCCModule.CrudService = function($resource, name) {
    return $resource('http://localhost:8080/occ/rest/' + name + '/:id', {
        id: '@id',
        lang: OCCModule.getLanguage,
        territory: OCCModule.getTerritory
    }, {
        load: {
            method: 'GET',
            isArray: true
        },
        update: {
            method: 'PUT'
        },
        save: {
            method: 'POST',
            isArray: false,
            interceptor: {
                response: function (response) {
                    return response.data;
                }
            }
        }
    });
};