package com.amaresh.projects.datamanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.amaresh.projects.datamanager.service.DataManagerService;

@RestController
public class DashboardController {

	@Autowired
	DataManagerService datamanagerService;

	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public ResponseEntity<Object> getbalance() {
		return new ResponseEntity<>(datamanagerService.getDatamanager(), HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/expenses-categories", method = RequestMethod.GET)
	public ResponseEntity<Object> expenses_categories() {
		return new ResponseEntity<>(datamanagerService.getExpensesByCategories(), HttpStatus.OK);
	}	
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/recent-expenses", method = RequestMethod.GET)
	public ResponseEntity<Object> recent_expenses() {
		return new ResponseEntity<>(datamanagerService.getRecentExpenses(), HttpStatus.OK);
	}	
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/outstanding-amount", method = RequestMethod.GET)
	public ResponseEntity<Object> outstanding_amount() {
		return new ResponseEntity<>(datamanagerService.getOutstandingAmount(), HttpStatus.OK);
	}	
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/bank-balance", method = RequestMethod.GET)
	public ResponseEntity<Object> bank_balance(@RequestParam(value = "bankid", required = true) String bankid) {
		return new ResponseEntity<>(datamanagerService.getBankBalance(bankid), HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/withdraw-balance", method = RequestMethod.GET)
	public ResponseEntity<Object> withdraw_balance(@RequestParam(value = "bankid", required = true) String bankid) {
		return new ResponseEntity<>(datamanagerService.getWithdraw_balance(bankid), HttpStatus.OK);
	}
	
	@CrossOrigin(origins = "*")
	@RequestMapping(value = "/recent-activities", method = RequestMethod.GET)
	public ResponseEntity<Object> recent_activities() {
		return new ResponseEntity<>(datamanagerService.getRecentActivities(), HttpStatus.OK);
	}
}