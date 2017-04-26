package com.amaresh.projects.datamanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.amaresh.projects.datamanager.model.Expenses;
import com.amaresh.projects.datamanager.model.Income;
import com.amaresh.projects.datamanager.service.DataManagerService;
import com.amaresh.projects.datamanager.utils.Utilities;

@RestController
public class DatamanagerController {

	@Autowired
	DataManagerService datamanagerService;
	@Autowired
	Utilities utilities;

	@RequestMapping(value = "/categories", method = RequestMethod.GET)
	public ResponseEntity<Object> getCategories() {
		return new ResponseEntity<>(datamanagerService.getCategories(), HttpStatus.OK);
	}

	@RequestMapping(value = "/expenses", method = RequestMethod.POST)
	public ResponseEntity<Object> addNewExpense(@RequestBody Expenses expenses) {
		if (expenses.getCategoryid() > 0 && expenses.getDescription() != null && expenses.getExpensedate() > 0
				&& expenses.getAmount() > 0) {
			expenses.setAmount(utilities.truncateDecimal(expenses.getAmount(), 2).doubleValue());
			datamanagerService.addNewExpense(expenses);
			return new ResponseEntity<>("success", HttpStatus.CREATED);
		}
		return new ResponseEntity<>("invalid input", HttpStatus.BAD_REQUEST);
	}

	@RequestMapping(value = "/expenses", method = RequestMethod.GET)
	public ResponseEntity<Object> getExpenses() {
		return new ResponseEntity<>(datamanagerService.getExpenses(), HttpStatus.OK);
	}

	@RequestMapping(value = "/incomes", method = RequestMethod.POST)
	public ResponseEntity<Object> addNewIncome(@RequestBody Income income) {
		if (income.getDescription() != null && income.getAmount() > 0 && income.getIncomedate() > 0) {
			income.setAmount(utilities.truncateDecimal(income.getAmount(), 2).doubleValue());
			datamanagerService.addNewIncome(income);
			return new ResponseEntity<>("success", HttpStatus.CREATED);
		}
		return new ResponseEntity<>("invalid input", HttpStatus.BAD_REQUEST);
	}

	@RequestMapping(value = "/incomes", method = RequestMethod.GET)
	public ResponseEntity<Object> getIncome() {
		return new ResponseEntity<>(datamanagerService.getIncome(), HttpStatus.OK);
	}
	
}