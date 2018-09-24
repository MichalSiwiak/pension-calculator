var myApp = angular.module('Pension', []);
myApp.controller('myController', function ($scope, $http) {

    //Initialize page with default data which is blank in this example
    $scope.form = {
        futureValue: "100000",
        yearsOfSavings: "10",
        returnOnCapital: "0.05",
        inflationRate: "0.02"
    };

    _refreshPageData();

    //HTTP GET methods
    function _refreshPageData() {
        $http.get('getdata')
            .then(function (response) {
                $scope.jsondata = response.data;
                console.log("status:" + response.status);
            }).catch(function (response) {
            console.error('Error occurred:', response.status, response.data);
        }).finally(function () {
            console.log("Task Finished.");
        });
    }

    //HTTP POST methods
    $scope.submitData = function () {
        $http({
            method: "POST",
            url: 'submit',
            data: angular.toJson($scope.form),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(_success, _error);
    };

    function _success(response) {
        _refreshPageData();
        //_clearForm()
    }

    function _error(response) {
        console.log(response.statusText);
    }

    //Clear the form
    function _clearForm() {
        $scope.form.futureValue = "";
        $scope.form.yearsOfSavings = "";
        $scope.form.returnOnCapital = "";
        $scope.form.inflationRate = "";
    };


});