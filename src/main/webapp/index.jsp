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


<body class="bg-light text-dark">
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
                <a href="${pageContext.request.contextPath}/demo" class="navbar-brand d-flex align-items-center"><i
                        class="fa fa-desktop fa-2x fa-fw lead d-inline-block" aria-hidden="true"></i>&nbsp;&nbsp;<text
                        class="">DEMO VIEW
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

        <div class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="text-left">Pension Calculator</h1>
                        <hr>
                        <h5>The program calculates the pension using the standard formula of annuity-immediate <a
                                href="https://en.wikipedia.org/wiki/Annuity" target="_blank">(the exact formula
                            here)</a>. The algorithm
                            includes Belka tax of 19% and Inflation rate. <br>The customer determines what amount he
                            would like to receive in the future, how many years he intends to save with the assumed rate
                            of return.</h5>
                        <h5>The application supports operations:</h5>
                        <h5>
                            <ul>
                                <li>calculation of the pension</li>
                                <li>sharing API</li>
                                <li>presenting data on the chart using AngularJS Charts</li>
                            </ul>
                        </h5>
                        <h5><b>Back End: </b>Java, Spring MVC, Spring Web Services.</h5>
                        <h5><b>Front End: </b>AngularJS, HTML, CSS.</h5>
                        <h5>To run application: git clone
                            https://github.com/MichalSiwiak/pension-calculator.git,
                            upload and run application using tomcat application server or similar.</h5>
                        <h5>Demo View: <a href="https://www.coffeecoding.net/pension/demo">https://www.coffeecoding.net/pension/demo</a>
                        </h5>
                    </div>
                </div>
                <h5 class="mb-3">Controller class:</h5>
                <pre><code class="java">
package net.coffeecoding.controller;

import net.coffeecoding.model.InputData;
import net.coffeecoding.model.Pension;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.PostConstruct;

@Controller
public class PensionController {

    private Pension pension;
    private InputData inputData;

    @GetMapping("/demo")
    public String getDemo() {
        return "pension-form";
    }

    @GetMapping("/error")
    public String showErrorPage() {
        return "error-page";
    }

    @PostConstruct
    public void initialize() {
        this.pension = new Pension.PensionBuilder(100000, 10, 0.0445)
                .withCapitalization(12)
                .withBelkaTax(false)
                .withInflationRate(0.0051)
                .build();
    }

