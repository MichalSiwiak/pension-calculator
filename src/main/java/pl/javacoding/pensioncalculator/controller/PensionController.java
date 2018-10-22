package pl.javacoding.pensioncalculator.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.javacoding.pensioncalculator.model.InputData;
import pl.javacoding.pensioncalculator.model.Pension;

import javax.annotation.PostConstruct;

@Controller
public class PensionController {

    private Pension pension;
    private InputData inputData;

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
        return new ResponseEntity<Pension>(pension, HttpStatus.OK);
    }

    @RequestMapping(value = "/submit", consumes = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
    public ResponseEntity<?> checkFlight(@RequestBody InputData inputData) {
        this.inputData = new InputData();
        this.inputData.setFutureValue(inputData.getFutureValue());
        this.inputData.setYearsOfSavings(inputData.getYearsOfSavings());
        this.inputData.setReturnOnCapital(inputData.getReturnOnCapital()/100);
        this.inputData.setInflationRate(inputData.getInflationRate()/100);
        return new ResponseEntity<String>(HttpStatus.CREATED);
    }
}
