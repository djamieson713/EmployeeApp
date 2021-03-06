package employees;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	@Resource(name="jdbc/employees")
	private DataSource dataSource;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Step 1: Set up the printwriter
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		// Step 2: Get a connection to the database
		Connection myConn = null;
		Statement  myStmt = null;
		ResultSet myRs = null;
		
		try {
			myConn = dataSource.getConnection();
		// Step 3: Create a SQL statement
			String sql = "select * from departments";
			myStmt = myConn.createStatement();
		// Step 4: Execute
			myRs = myStmt.executeQuery(sql);
		// Step 5: Process the result set
			while(myRs.next()) {
				String name = myRs.getString("dept_name");
				out.println(name);
			}
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
