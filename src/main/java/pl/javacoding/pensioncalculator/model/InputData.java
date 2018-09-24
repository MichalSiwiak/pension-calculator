package pl.javacoding.pensioncalculator.model;

public class InputData {

    private double futureValue;
    private int yearsOfSavings;
    private double returnOnCapital;
    private double inflationRate;

    public InputData(double futureValue, int yearsOfSavings, double returnOnCapital, double inflationRate) {
        this.futureValue = futureValue;
        this.yearsOfSavings = yearsOfSavings;
        this.returnOnCapital = returnOnCapital;
        this.inflationRate = inflationRate;
    }

    public InputData() {

    }

    public double getFutureValue() {
        return futureValue;
    }

    public void setFutureValue(double futureValue) {
        this.futureValue = futureValue;
    }

    public int getYearsOfSavings() {
        return yearsOfSavings;
    }

    public void setYearsOfSavings(int yearsOfSavings) {
        this.yearsOfSavings = yearsOfSavings;
    }

    public double getReturnOnCapital() {
        return returnOnCapital;
    }

    public void setReturnOnCapital(double returnOnCapital) {
        this.returnOnCapital = returnOnCapital;
    }

    public double getInflationRate() {
        return inflationRate;
    }

    public void setInflationRate(double inflationRate) {
        this.inflationRate = inflationRate;
    }

    @Override
    public String toString() {
        return "InputData{" +
                "futureValue=" + futureValue +
                ", yearsOfSavings=" + yearsOfSavings +
                ", returnOnCapital=" + returnOnCapital +
                ", inflationRate=" + inflationRate +
                '}';
    }
}
