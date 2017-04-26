package com.amaresh.projects.datamanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amaresh.projects.datamanager.dao.DataManagerDAO;
import com.amaresh.projects.datamanager.model.Category;
import com.amaresh.projects.datamanager.model.DataManager;
import com.amaresh.projects.datamanager.model.Expenses;
import com.amaresh.projects.datamanager.model.Income;
import com.amaresh.projects.datamanager.model.Outstanding;

@Service
public class DataManagerServiceImpl implements DataManagerService {

	@Autowired
	DataManagerDAO datamanagerDao;

	@Override
	public List<Category> getCategories() {
		return datamanagerDao.getCategories();
	}

	@Override
	public void addNewExpense(Expenses expenses) {
		datamanagerDao.addNewExpense(expenses);
		
	}

	@Override
	public void addNewIncome(Income income) {
		datamanagerDao.addNewIncome(income);
		
	}

	@Override
	public List<Expenses> getExpenses() {
		return datamanagerDao.getExpenses();
	}

	@Override
	public List<Income> getIncome() {
		return datamanagerDao.getIncome();
	}

	@Override
	public DataManager getDatamanager() {
		return datamanagerDao.getDatamanager();
	}

	@Override
	public List<Expenses> getExpensesByCategories() {
		return datamanagerDao.getExpensesByCategories();
	}

	@Override
	public List<Expenses> getRecentExpenses() {
		return datamanagerDao.getRecentExpenses();
	}

	@Override
	public Outstanding getOutstandingAmount() {
		return datamanagerDao.getOutstandingAmount();
	}

}