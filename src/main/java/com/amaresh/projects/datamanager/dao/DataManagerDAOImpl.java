package com.amaresh.projects.datamanager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.amaresh.projects.datamanager.model.BankAccount;
import com.amaresh.projects.datamanager.model.Category;
import com.amaresh.projects.datamanager.model.DataManager;
import com.amaresh.projects.datamanager.model.Expenses;
import com.amaresh.projects.datamanager.model.Income;
import com.amaresh.projects.datamanager.model.Outstanding;
import com.amaresh.projects.datamanager.model.Statements;
import com.amaresh.projects.datamanager.utils.Utilities;

@Repository
public class DataManagerDAOImpl implements DataManagerDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	Utilities utilities;

	@Override
	public List<Category> getCategories() {
		String sqlQuery = "SELECT ID, CATEGORY_NAME FROM TBL_CATEGORY ORDER BY CATEGORY_NAME ASC";
		Collection<Map<String, Object>> rows = jdbcTemplate.queryForList(sqlQuery);
		List<Category> categories = new ArrayList<>();
		rows.stream().map((row) -> {
			Category category = new Category();
			category.setCategoryid(String.valueOf(row.get("ID")));
			category.setCategoryname((String) row.get("CATEGORY_NAME"));
			return category;
		}).forEach((dd) -> {
			categories.add(dd);
		});
		return categories;
	}

	@Override
	public void addNewExpense(Expenses expenses) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update((Connection connection) -> {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(
					"INSERT INTO TBL_EXPENSE (DESCRIPTION,EXPENSE_DATE,AMOUNT,CATEGORY_ID) VALUES (?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, expenses.getDescription());
			preparedStatement.setLong(2, expenses.getExpensedate());
			preparedStatement.setDouble(3, expenses.getAmount());
			preparedStatement.setInt(4, expenses.getCategoryid());
			return preparedStatement;
		}, keyHolder);
	}

	@Override
	public void addNewIncome(Income income) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update((Connection connection) -> {
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(
					"INSERT INTO TBL_INCOME (DESCRIPTION,INCOME_DATE,AMOUNT) VALUES (?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, income.getDescription());
			preparedStatement.setLong(2, income.getIncomedate());
			preparedStatement.setDouble(3, income.getAmount());
			return preparedStatement;
		}, keyHolder);
	}

	@Override
	public List<Expenses> getExpenses() {
		String sqlQuery = "SELECT E.ID, E.DESCRIPTION, C.CATEGORY_NAME,E.EXPENSE_DATE,E.AMOUNT FROM TBL_EXPENSE AS E INNER JOIN TBL_CATEGORY C ON C.ID=E.CATEGORY_ID ORDER BY E.EXPENSE_DATE DESC";
		Collection<Map<String, Object>> rows = jdbcTemplate.queryForList(sqlQuery);
		List<Expenses> expenseslist = new ArrayList<>();
		rows.stream().map((row) -> {
			Expenses expense = new Expenses();
			expense.setExpenseid((int) row.get("ID"));
			expense.setAmount((Double) row.get("AMOUNT"));
			expense.setCategoryname((String) row.get("CATEGORY_NAME"));
			expense.setExpensedate((int) row.get("EXPENSE_DATE"));
			expense.setDescription((String) row.get("DESCRIPTION"));
			return expense;
		}).forEach((dd) -> {
			expenseslist.add(dd);
		});
		return expenseslist;
	}

	@Override
	public List<Income> getIncome() {
		String sqlQuery = "SELECT ID, DESCRIPTION,INCOME_DATE,AMOUNT FROM TBL_INCOME ORDER BY INCOME_DATE DESC";
		Collection<Map<String, Object>> rows = jdbcTemplate.queryForList(sqlQuery);
		List<Income> incomelist = new ArrayList<>();
		rows.stream().map((row) -> {
			Income income = new Income();
			income.setIncomeid((int) row.get("ID"));
			income.setAmount((Double) row.get("AMOUNT"));
			income.setDescription((String) row.get("DESCRIPTION"));
			income.setIncomedate((int) row.get("INCOME_DATE"));
			return income;
		}).forEach((dd) -> {
			incomelist.add(dd);
		});
		return incomelist;
	}

	@Override
	public DataManager getDatamanager() {
		DataManager datamanager = new DataManager();
      String sqlQuery = "SELECT (SELECT IFNULL(SUM(AMOUNT),0) FROM TBL_INCOME) AS TOTALINCOME, (SELECT IFNULL(SUM(AMOUNT),0) FROM TBL_EXPENSE) AS TOTALEXPENSES,(SELECT IFNULL(SUM(AMOUNT),0) FROM TBL_INCOME) - (SELECT IFNULL(SUM(AMOUNT),0) FROM TBL_EXPENSE) AS BALANCE";
      jdbcTemplate.query(sqlQuery, (RowCallbackHandler) rs -> {
          if (rs.getString("TOTALINCOME") != null) {
        	  datamanager.setTotal_credit(utilities.getValueFormatter(utilities.truncateDecimal(rs.getDouble("TOTALINCOME"),3)));
          }
          if (rs.getString("TOTALEXPENSES") != null) {
        	  datamanager.setTotal_expenses(utilities.getValueFormatter(utilities.truncateDecimal(rs.getDouble("TOTALEXPENSES"),3)));
          }
          if (rs.getString("BALANCE") != null) {
        	  datamanager.setBalance(utilities.getValueFormatter(utilities.truncateDecimal(rs.getDouble("BALANCE"),3)));
          }
      });
		return datamanager;
	}

	@Override
	public List<Expenses> getExpensesByCategories() {
		List<Expenses> expensesListByCategory = new ArrayList<>();
		Collection<Map<String, Object>> rows = null;
		Expenses expensesOthers = new Expenses();
		expensesOthers.setName("OTHERS");
		
		String sql = "SELECT UPPER(C.CATEGORY_NAME) AS CATEGORY_NAME, TAB1.AMOUNT FROM (SELECT E.CATEGORY_ID, IFNULL(SUM(E.AMOUNT),0) AS AMOUNT FROM TBL_EXPENSE E GROUP BY E.CATEGORY_ID) AS TAB1 INNER JOIN TBL_CATEGORY C ON C.ID=TAB1.CATEGORY_ID ORDER BY TAB1.AMOUNT DESC";
		 rows = jdbcTemplate.queryForList(sql);
		 rows.stream().map((row) -> {
			 	Expenses expenses = new Expenses();
				expenses.setY(utilities.truncateDecimal((double) row.get("AMOUNT"),3).doubleValue());
				expenses.setName((String) row.get("CATEGORY_NAME"));
				return expenses;
			}).forEach((ss) -> {
				if(expensesListByCategory.size()<5) {
					expensesListByCategory.add(ss);
				}else {
					expensesOthers.setY(utilities.truncateDecimal((double) expensesOthers.getY()+ss.getY(),3).doubleValue());
				}
			});
		 
		 if(expensesOthers.getY()>0)
			 expensesListByCategory.add(expensesOthers);
		 
		return expensesListByCategory;
	}

	@Override
	public List<Expenses> getRecentExpenses() {
		List<Expenses> recentExpenseslist = new ArrayList<>();
		Collection<Map<String, Object>> rows = null;
		String sql = "select DATE_FORMAT(from_unixtime(EXPENSE_DATE), \"%Y-%m-%d\") as 'expensedate',ifnull(sum(amount),0) as amount from tbl_expense group by DATE_FORMAT(from_unixtime(EXPENSE_DATE), \"%Y-%m-%d\") order by EXPENSE_DATE DESC limit 5";
		 rows = jdbcTemplate.queryForList(sql);
		 rows.stream().map((row) -> {
			 	Expenses expenses = new Expenses();
				expenses.setName((String) row.get("expensedate"));
				expenses.setY(utilities.truncateDecimal((double) row.get("AMOUNT"),3).doubleValue());
				return expenses;
			}).forEach((ss) -> {
				recentExpenseslist.add(ss);
			});
		return recentExpenseslist;
	}

	@Override
	public Outstanding getOutstandingAmount() {
		Outstanding outstanding = new Outstanding();
		outstanding.setOutstanding_amount_str(utilities.getValueFormatter(utilities.truncateDecimal(jdbcTemplate.queryForObject("SELECT ifnull(SUM(amount),0) as amount FROM tbl_outstanding where cleared_YN=?", new Object[] {"N"},Double.class),3)));
		return outstanding;
	}

	@Override
	public BankAccount getBankBalance(String bankid) {
		BankAccount bankaccount = new BankAccount();
		bankaccount.setAmountstr(utilities.getValueFormatter(utilities.truncateDecimal(jdbcTemplate.queryForObject("SELECT ifnull(SUM(balance),0) as amount FROM bank_account where id=?", new Object[] {bankid},Double.class),3)));
		return bankaccount;
		
	}

	@Override
	public BankAccount getWithdraw_balance(String bankid) {
		BankAccount bank_account = new BankAccount();
		bank_account.setAmountstr(utilities.getValueFormatter(utilities.truncateDecimal(jdbcTemplate.queryForObject("SELECT (SELECT (SELECT IFNULL(SUM(AMOUNT),0) FROM TBL_INCOME) - (SELECT IFNULL(SUM(AMOUNT),0) FROM TBL_EXPENSE) AS BALANCE) - (SELECT IFNULL(SUM(BALANCE),0)  FROM BANK_ACCOUNT WHERE ID=?) AS BALANCE",new Object[] {bankid}, Double.class), 3)));
		return bank_account;
		
	}

	@Override
	public List<Statements> getRecentActivities() {
		List<Statements> recentActivitesList = new ArrayList<>();
		Collection<Map<String, Object>> rows = null;
		String sql = "SELECT AMOUNT_TYPE,DESCRIPTION,AMOUNT,DATE_FORMAT(from_unixtime(DATETIME), \"%Y-%m-%d\") AS DATETIME FROM TBL_STATEMENT ORDER BY DATETIME DESC LIMIT 5";
		 rows = jdbcTemplate.queryForList(sql);
		 rows.stream().map((row) -> {
			 	Statements statements = new Statements();
			 	statements.setAmount(utilities.getValueFormatter(utilities.truncateDecimal((Double) row.get("AMOUNT"),3)));
			 	statements.setType((String) row.get("AMOUNT_TYPE"));
			 	statements.setDescription((String) row.get("DESCRIPTION"));
			 	statements.setDate((String) row.get("DATETIME"));
				return statements;
			}).forEach((ss) -> {
				recentActivitesList.add(ss);
			});
		return recentActivitesList;
	}
}