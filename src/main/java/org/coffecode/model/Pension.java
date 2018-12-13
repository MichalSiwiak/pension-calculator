package org.coffecode.model;

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
        //ma znaczenie kolejność operacji w konstruktorze - przykład inflationRate !!!
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

    //sprawdzić czy trzeba wszędzie dodawać this w metodach

    public double calculateNominalInterestRate() {
        nominalInterestRate = Math.pow(1 + returnOnCapital, (double) 1 / capitalization) - 1;
        if (belkaTax) {
            return nominalInterestRate * 0.81;
        } else {
            return nominalInterestRate;
        }
        /*return capitalization * (Math.pow(1 + returnOnCapital, (double) 1 / capitalization) - 1);
        Dopisać komentarz
         */
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
