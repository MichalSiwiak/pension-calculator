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
                    1442934000000, 1442937600000,
                    1442941200000, 1442944800000,
                    1442948400000
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
                    7012, 10389, 20281,
                    25597, 23309, 22385,
                    25097, 20813, 20510
                ],
                backgroundColor1: "#77d9f8",
                backgroundColor2: "#272822",
                lineColor: "#40beeb"
            }, {
                text: "Site 1",
                values: [479, 199, 583,
                    1624, 2772, 7899,
                    3467, 3227, 12885,
                    17873, 14420, 12569,
                    17721, 11569, 7362
                ],
                backgroundColor1: "#4AD8CC",
                backgroundColor2: "#272822",
                lineColor: "#4AD8CC"
            }, {
                text: "Site 2",
                values: [989, 1364, 2161,
                    2644, 1754, 2015,
                    818, 77, 1260,
                    3912, 1671, 1836,
                    2589, 1706, 1161
                ],
                backgroundColor1: "#1D8CD9",
                backgroundColor2: "#1D8CD9",
                lineColor: "#1D8CD9"
            }, {
                text: "Site 3",
                values: [408, 343, 410,
                    840, 1614, 3274,
                    2092, 914, 5709,
                    6317, 6633, 6720,
                    6504, 6821, 4565
                ],
                backgroundColor1: "#D8CD98",
                backgroundColor2: "#272822",
                lineColor: "#D8CD98"
            }]
        }
    };
});