OCCModule.directive('contenteditable', ['$sce', function ($sce) {
    return {
        restrict: 'A',
        require: '?ngModel',
        link: function (scope, element, attrs, ngModel) {
            if (!ngModel) return;

            ngModel.$render = function () {
//                element.html($sce.getTrustedHtml(ngModel.$viewValue || ''));
                element.html(ngModel.$viewValue || '');
            };

            element.on('blur keyup change', function () {
                scope.$apply(read);
            });
            ngModel.$render();

            // Write data to the model
            function read() {
                var html = element.html();
                if (html == '<br>') {
                    html = '';
                }
                ngModel.$setViewValue(html);
            }
        }
    }
}]);

