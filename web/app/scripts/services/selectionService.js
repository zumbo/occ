OCCModule.factory('LanguageSelection', function () {
    var languages = [
        {name: "English", code: "en"},
        {name: "Deutsch", code: "de"}
    ];
    var selection = languages[0];
    return {
        languages: languages,
        getSelection: function() { return selection; },
        getSelectionCode: function() { return selection.code; },
        setSelection: function(newSelection) { selection = newSelection; }
    };
})