    @RequestMapping(value = "/getdata", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
    public ResponseEntity<?> getPension() {
        if (inputData != null) {
            pension = new Pension.PensionBuilder(inputData.getFutureValue(), inputData.getYearsOfSavings(), inputData.getReturnOnCapital())
                    .withCapitalization(12)
                    .withBelkaTax(false)
                    .withInflationRate(inputData.getInflationRate())
                    .build();
        }
        return new ResponseEntity<>(pension, HttpStatus.OK);
    }

    @RequestMapping(value = "/submit", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
    public ResponseEntity<?> checkFlight(@RequestBody InputData inputData) {
        this.inputData = new InputData();
        this.inputData.setFutureValue(inputData.getFutureValue());
        this.inputData.setYearsOfSavings(inputData.getYearsOfSavings());
        this.inputData.setReturnOnCapital(inputData.getReturnOnCapital() / 100);
        this.inputData.setInflationRate(inputData.getInflationRate() / 100);
        return new ResponseEntity<String>(HttpStatus.CREATED);
    }
}

</code></pre>
                <h5 class="mb-3">Model class:</h5>
                <pre><code class="java">
package net.coffeecoding.model;

import java.util.ArrayList;
import java.util.List;

public class Pension {

    //input data
    private double futureValue;
    private int yearsOfSavings;
    private double returnOnCapital;
    private int capitalization;
    //calculated data
    private double nominalInterestRate;
    private double payment;
    private double totalAmountOfDeposits;
    private List<Double> depositsList;
    private double totalInterests;
    private List<Double> accumulatedCapitalsList;
    private List<Integer> yearList;
    private boolean belkaTax;
    private double inflationRate;

    private Pension(final PensionBuilder pensionBuilder) {
        //optional data
        this.inflationRate = pensionBuilder.inflationRate;
        //input data required
        this.yearsOfSavings = pensionBuilder.yearsOfSavings;
        this.futureValue = pensionBuilder.futureValue * Math.pow(1 + inflationRate, yearsOfSavings);
        this.returnOnCapital = pensionBuilder.returnOnCapital;
        //optional data
        this.capitalization = pensionBuilder.capitalization;
        this.belkaTax = pensionBuilder.belkaTax;
        //calculated data
        this.nominalInterestRate = calculateNominalInterestRate();
        this.payment = calculatePayment();
        this.depositsList = calculateDepositsList();
        this.accumulatedCapitalsList = calculateAccumulatedCapitalsList();
    }


    public double calculateNominalInterestRate() {
        nominalInterestRate = Math.pow(1 + returnOnCapital, (double) 1 / capitalization) - 1;
        if (belkaTax) {
            return nominalInterestRate * 0.81;
        } else {
            return nominalInterestRate;
        }

    }

    public double calculatePayment() {
        payment = futureValue / (((Math.pow(nominalInterestRate + 1, capitalization * yearsOfSavings) - 1) / nominalInterestRate) * (1 + nominalInterestRate));
        return payment;
    }

    public List<Double> calculateDepositsList() {
        depositsList = new ArrayList<>(yearsOfSavings);
        yearList = new ArrayList<>();
        for (int year = 1; year <= yearsOfSavings; year++) {
            double sumOfFunds = 12 * year * payment;
            depositsList.add((double) Math.round(sumOfFunds));
            yearList.add(year);
            totalAmountOfDeposits = +sumOfFunds;
        }
        return depositsList;
    }

    public List<Double> calculateAccumulatedCapitalsList() {
        accumulatedCapitalsList = new ArrayList<>(yearsOfSavings);
        for (int year = 1; year <= yearsOfSavings; year++) {
            double sumOfFunds = payment * (((Math.pow(nominalInterestRate + 1, capitalization * year) - 1) / nominalInterestRate) * (1 + nominalInterestRate));
            accumulatedCapitalsList.add((double) Math.round(sumOfFunds));
        }
        totalInterests = +futureValue - totalAmountOfDeposits;
        return accumulatedCapitalsList;
    }

    public double getFutureValue() {
        return futureValue;
    }

    public int getYearsOfSavings() {
        return yearsOfSavings;
    }

    public double getReturnOnCapital() {
        return returnOnCapital;
    }

    public int getCapitalization() {
        return capitalization;
    }

    public double getNominalInterestRate() {
        return nominalInterestRate;
    }

    public double getPayment() {
        return payment;
    }

    public double getTotalAmountOfDeposits() {
        return totalAmountOfDeposits;
    }

    public List<Double> getDepositsList() {
        return depositsList;
    }

    public double getTotalInterests() {
        return totalInterests;
    }

    public boolean isBelkaTax() {
        return belkaTax;
    }

    public double getInflationRate() {
        return inflationRate;
    }

    public List<Double> getAccumulatedCapitalsList() {
        return accumulatedCapitalsList;
    }

    public List<Integer> getYearList() {
        return yearList;
    }

    @Override
    public String toString() {
        return "Pension{" +
                "futureValue=" + futureValue +
                ", yearsOfSavings=" + yearsOfSavings +
                ", returnOnCapital=" + returnOnCapital +
                ", capitalization=" + capitalization +
                ", nominalInterestRate=" + nominalInterestRate +
                ", payment=" + payment +
                ", totalAmountOfDeposits=" + totalAmountOfDeposits +
                ", depositsList=" + depositsList +
                ", totalInterests=" + totalInterests +
                ", accumulatedCapitalsList=" + accumulatedCapitalsList +
                ", yearList=" + yearList +
                ", belkaTax=" + belkaTax +
                ", inflationRate=" + inflationRate +
                '}';
    }

    public static class PensionBuilder {
        private final double futureValue;
        private final int yearsOfSavings;
        private final double returnOnCapital;
        private int capitalization;
        private boolean belkaTax;
        private double inflationRate;

        public PensionBuilder(final double futureValue, final int yearsOfSavings, final double returnOnCapital) {
            this.futureValue = futureValue;
            this.yearsOfSavings = yearsOfSavings;
            this.returnOnCapital = returnOnCapital;
        }

        public PensionBuilder withCapitalization(final int capitalization) {
            this.capitalization = capitalization;
            return this;
        }

        public PensionBuilder withBelkaTax(final boolean belkaTax) {
            this.belkaTax = belkaTax;
            return this;
        }

        public PensionBuilder withInflationRate(final double inflationRate) {
            this.inflationRate = inflationRate;
            return this;
        }

        public Pension build() {
            return new Pension(this);
        }
    }
}
</code></pre>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.11.0/highlight.min.js"></script>
                <script>
                    hljs.initHighlightingOnLoad();
                </script>
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