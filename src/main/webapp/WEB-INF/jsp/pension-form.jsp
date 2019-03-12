<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>coffeecoding.net</title>
    <meta name="description"
          content="Free open source projects present different java solutions using spring, hibernate and other popular frameworks.">
    <meta name="keywords"
          content="java, spring, hibernate, apache, tomcat, coding, programmer, linux, google cloud platform, open source, bootstrap, mysql, java ideas">
    <!-- CSS dependencies -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.standalone.min.css">
    <link rel="stylesheet" href="https://www.coffeecoding.net/resources/css/now-ui-kit.css" type="text/css">
    <link rel="stylesheet" href="https://www.coffeecoding.net/resources/css/style.css" type="text/css">
    <link rel="icon" href="resources/img/favicon.png">
    <!-- PAGE scripts -->
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.min.js"></script>
    <script src="resources/js/functions.js"></script>
    <script src="//cdn.zingchart.com/zingchart.min.js"></script>
    <script src="//cdn.zingchart.com/angular/zingchart-angularjs.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.js"></script>
</head>


<body ng-app="Chart" ng-controller="MainController" class="bg-light text-dark" style="">
<div id="wrap">
    <div id="main" class="clear-top">


        <div class="collapse" id="navbarHeader">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 py-4">
                        <h4>About</h4>
                        <p class="text-info">Free open source projects present different java solutions using spring,
                            hibernate
                            and other popular frameworks.</p>
                    </div>
                    <div class="col-md-3 offset-md-1 py-4">
                        <h4>Contact</h4>
                        <ul class="list-unstyled">
                            <li>
                                <a href="https://pl.linkedin.com/in/michalsiwiak" class="text-secondary"
                                   target="_blank">Follow
                                    on LinkedIn</a>
                            </li>
                            <li>
                                <a href="mailto:info@coffeecoding.net" target="_top" class="text-secondary">Email me</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <div class="navbar sticky-top navbar-dark bg-info">
            <div class="container d-flex justify-content-between">
                <a href="https://www.coffeecoding.net/" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-home fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">
                    HOME
                </text>
                </a>
                <a href="https://github.com/MichalSiwiak/pension-calculator" target="_blank"
                   class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-git-square fa-fw d-inline-block lead fa-2x"></i>&nbsp;&nbsp;<text class="">SOURCE
                    CODE
                </text>
                </a>
                <a href="${pageContext.request.contextPath}" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-file-text fa-2x fa-fw lead d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">DESCRIPTION
                </text>
                </a>
                <a href="https://coffeecoding.net/resources/img/cv_msiwiak.pdf" target="_blank"
                   class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-address-card fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">RESUME
                </text>
                </a>
                <a href="/contact" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-envelope fa-2x lead fa-fw d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">CONTACT
                </text>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader"><span
                        class="navbar-toggler-icon"></span></button>
            </div>
        </div>


        <div class="text-center py-4 bg-secondary"
             style="	background-image: linear-gradient(to left, rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.9));	background-position: top left;	background-size: 100%;	background-repeat: repeat;">
            <div class="container">
                <div class="row">
                    <div class="col-md-0 text-left">
                        <h1 class="text-left text-primary">Pension Calculator</h1>
                        <p class="lead text-left">Calculation of annuity based on future value and interest rate.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row my-3 text-dark">
            <div class="container w-50">
                <form ng-submit="submitData()">
                    <div class="row">
                        <div class="col-md-6 p-3 text-center w-75 mx-auto">
                            <div class="form-group text-center">
                                <label>What amount do you want to get in the future?</label>
                                <input type="number" min="1" max="1000000000" step="1" ng-model="form.futureValue"
                                       class="form-control text-center text-dark" required="required">
                            </div>
                            <div class="form-group">
                                <label>For how many years do you want to withdraw your savings?</label>
                                <input type="number" min="1" max="65" step="1" ng-model="form.yearsOfSavings"
                                       class="form-control text-center text-dark" required="required">
                            </div>
                        </div>
                        <div class="col-md-6 p-3 text-center mx-auto w-50">
                            <div class="form-group text-center">
                                <label>Estimated rate of return on capital building</label>
                                <input type="number" min="0.01" max="20" step="0.01" ng-model="form.returnOnCapital"
                                       class="form-control text-center text-dark" required="required">
                            </div>
                            <div class="form-group">
                                <label>Average inflation rate</label>
                                <input type="number" min="0.01" max="10" step="0.01" ng-model="form.inflationRate"
                                       class="form-control text-center text-dark" required="required">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <button type="submit" class="btn btn-primary">Execute calculation</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="row my-4 text-dark">
            <div class="container p-0">
                <div class="row">
                    <div class="col-md-12" style="">
                        <table class="table text-center text-dark">
                            <tbody class="">
                            <tr>
                                <td class="text-left">Amount to be collected:</td>
                                <td>{{ (jsondata.futureValue | number:2) + " zł"}}</td>
                            </tr>
                            <tr>
                                <td class="text-left">Total payments:</td>
                                <td>{{(jsondata.totalAmountOfDeposits | number:2) + " zł"}}</td>
                            </tr>
                            <tr>
                                <td class="text-left">Interest:</td>
                                <td>{{(jsondata.totalInterests | number:2) + " zł"}}</td>
                            </tr>
                            <tr>
                                <td class="text-left">Monthly contribution for reach expected savings:</td>
                                <td class="text-success">{{(jsondata.payment | number:2) + " zł"}}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-light ">
            <div class="container mb-5">
                <div class="row">
                    <div class="col-md-12">
                        <p class="lead text-center text-dark">Graph of accumulated capital</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div zingchart id="chart-1" zc-json="myJson" zc-width="100%" zc-height="568px"></div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>


<footer class="footer bg-dark text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
        <p>© Copyright 2018 coffeecoding.net - All rights reserved.<br>Contact: info@coffeecoding.net<br>Warsaw PL<br><a
                href="https://www.coffeecoding.net/">Visit the homepage</a>
        </p>
    </div>
</footer>


</body>
</html>