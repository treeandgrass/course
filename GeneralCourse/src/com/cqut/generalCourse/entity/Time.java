package com.cqut.generalCourse.entity;

import java.io.Serializable;

public class Time implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 572616153872882113L;
	
	private String year;
	
	private String month;
	
	private String date;
	
	private String hour;
	
	private String minute;
	
	private String second;
	
	public Time(){
		
	}

	public Time(String year, String month, String date, String hour,
			String minute, String second) {
		super();
		this.year = year;
		this.month = month;
		this.date = date;
		this.hour = hour;
		this.minute = minute;
		this.second = second;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public String getMinute() {
		return minute;
	}

	public void setMinute(String minute) {
		this.minute = minute;
	}

	public String getSecond() {
		return second;
	}

	public void setSecond(String second) {
		this.second = second;
	}
}
