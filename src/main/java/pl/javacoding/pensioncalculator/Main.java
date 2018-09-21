package pl.javacoding.pensioncalculator;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Pension pension = new Pension(100000, 10, 0.05, 12);
        System.out.println(pension.getNominalInterestRate());

        System.out.println("===rata===");
        System.out.println(pension.getPayment());

        System.out.println("===suma środków===");
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

class Pension {

    //private int customerAge;
    private double futureValue;
    private int yearsOfSavings;
    private double returnOnCapital;
    private int capitalization;
    private double nominalInterestRate;

    public Pension(double futureValue, int yearsOfSavings, double returnOnCapital, int capitalization) {
        this.futureValue = futureValue;
        this.yearsOfSavings = yearsOfSavings;
        this.returnOnCapital = returnOnCapital;
        this.capitalization = capitalization;
    }

    public double getNominalInterestRate() {
        this.nominalInterestRate = Math.pow(1 + returnOnCapital, (double) 1 / capitalization) - 1;
        return nominalInterestRate;
        /*return capitalization * (Math.pow(1 + returnOnCapital, (double) 1 / capitalization) - 1);
        Dopisz komentarz;
         */
    }

    public double getPayment() {
        return futureValue / (((Math.pow(nominalInterestRate + 1, capitalization * yearsOfSavings) - 1) / nominalInterestRate) * (1 + nominalInterestRate));
    }

    public List<Double> getDepositsList() {
        List<Double> depositsList = new ArrayList<Double>(yearsOfSavings);
        for (int year = 1; year <= yearsOfSavings; year++) {
            double sumOfFunds = 12 * year * getPayment();
            depositsList.add(sumOfFunds);
        }
        return depositsList;
    }

    public List<Double> getAccumulatedCapital() {
        List<Double> accumulatedCapital = new ArrayList<Double>(yearsOfSavings);
        for (int year = 1; year <= yearsOfSavings; year++) {
            double sumOfFunds = getPayment() * (((Math.pow(nominalInterestRate + 1, capitalization * year) - 1) / nominalInterestRate) * (1 + nominalInterestRate));
            accumulatedCapital.add(sumOfFunds);
        }
        return accumulatedCapital;
    }
}
