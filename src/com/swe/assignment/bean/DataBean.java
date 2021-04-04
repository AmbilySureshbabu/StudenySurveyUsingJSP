package com.swe.assignment.bean;

/**
 * To store the mean and standard deviation
 * 
 * @author ambily
 *
 */
public class DataBean {

	/**
	 * To store the mean of all data passed in the form
	 */
	private double mean;
	/**
	 * To store the standard deviation of all data passed in the form
	 */
	private double standardDeviation;

	/**
	 * @return
	 */
	public double getMean() {
		return mean;
	}

	/**
	 * @param mean
	 */
	public void setMean(double mean) {
		this.mean = mean;
	}

	public double getStandartDeviation() {
		return standardDeviation;
	}

	public void setStandartDeviation(double standardDeviation) {
		this.standardDeviation = standardDeviation;
	}

	public DataBean() {

	}

}
