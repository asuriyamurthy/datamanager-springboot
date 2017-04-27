package com.amaresh.projects.datamanager.service;

import java.util.List;

import com.amaresh.projects.datamanager.model.BankAccount;
import com.amaresh.projects.datamanager.model.Category;
import com.amaresh.projects.datamanager.model.DataManager;
import com.amaresh.projects.datamanager.model.Expenses;
import com.amaresh.projects.datamanager.model.Income;
import com.amaresh.projects.datamanager.model.Outstanding;

public interface DataManagerService {

	public abstract List<Category> getCategories();

	public abstract void addNewExpense(Expenses expenses);

	public abstract void addNewIncome(Income income);

	public abstract List<Expenses> getExpenses();

	public abstract List<Income> getIncome();

	public abstract DataManager getDatamanager();

	public abstract List<Expenses> getExpensesByCategories();

	public abstract List<Expenses> getRecentExpenses();

	public abstract Outstanding getOutstandingAmount();

	public abstract BankAccount getBankBalance(String bankid);

	public abstract BankAccount getWithdraw_balance(String bankid);
}
