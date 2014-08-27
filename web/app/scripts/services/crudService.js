OCCModule.CrudService = function($resource, name, LanguageSelection) {
    console.log(LanguageSelection);
    return $resource('http://localhost:8080/occ/rest/' + name + '/:id', {
        id: '@id',
        lang: LanguageSelection.getSelectionCode,
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