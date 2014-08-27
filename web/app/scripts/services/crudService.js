OCCModule.CrudService = function($resource, name, Settings) {
    return $resource('http://localhost:8080/occ/rest/' + name + '/:id', {
        id: '@id',
        lang: Settings.getLanguageCode,
        territory: Settings.getTerritoryId
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