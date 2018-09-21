package pl.javacoding.pensioncalculator.model;

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

    private Pension(final PensionBuilder pensionBuilder) {
        //nie ma znaczenia kolejność operacji w konstruktorze - sprawdzić !!!
        //input data
        this.futureValue = pensionBuilder.futureValue;
        this.yearsOfSavings = pensionBuilder.yearsOfSavings;
        this.returnOnCapital = pensionBuilder.returnOnCapital;
        this.capitalization = pensionBuilder.capitalization;
        //calculated data
        this.nominalInterestRate = calculateNominalInterestRate();
        this.payment = calculatePayment();
        this.depositsList = calculateDepositsList();
        this.accumulatedCapitalsList = calculateAccumulatedCapitalsList();
    }

    //sprawdzić czy trzeba wszędzie dodawać this w metodach

    public double calculateNominalInterestRate() {
        this.nominalInterestRate = Math.pow(1 + returnOnCapital, (double) 1 / capitalization) - 1;
        return nominalInterestRate;
        /*return capitalization * (Math.pow(1 + returnOnCapital, (double) 1 / capitalization) - 1);
        Dopisać komentarz
         */
    }

    public double calculatePayment() {
        this.payment = futureValue / (((Math.pow(nominalInterestRate + 1, capitalization * yearsOfSavings) - 1) / nominalInterestRate) * (1 + nominalInterestRate));
        return payment;
    }

    public List<Double> calculateDepositsList() {
        this.depositsList = new ArrayList<Double>(yearsOfSavings);
        for (int year = 1; year <= yearsOfSavings; year++) {
            double sumOfFunds = 12 * year * calculatePayment();
            depositsList.add(sumOfFunds);
            this.totalAmountOfDeposits = +sumOfFunds;
        }
        return depositsList;
    }

    public List<Double> calculateAccumulatedCapitalsList() {
        this.accumulatedCapitalsList = new ArrayList<Double>(yearsOfSavings);
        for (int year = 1; year <= yearsOfSavings; year++) {
            double sumOfFunds = calculatePayment() * (((Math.pow(nominalInterestRate + 1, capitalization * year) - 1) / nominalInterestRate) * (1 + nominalInterestRate));
            accumulatedCapitalsList.add(sumOfFunds);
        }
        this.totalInterests = +futureValue - totalAmountOfDeposits;
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

    public List<Double> getAccumulatedCapitalsList() {
        return accumulatedCapitalsList;
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
                '}';
    }

    public static class PensionBuilder {
        private final double futureValue;
        private final int yearsOfSavings;
        private final double returnOnCapital;
        private int capitalization;

        public PensionBuilder(final double futureValue, final int yearsOfSavings, final double returnOnCapital) {
            this.futureValue = futureValue;
            this.yearsOfSavings = yearsOfSavings;
            this.returnOnCapital = returnOnCapital;
        }

        public PensionBuilder withCapitalization(final int capitalization) {
            this.capitalization = capitalization;
            return this;
        }

        public Pension build() {
            return new Pension(this);
        }
    }
}
