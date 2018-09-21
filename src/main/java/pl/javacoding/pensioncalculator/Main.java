package pl.javacoding.pensioncalculator;


import pl.javacoding.pensioncalculator.model.Pension;

public class Main {
    public static void main(String[] args) {
        Pension pension = new Pension.PensionBuilder(100000, 10, 0.05)
                .withCapitalization(12)
                .build();

        System.out.println(pension.toString());
    }
}

