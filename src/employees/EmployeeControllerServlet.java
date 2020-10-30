package employees;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class EmployeeControllerServlet
 */
@WebServlet("/EmployeeControllerServlet")
public class EmployeeControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EmployeeDbUtil employeeDbutil;
	
	@Resource(name="jdbc/employees")
	private DataSource dataSource;
	
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		// create our empolyee db util..and pass in the conn pool / datasource
		try {
			employeeDbutil = new EmployeeDbUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//read the "command" parameter
			String theCommand = request.getParameter("command");
			
			// if the command is missing, then default to listing employees
			if (theCommand == null) {
				theCommand = "LIST";			
			}
			
			// route to the appropriate method
			switch(theCommand) {
			
			case "LIST":
				listEmployees(request, response);
				break;
				
			case "ADD":
				addEmployee(request,response);
				break;
				
			case "LOAD":
				loadEmployee(request, response);
				break;
			
			case "UPDATE":
				updateEmployee(request,response);
				break;
				
			default:
				System.out.println("hmmm I'm confused :(");
			}
			
		}	
		catch (Exception exc) {
			throw new ServletException(exc);
		}
		
	}


	private void updateEmployee(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		
		// read student info from form data
		int emp_no = Integer.parseInt(request.getParameter("emp_no"));
		String firstName = request.getParameter("firstName"); 
		String lastName = request.getParameter("lastName");
		String gender = request.getParameter("gender");
		String hireDate = request.getParameter("hireDate");
		String birthDate = request.getParameter("birthDate");
		// create a new employee object
		Employee theEmployee = new Employee(emp_no, birthDate, firstName, lastName, gender, hireDate);
		
		// perform update on database
		employeeDbutil.updateEmployee(theEmployee);
		// send user back to the "list employees" page
		listEmployees(request,response);
		
	}


	private void loadEmployee(HttpServletRequest request, HttpServletResponse response)
	throws Exception {
		//read employee id from form data
		String theEmployeeId = request.getParameter("emp_no");
		//get employee from database (db util)
		Employee theEmployee = employeeDbutil.getEmployee(theEmployeeId);
		//place employee in the request attribute
		request.setAttribute("THE_EMPLOYEE", theEmployee);
		//send to jsp page: update-employee-form.jsp
		RequestDispatcher dispatcher =
				request.getRequestDispatcher("/update-employee-form.jsp");
			dispatcher.forward(request, response);
	}


	private void addEmployee(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// read student info from form data
		int emp_no = Integer.parseInt(request.getParameter("emp_no"));
		String birthDate = request.getParameter("birthDate");
		//Date birthDate = new SimpleDateFormat("yyyy-MM-dd").parse(birthDate1);
		String firstName = request.getParameter("firstName"); 
		String lastName = request.getParameter("lastName");
		String gender = request.getParameter("gender");
		String hireDate = request.getParameter("hireDate");
		//Date hireDate = new SimpleDateFormat("yyyy-MM-dd").parse(hireDate1);
		// create a new student object
		Employee theEmployee = new Employee(emp_no, birthDate, firstName, lastName, gender, hireDate);
		// add the student to the database
		employeeDbutil.addEmployee(theEmployee);
		// send back to the main page (the student list)
		listEmployees(request, response);
	}


	private void listEmployees(HttpServletRequest request, HttpServletResponse response) 
	throws Exception {
		
		// get employees from db util
		List<Employee> employees = employeeDbutil.getEmployees();
		
		// ad employees to the request
		request.setAttribute("Employee_List", employees);
		
		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-employees.jsp");
		dispatcher.forward(request,response);
				
	}

}
