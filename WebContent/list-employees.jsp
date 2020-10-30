<%@ page import= "java.util.*,employees.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>

<head>
<meta name ="viewport" content="widht=device-width, initial-scale=1">
	<title>Employee App</title>
	<link href="https://fonts.googleapix.com/css?family=Open+Sans" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/styles.css">
	<link rel="stylesheet" href="assets/css/style.css">
	
		<link type="text/css" rel="stylesheet" href="css/styles.css">
</head>
				
						
<body>
  <section class="hero">
    <div class="background-image" style="background-image: url(assets/img/main.jpg);"></div>
    <div class="hero-content-area">
 
    </div>
  </section>

 	<div id="wrapper">
 		<div id="header">
 			<h2>Employee Central</h2>
 		</div>
 	</div>
 	
 	<!-- put new button: ADD Employee -->
 	
    <input type="button" value="Add Employee"
    	onclick="window.location.href='add-employee-form.jsp'; return false;"
    	class="add-student-button"
   	/>
 	
 	
 	
	<div id="container">
		<div id="content">
			<table>
			<tr>
				<th>Employee Number</th>
				<th>Birth Date</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Gender</th>
				<th>Hire date</th>
				<th>Action</th>
				
			</tr>
		
			<c:forEach var="tempEmployee" items= "${Employee_List}">
				<!-- set up a link for each employee -->
				<c:url var="tempLink" value="EmployeeControllerServlet">
					<c:param name="command" value="LOAD" />
					<c:param name="emp_no" value="${tempEmployee.emp_no}" />
				</c:url>	
				
				<tr>
					<td> ${tempEmployee.emp_no} </td>
					<td> ${tempEmployee.birth_date}</td>
					<td> ${tempEmployee.first_name} </td>
					<td> ${tempEmployee.last_name}  </td>
					<td> ${tempEmployee.gender} </td>
					<td> ${tempEmployee.hire_date} </td>
					<td> <a href="${tempLink}">Update</a> </td>
				</tr>
				
				</c:forEach>
			</table>
		</div>
	</div>
</body>

</html>