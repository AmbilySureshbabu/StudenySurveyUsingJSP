package com.swe.assignment.processor;

import java.util.Arrays;

/**
 * Class to do the data processing logic
 * 
 * @author ambil
 *
 */
public class DataProcessor {
	int[] list;

	public DataProcessor() {

	}

	/**
	 * get the list of int data fields
	 * 
	 * @return int[] array
	 */
	public int[] getList() {
		return list;
	}

	/**
	 * Set the list based on the comma separated string of data
	 * 
	 * @param inputString
	 */
	public void setList(String inputString) {
		if (null != inputString) {
			list = Arrays.stream(inputString.split(",")).mapToInt(Integer::parseInt).toArray();
		}
	}

	/**
	 * Method to calculate the mean
	 * 
	 * @return double mean
	 */
	public double getMean() {
		double sum = 0.0;
		if (null == list || list.length == 0) {
			return sum;
		}
		for (int index = 0; index != list.length; ++index) {
			sum += list[index];
		}
		return sum / list.length;
	}

	/**
	 * Method to calculate the standard deviation
	 * 
	 * @return double standard deviation
	 */
	public double getStandardDeviation() {
		final double mean = getMean();
		double sum = 0;
		for (int index = 0; index != list.length; ++index) {
			sum += Math.pow(Math.abs(mean - list[index]), 2);
		}
		return Math.sqrt(sum / list.length);
	}

}
