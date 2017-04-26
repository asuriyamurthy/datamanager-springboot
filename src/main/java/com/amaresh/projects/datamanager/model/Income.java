package com.amaresh.projects.datamanager.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonInclude(JsonInclude.Include.NON_DEFAULT)
public class Income {

	private int incomeid;
	private String description;
	private double amount;
	private long incomedate;

	public int getIncomeid() {
		return incomeid;
	}

	public void setIncomeid(int incomeid) {
		this.incomeid = incomeid;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public long getIncomedate() {
		return incomedate;
	}

	public void setIncomedate(long incomedate) {
		this.incomedate = incomedate;
	}
}
