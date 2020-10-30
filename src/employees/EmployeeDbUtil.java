package employees;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class EmployeeDbUtil {
	
	private DataSource dataSource;
	
	public EmployeeDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public List<Employee> getEmployees() throws Exception {
		
		List<Employee> employees = new ArrayList<>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
		// get a connection
		myConn = dataSource.getConnection();
		// create sql statement
		String sql = "select * from employees";
		
		myStmt = myConn.createStatement();
		// execute query
		myRs = myStmt.executeQuery(sql);
		// process result set
		while(myRs.next()) {
			
			// retrieve data from result set row
			int emp_no = myRs.getInt("emp_no");
			String firstName = myRs.getString("first_name"); //DB column names
			String lastName = myRs.getString("last_name");
			String hireDate = myRs.getDate("hire_date").toString();
			String birthDate = myRs.getDate("birth_date").toString();
			String gender =  myRs.getString("gender");
			// create new employee object
			Employee tempEmployee = new Employee(emp_no, birthDate, firstName, lastName, gender, hireDate);
			
			// add it to list of empolyees
			employees.add(tempEmployee);
		
		}
		// close JDBC objects
			
			return employees;
		}
		finally {
			close(myConn, myStmt, myRs);
		}
		
	}
private void close(Connection myConn, Statement myStmt, ResultSet myRs) {
		try {
			if (myRs != null) {
				myRs.close();
			}
			
			if (myStmt != null) {
				myStmt.close();
			}
			
			if (myConn != null) {
				myConn.close(); // places it back into connection pool
			}
			
			
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
		
	}

	public void addEmployee(Employee theEmployee) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get db connection
			myConn = dataSource.getConnection();
		
		// create sql for insert
			String sql = "insert into employees"
						+ "(emp_no, birth_date, first_name, last_name, gender, hire_date) "
						+ "values (?, ?, ?, ?, ?, ?)";
			
			myStmt = myConn.prepareStatement(sql);
		// set param values for the employee
			myStmt.setInt(1, theEmployee.getEmp_no());
			myStmt.setDate(2, java.sql.Date.valueOf(theEmployee.getBirth_date()));
			myStmt.setString(3, theEmployee.getFirst_name());
			myStmt.setString(4, theEmployee.getLast_name());
			myStmt.setString(5, theEmployee.getGender());
			myStmt.setDate(6,  java.sql.Date.valueOf(theEmployee.getHire_date()));
			
		// execute sql insert
			myStmt.execute();
		}
	 finally{
		// clean JDBC objects
			close(myConn, myStmt, null);
	 }
		
}
	
	

	public Employee getEmployee(String theEmployeeId) throws Exception {
		Employee theEmployee = null;
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int employeeId;
		
		try {
			// convert employee id to int
			employeeId = Integer.parseInt(theEmployeeId);
			
			// get connection to database
			myConn = dataSource.getConnection();
		
			// create sql to get selected student
			String sql = "select * from employees where emp_no=?";
			
			// create prepared statement
			 myStmt = myConn.prepareStatement(sql);
			 
			// set params
			myStmt.setInt(1, employeeId);
			
			// execute statement
			myRs = myStmt.executeQuery();
			
			// retrieve data from result set row
			if(myRs.next()) {
				int emp_no = myRs.getInt("emp_no");
				String firstName = myRs.getString("first_name"); //DB column names
				String lastName = myRs.getString("last_name");
				String hireDate = myRs.getDate("hire_date").toString();
				String birthDate = myRs.getDate("birth_date").toString();
				String gender =  myRs.getString("gender");
				
				// create new employee object
				 theEmployee = new Employee(emp_no, birthDate, firstName, lastName, gender, hireDate);
			}
				
			
			else {
				throw new Exception ("Could not find employee id: " + employeeId);
			}
		
			return theEmployee;
		}
		finally {
			close(myConn, myStmt, myRs);
		}	
		
	}

	public void updateEmployee(Employee theEmployee) throws Exception {
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
	try {
		// get db connection
		myConn = dataSource.getConnection();
		
		// create SQL update statement
		String sql = "update employees "
					+ "set emp_no=?, first_name=?, birth_date=?, last_name?, gender=?, hire_date=? "
					+ "where emp_no=?";
		// prepare statement
		myStmt = myConn.prepareStatement(sql);
		// set params
		myStmt.setInt(1, theEmployee.getEmp_no());
		myStmt.setDate(2, java.sql.Date.valueOf(theEmployee.getBirth_date()));
		myStmt.setString(3, theEmployee.getFirst_name());
		myStmt.setString(4, theEmployee.getLast_name());
		myStmt.setString(5, theEmployee.getGender());
		myStmt.setDate(6,  java.sql.Date.valueOf(theEmployee.getHire_date()));
		myStmt.setInt(7, theEmployee.getEmp_no());
		// execute SQL statement
		
		myStmt.execute();
	}	
	finally {
		// clean up JDBC objects
		close(myConn, myStmt, null);
		}
	}
}
