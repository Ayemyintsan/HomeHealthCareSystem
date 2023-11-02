<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
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
    <title>Reply</title>

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
    .wrapper .sidebar h4{
      
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
        font-size: 20px;
        font-weight: bold;
        
        border-bottom: 1px solid #e0e4e8;
    }
    .wrapper .main_content .info{
        margin: 20px;
        color: #717171;
        line-height: 35px;
    }
    .btn{
      background-color:#594f8d ;
    }
    .btn :hover{
      background-color:#594f8d ;
    }
    </style>
</head>
<body>
  <div class="wrapper">
    <div class="sidebar">
        <h4>HOME HEALTH CARE</h4>
        <ul>
        <li><a href="dashboard"><i class="fa fa-home aria-hidden="true"></i>Dashboard</a></li>
                <li><a href="userList"><i class="fa fa-user" aria-hidden="true"></i>User</a></li>
                <li><a href="allpatientList"><i class="fa fa-user" aria-hidden="true"></i>Request Patient</a></li>
       			<li><a href="acceptpatient"><i class="fa fa-user" aria-hidden="true"></i>SavePatient</a></li>
                <li><a href="servicetypeList"><i class="fa fa-folder" aria-hidden="true"></i>ServiceType</a></li>
                <li><a href="allserviceList"><i class="fa fa-folder" aria-hidden="true"></i>Services</a></li>
                 <!-- <li><a href="departmentList"><i class="fa fa-folder" aria-hidden="true"></i>Department</a></li> -->
                <li><a href="messageList"><i class="fa fa-user-circle" aria-hidden="true"></i>Message</a></li>
                <li><a href="supervisorList"><i class="fa fa-user-circle" aria-hidden="true"></i>Supervisor</a></li>
                <li><a href="allcaregiverList"><i class="fa fa-user-nurse" aria-hidden="true"></i>Caregiver</a></li>
                <li><a href="showLoginForm" onclick="return confirm('Are you sure to logout?')"><i class="fa fa-reply" aria-hidden="true"></i>Log Out</a></li>
        </ul>
    </div>
    <div class="main_content">
        <div class="header">Reply Request</div>
        <div class="info">
         <div>

    <form:form action="/HomeHealthCareSystem/editSavePatient" modelAttribute="patient" method="post">
        
        <div class="input-group">
             <span class="input-group-addon"><i class="glyphicon glyphicon-th-list"></i></span>
             <form:input id="patid" type="text" class="form-control" path="patid"  />
        </div>
        <br>
        
        <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
          <form:input id="name" type="text" class="form-control" path="name" placeholder="PatientName" />
        </div>
        <Br>
        
       
        
         <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-stats"></i></span>
            <form:input id="duration" type="text" class="form-control" path="duration" placeholder="Duration" />
          </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-triangle-right"></i></span>
           <% // Get the current date
    	  java.util.Date currentDate = new java.util.Date();
	  // Create a SimpleDateFormat instance to format the date
	  SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

	  // Extract day, month, and year from the current date
	  Calendar calendar = Calendar.getInstance();
	  calendar.setTime(currentDate);
	  int day = calendar.get(Calendar.DAY_OF_MONTH);
	  int month = calendar.get(Calendar.MONTH) + 1; // Month starts from 0, so add 1
	  int year = calendar.get(Calendar.YEAR);
    								  
	  String monthString=Integer.toString(month);
	  int monthLength=monthString.length();
	  String assistmonth;
	  if (monthLength==1){
		  assistmonth="0";
	  }else{
		  assistmonth="";
	  }
	  String dayString=Integer.toString(day);
	  int dayLength=dayString.length();
    	  String assistday;
    	  if (dayLength==1){
    		  assistday="0";
    	  }else{
    		  assistday="";
    	  }
		  
    	  String today=year+"-"+assistmonth+month+"-"+assistday+day;
    	%> 
            <form:input id="sdate" type="date" class="form-control" path="sdate" min="<%= today %>" placeholder="StartDate"  required="true"/>
          </div>
        <br>
        
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-triangle-left"></i></span>
            <% // Get the current date
    	  
    	%>  
            <form:input id="edate" type="date" class="form-control" path="edate" min="<%= today %>" placeholder="EndDate" required="true"/>
          </div>
        <br>
        
       
      	   
         <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-folder-open"></i></span>                
                   <form:select class="form-control" path="servicetypeid" required="true">
					<c:forEach var="serviceType" items="${servicetypeList}">
				<form:option value="${serviceType.id}">${serviceType.name}</form:option>
				</c:forEach>
			</form:select>                                    
              </div>
        
        
       
        <Br>
         <div class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-folder-open"></i></span>                
                   <form:select class="form-control" path="id" required="true" >
					<c:forEach var="message" items="${messageList}">
				<form:option value="${message.id}">${message.name}</form:option>
				</c:forEach>
			</form:select>                                    
              </div>
        
        
			
          <br>
        
         <div class="input-group">
             <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
              <form:select class="form-control" id="sel1" path="careid" required="true">
                
               <c:forEach var="caregiver" items="${caregiverList}">
				<form:option value="${caregiver.careid}">${caregiver.name}</form:option>
				</c:forEach>
                
                
              </form:select>
            </div>
            <br> 
             
  <div class="input-group">
          <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
          <form:input id="price" type="text" class="form-control" path="price" placeholder="price"/>
        </div>
        
<br>
<center><button type="submit" class="btn btn-primary ">CONFIRM</button></center>




</form:form>
</div>
</div>
</div>
</div>
</body>
</html>


