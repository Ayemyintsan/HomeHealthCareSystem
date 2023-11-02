<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.java.bean.*" %>
<%
	if(session.getAttribute("adminSession")==null){
		response.sendRedirect("showLoginForm");
	}
	Admin admin=(Admin)session.getAttribute("adminSession");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
    <title>Document</title>

    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <style>
         *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        list-style: none;
        text-decoration: none;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    }
    body{
        background-color: azure;
    }
    .wrapper{
        display: flex;
        position: relative;
    }
    .wrapper .sidebar{
        position: fixed;
        width: 200px;
        height: 100%;
        background-color: #4b4276;
        padding: 30px 0;
    }
    .wrapper .sidebar h2{
        color: #fff;
        text-transform: uppercase;
        text-align: center;
        margin-bottom: 30px;
    }
    .wrapper .sidebar ul li{
        padding:15px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        border-top: 1px solid rgba(225 , 225, 225, 0.05);
    }
    .wrapper .sidebar ul li a{
        color: #bdb8d7;
        display: block;
    }
    .wrapper .sidebar ul li a .fa{
        width: 25px;
    }
    .wrapper .sidebar ul li:hover{
        background: #594f8d;
    }
    .wrapper .sidebar ul li:hover a{
        color: #fff;
    }
    .wrapper .main_content{
        width: 100%;
        margin-left: 200px;

    }
    .wrapper .main_content .header{
        padding: 20px;
        background: #fff;
        color: #717171;
        font-size: 26px;
        font-weight: bold;
        
        border-bottom: 1px solid #e0e4e8;
    }
    .wrapper .main_content .info{
        margin: 20px;
        color: #717171;
        line-height: 35px;
    }
    .wrapper .main_content .info .patient{
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        border-collapse: collapse;
        width: 100%;
    }
    .wrapper .main_content .info .patient thead{
        border: 1px solid #bdb8d7;
        padding: 8px;
    }
    .pateint tr:nth-child(even){
        background-color: #f2f2f2;
    }
    .patient tr:hover {
        background-color: #ddd;
    }
    button{
        
        color: #bdb8d7;
        float: right;
        font-size: 15px;
    }
</style>

</head>
<body>
    <div class="wrapper">
        <div class="sidebar">
            <h2>HOME HEALTH CARE</h2>
            <ul>
            <li><a href="dashboard"><i class="fa fa-address-book" aria-hidden="true"></i>Dashboard</a></li>
                <li><a href="userList"><i class="fa fa-address-book" aria-hidden="true"></i>User</a></li>
                <li><a href="allpatientList"><i class="fa fa-user" aria-hidden="true"></i>Request Patient</a></li>
                <li><a href="servicetypeList"><i class="fa fa-user" aria-hidden="true"></i>ServiceType</a></li>
                <li><a href="allserviceList"><i class="fa fa-folder" aria-hidden="true"></i>Services</a></li>
                
               <!-- <li><a href="departmentList"><i class="fa fa-folder" aria-hidden="true"></i>Department</a></li> -->
                <li><a href="messageList"><i class="fa fa-user-circle" aria-hidden="true"></i>Message</a></li>
                <li><a href="supervisorList"><i class="fa fa-user-circle" aria-hidden="true"></i>Supervisor</a></li>
                <li><a href="allcaregiverList"><i class="fa fa-user-nurse" aria-hidden="true"></i>Caregiver</a></li>
                <li><a href="allpatientList"><i class="fa fa-reply-all" aria-hidden="true"></i>Reply Request</a></li>
                <li><a href="showLoginForm"><i class="fa fa-reply" aria-hidden="true"></i>Log Out</a></li>
            </ul>
        </div>
        <div class="main_content">
            <div class="header">User
                
            </div>
            <div class="info">
             <div>
            
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>DateOfBirth</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>EmailAddress</th>
                    <th>ServiceType</th>
                   	<th>Description</th>
                   	<th>ActionInRow</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%int index = 1;%>
								<c:forEach var="patient" items="${patientList}">
									<tr>
										<td>#<%=index++%></td>
										<td>${patient.name }</td>
										<td>${patient.age}</td>
										<td>${patient.dob}</td>
										<td>${patient.gender}</td>
										<td>${patient.address}</td>
										<td>${patient.phone}</td>
										<td>${patient.email}</td>
										<td>${patient.servicetypename }</td>
										<td>${patient.description }</td>
										
										<td align=center>
											<a href="deletePatient/${patient.id}" class="delete" title="Delete">Delete</a>
										</td>
									</tr>
								</c:forEach>
                </tr>
               
            </tbody>
         </table>
     </div>
     </div>
     </div>
     </div>
     <script>
     function confirmDelete() {
	  var confirmation = confirm("Are you sure to delete?");

	  if (confirmation) {
	    // Delete action
	    console.log("Item deleted!");
	  } else {
	    // Cancel action
	    console.log("Deletion canceled!");
	  }
	}
</body>
</html>
                  