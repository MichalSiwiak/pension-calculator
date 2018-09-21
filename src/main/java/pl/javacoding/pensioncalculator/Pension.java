package pl.javacoding.pensioncalculator;

import java.util.ArrayList;
import java.util.List;

class Pension {

    private double futureValue;
    private int yearsOfSavings;
    private double returnOnCapital;
    private int capitalization;
    private double nominalInterestRate;

    private Pension(final PensionBuilder pensionBuilder) {
        this.futureValue = pensionBuilder.futureValue;
        this.yearsOfSavings = pensionBuilder.yearsOfSavings;
        this.returnOnCapital = pensionBuilder.returnOnCapital;
        this.capitalization = pensionBuilder.capitalization;
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

    @Override
    public String toString() {
        return "Pension{" +
                "futureValue=" + futureValue +
                ", yearsOfSavings=" + yearsOfSavings +
                ", returnOnCapital=" + returnOnCapital +
                ", capitalization=" + capitalization +
                ", nominalInterestRate=" + nominalInterestRate +
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
