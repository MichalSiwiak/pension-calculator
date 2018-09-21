package pl.javacoding.pensioncalculator.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.javacoding.pensioncalculator.model.Pension;

import javax.annotation.PostConstruct;

@Controller
public class PensionController {

    private Pension pension;

    @PostConstruct
    public void initialize() {
        this.pension = new Pension.PensionBuilder(100000, 10, 0.05)
                .withCapitalization(12)
                .build();
    }

    @RequestMapping(value = "/getdata", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
    public ResponseEntity<?> getGeoCoordinates() {
        return new ResponseEntity<Pension>(pension, HttpStatus.OK);
    }
}
