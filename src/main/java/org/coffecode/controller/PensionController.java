package org.coffecode.controller;

import org.coffecode.model.InputData;
import org.coffecode.model.Pension;
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

    @PostConstruct
    public void initialize() {
        this.pension = new Pension.PensionBuilder(100000, 10, 0.0445)
                .withCapitalization(12)
                .withBelkaTax(false)
                .withInflationRate(0.0051)
                .build();
    }

    @RequestMapping(value = "demo/getdata", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
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

    @RequestMapping(value = "demo/submit", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
    public ResponseEntity<?> checkFlight(@RequestBody InputData inputData) {
        this.inputData = new InputData();
        this.inputData.setFutureValue(inputData.getFutureValue());
        this.inputData.setYearsOfSavings(inputData.getYearsOfSavings());
        this.inputData.setReturnOnCapital(inputData.getReturnOnCapital()/100);
        this.inputData.setInflationRate(inputData.getInflationRate()/100);
        return new ResponseEntity<String>(HttpStatus.CREATED);
    }
}
