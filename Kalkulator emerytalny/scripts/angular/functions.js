var myApp = angular.module('myApp', []);
myApp.controller('myController', function ($scope) {

    //Initialize page with default data which is blank in this example
    $scope.slider = {
        minValue: 10,
        maxValue: 90,
        options: {
            floor: 0,
            ceil: 100,
            step: 1
        }
    };
});