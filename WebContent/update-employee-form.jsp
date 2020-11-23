 <!DOCTYPE html>
<html>

<head>
	<title>Update Employee</title>

	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-student-style.css">	
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>Employee Central</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Update Employee</h3>
		
		<form action="EmployeeControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="UPDATE" />
			<input type="hidden" name="employeId" value="${THE_EMPLOYEE.emp_no}" />
			
			<table>
				<tbody>
					<tr>
						<td><label>Employee Number:</label></td>
						<td><input type="text" name="emp_no" 
									value="${THE_EMPLOYEE.emp_no}"/></td>
					</tr>
					
					<tr>
						<td><label>Birth date:</label></td>
						<td><input type="text" name="birthDate" 
									value="${THE_EMPLOYEE.birth_date}"/></td>
					</tr>
					
					<tr>
						<td><label>First name:</label></td>
						<td><input type="text" name="firstName" 
									value="${THE_EMPLOYEE.first_name}"/></td>
					</tr>

					<tr>
						<td><label>Last name:</label></td>
						<td><input type="text" name="lastName" 
									value="${THE_EMPLOYEE.last_name}"/></td>
					</tr>
					
					<tr>
						<td><label>Gender:</label></td>
						<td><input type="text" name="gender" 
									value="${THE_EMPLOYEE.gender}"/></td>
					</tr>
					
					<tr>
						<td><label>Hire date:</label></td>
						<td><input type="text" name="hireDate" 
									value="${THE_EMPLOYEE.hire_date}"/></td>
					</tr>
					
						
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		
		<div style="clear: both;"></div>
		
		<p>
			<a href="EmployeeControllerServlet">Back to List</a>
		</p>
	</div>
</body>

</html>