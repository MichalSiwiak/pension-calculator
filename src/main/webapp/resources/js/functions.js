var app = angular.module('Chart', ['zingchart-angularjs'])

    .filter('percentage', ['$filter', function ($filter) {
        return function (input, decimals) {
            return $filter('number')(input * 100, decimals) + '%';
        };
    }]);


app.controller('MainController', function ($scope, $http) {


    //Initialize values
    $scope.form = {
        futureValue: 100000,
        yearsOfSavings: 10,
        returnOnCapital: 4.45,
        inflationRate: 0.51
    };
    _draw_chart();
    _refreshPageData();


    //HTTP GET methods
    function _refreshPageData() {
        $http.get('/pension/getdata')
            .then(function (response) {
                $scope.jsondata = response.data;
                $scope.myJson.series[0].values = response.data.depositsList;
                $scope.myJson.series[1].values = response.data.accumulatedCapitalsList;
                $scope.myJson.scaleX.values = response.data.yearList;
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
            url: '/pension/submit',
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

    //Drawing chart
    function _draw_chart() {


        $scope.myJson = {
            gui: {
                contextMenu: {
                    button: {
                        visible: 0
                    }
                }
            },
            backgroundColor: "#434343",
            globals: {
                shadow: false,
                fontFamily: "Helvetica"
            },
            type: "area",

            legend: {
                layout: "x4",
                backgroundColor: "transparent",
                borderColor: "transparent",
                marker: {
                    borderRadius: "50px",
                    borderColor: "transparent"
                },
                item: {
                    fontColor: "white"
                }

            },
            scaleX: {
                transform: {
                    type: 'number'
                },
                zooming: true,
                values: [],
                lineColor: "white",
                lineWidth: "1px",
                tick: {
                    lineColor: "white",
                    lineWidth: "1px"
                },
                item: {
                    fontColor: "white"
                },
                guide: {
                    visible: false
                }
            },
            scaleY: {
                lineColor: "white",
                lineWidth: "1px",
                tick: {
                    lineColor: "white",
                    lineWidth: "1px"
                },
                guide: {
                    lineStyle: "solid",
                    lineColor: "#626262"
                },
                item: {
                    fontColor: "white"
                },
            },
            tooltip: {
                visible: false
            },
            crosshairX: {
                scaleLabel: {
                    backgroundColor: "#fff",
                    fontColor: "black"
                },
                plotLabel: {
                    backgroundColor: "#434343",
                    fontColor: "#FFF",
                    "thousands-separator": ",",
                    _text: "Number of hits : %v"
                }
            },
            plot: {
                lineWidth: "2px",
                marker: {
                    visible: false
                }
            },
            series: [{
                text: "Suma wpłat",
                values: [],
                backgroundColor1: "#4AD8CC",
                backgroundColor2: "#272822",
                lineColor: "#4AD8CC"
            }, {
                text: "Zgromadzony kapitał",
                values: [],
                backgroundColor1: "#D8CD98",
                backgroundColor2: "#272822",
                lineColor: "#D8CD98"
            }]
        };

    }

});