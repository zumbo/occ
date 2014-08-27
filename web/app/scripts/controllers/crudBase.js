OCCModule.CrudBase = function ($scope, service, dataItems, Settings) {
    var columns = $scope.data.columns;

    function isValid() {
        var valid = true;
        for (var i = 0; i < columns.length; i++) {
            var column = columns[i];
            if (!column.isOptional) {
                valid &= !!this[column];
            }
        }
        return valid;
    }

    function onLoaded() {
        for (var i = 0; i < $scope.data.items.length; i++) {
            var item = $scope.data.items[i];
            item.isEditing = false;
            item.isValid = isValid;
        }
    }

    $scope.reload = function () {
        $scope.data.items = service.load(onLoaded);
    }
    $scope.data.items = dataItems;
    $scope.data.items.$promise.then(onLoaded());

    $scope.data.newLine = { isValid: isValid };

    for (var i = 0; i < columns.length; i++) {
        $scope.data.newLine[columns[0]] = "";
    }

    $scope.territoryNotSet = function () {
        return $scope.filterByTerritory && !Settings.getTerritory();
    };

    $scope.edit = function (index, event) {
        var item = $scope.data.items[index];
        item.isEditing = true;
        for (var i = 0; i < columns.length; i++) {
            item['old' + columns[i]] = item[columns[i]];
        }

        var focusCell;
        if (event && event.target) {
            focusCell = event.target;
        }
        else {
            focusCell = document.querySelector('#row' + item.id + ' span');
        }
        setTimeout(function () {
            focusCell.focus();
        }, 0);
    }
    $scope.cancel = function (index) {
        var item = $scope.data.items[index];
        item.isEditing = false;
        for (var i = 0; i < columns.length; i++) {
            item[columns[i]] = item['old' + columns[i]];
        }
    }
    $scope.save = function (index) {
        var item = $scope.data.items[index];
        if (!item.isValid()) return;
        item.isEditing = false;
        for (var i = 0; i < columns.length; i++) {
            delete item['old' + columns[i]];
        }
        service.update(item);
    }
    $scope.delete = function (index) {
        var item = $scope.data.items[index];
        var confirmed = window.confirm('Are you absolutely sure you want to delete ' + item.name + '?');
        if (!confirmed) return;
        $scope.data.items.splice(index,  1);
        service.remove({id: item.id});
    }
    $scope.saveNewLine = function () {
        var newLine = $scope.data.newLine;
        var insertItem = JSON.parse(JSON.stringify(newLine));
        insertItem.isValid = isValid;
        insertItem.language = Settings.getLanguageCode();
        if ($scope.filterByTerritory) {
            insertItem.territory = Settings.getTerritory();
        }
        if (!insertItem.isValid()) return;

        service.save(insertItem, function (value) {
            insertItem.id = value;
            $scope.data.items.push(insertItem);
            for (var i = 0; i < columns.length; i++) {
                newLine[columns[i]] = '';
            }
            setTimeout(function () {
                var firstCell = document.querySelector('#newLine span');
                firstCell.focus();
            }, 0);
        });
    }

    $scope.onKey = function (event, index) {
        if (event.keyCode == 27) {
            if (index != "newLine")
                $scope.cancel(index);
        }
        else if (event.keyCode == 13) {
            if (index == "newLine")
                $scope.saveNewLine();
            else
                $scope.save(index);
        }
    }
}
