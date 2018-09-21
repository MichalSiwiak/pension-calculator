package pl.javacoding.pensioncalculator;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        Pension pension = new Pension.PensionBuilder(100000, 10, 0.05)
                .withCapitalization(12)
                .build();
        System.out.println(pension.getNominalInterestRate());

        System.out.println("===rata===");
        System.out.println(pension.getPayment());

        System.out.println("==les=suma środków===");
        List<Double> depositsList = pension.getDepositsList();
        for (Double deposit : depositsList) {
            System.out.println(deposit);
        }

        System.out.println("===suma kapitału===");
        List<Double> capitalsList = pension.getAccumulatedCapital();
        for (Double capital : capitalsList) {
            System.out.println(capital);
        }
    }
}

