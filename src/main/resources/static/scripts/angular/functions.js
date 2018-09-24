var app = angular.module('Chart', ['zingchart-angularjs']);
app.controller('MainController', function ($scope, $http) {


    //Initialize page with default data which is blank in this example
    $scope.form = {
        futureValue: "100000",
        yearsOfSavings: "10",
        returnOnCapital: "0.05",
        inflationRate: "0.02"
    };

    _refreshPageData();
    _drawChart();

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

    function _drawChart() {
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
                maxItems: 8,
                transform: {
                    type: 'date'
                },
                zooming: true,
                values: [
                    1442905200000, 1442908800000,
                    1442912400000, 1442916000000,
                    1442919600000, 1442923200000,
                    1442926800000, 1442930400000,
                    1442934000000, 1442937600000
                ],
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
                    _text: "Number of hits : %v"
                }
            },
            plot: {
                lineWidth: "2px",
                aspect: "spline",
                marker: {
                    visible: false
                }
            },
            series: [{
                text: "All Sites",
                values: [2596, 2626, 4480,
                    6394, 7488, 14510,
                    7012, 10389, 40000,
                    50000
                ],
                backgroundColor1: "#77d9f8",
                backgroundColor2: "#272822",
                lineColor: "#40beeb"
            }]
        }
    };
});