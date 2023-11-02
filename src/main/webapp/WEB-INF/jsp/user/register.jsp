<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.java.bean.*" %>
<%--<%
	if(session.getAttribute("userSession")==null){
		response.sendRedirect("home");
	}
	User user=(User)session.getAttribute("userSession");
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Register</title>
    <style>
        body{
            background-color: #eef2f5;
            font-family: 'Times New Roman', Times, serif;
           font-size: 20px;
        }
        .sec1{
            position: sticky;
            display: inline-block;
            text-align: center;
            width: 35%;
           

        }
        .sec2{
            position:sticky;
            display: inline-block;
            float: right;
            margin: 20px;
            width: 50%;
            height: 3em;

        }
        
        a{
          color: #393e6f;
            text-decoration: none;
            padding: 10px;
            font-weight: bolder;
            font-size: 20px;
        }
        h1{
          font-size: 35px;
          font-weight: bold;
            text-align: center;
        }
        h2{
          font-size: 30px;
          font-weight: bold;
          padding: 20px;
            background-color: aliceblue;
            
            height: 2.5em;
           
        }
        .section{
          font-weight: bold;
          padding: 20px;
            display: inline-block;
            width: 50%;
            height: 50%;
        }
        .section1{
          font-weight: bold;
            display: inline-block;
            width: 40%;
           
            padding: 20px;
            margin: 20px;
            float: right;
        }
        
        .container{
            
            position: relative;
            background-color: #fff;
            max-width: 900px;
            width: 69%;
            height: 500px;
            border-radius: 6px;
            padding: 30px;
            margin: 0 15px;
            background-color: #fff;
            box-shadow: 0 5px 10px rgb(0 0 0 1);
            

    }
    .button{
      color: azure;
      background-color: #594f8d;
    }
    
    footer{
      color: azure;
            background-color: #594f8d;
            width: 100%;
            height: 2.5em;
            font-weight: bold;
            font-style: normal;
            font-size: 20px;
            padding: 10px;
            
        }
        .a{
          color: azure;
            float: right;
            font-size: 15px;
            font-family: 'Times New Roman', Times, serif;
        }
    
    </style>
</head>
<body>
    <header>
        <section class="sec1">
            <img src="https://seniorhomecarecalgary.com/wp-content/uploads/SHBA-homecare-Logo.png" width="120px" height="100px"/>
            </section>
           
            <section class="sec2">
                <a href="home">Home</a>
        		<a href="about_us">About Us</a>
        		<a href="service">Services</a>
        		<!-- <a href="physician">Department</a> -->
        		 <a href="signup">Contact Us</a>
        		<a href="contact"> SignUp</a>
        		<a href="showUserLoginForm"> Login</a>
        		 <a href="logout" onclick="return confirm('Are you sure to logout?')"> LogOut</a>
            </section>
            
       <h1>HOME HEALTH CARE</h1>
       </header>
    <h2> You can Choose Any Service and Register Now!!</h2>
    
    <div class="container">
        <h4>To request additional information, complete this form and click Submit.</h4>
        
          <form:form action="savePatient" modelAttribute="patient" method="post">
          
            <div class="form-group">
             <label>Name</label>
              <form:input class="form-control" id="name" type="text" path="name" placeholder="Name" maxlength="49" pattern="^[A-Za-z\s]+$" required="true"/>
            </div>
            
			<div class="form-group">
              <label>Duration of Service</label>
              <form:input class="form-control" id="duration" type="text" path="duration" placeholder="Duration" maxlength="29" required="true"/>
            </div>
                      
            
         <div class="form-group">
              <label>Services</label>                    
                   <form:select class="form-control" path="servicetypeid" required="true">
					<c:forEach var="serviceType" items="${servicetypeList}">
				<form:option value="${serviceType.id}">${serviceType.name}</form:option>
				</c:forEach>
			</form:select>                                    
              </div>

			
			
			<div class="form-group">
              <label>Message</label>
              <form:select class="form-control" path="id" required="true">
					<c:forEach var="message" items="${messageList}">
				<form:option value="${message.id}">${message.name}</form:option>
				</c:forEach>
			</form:select>
            </div>
      
			
<br>
<center>
        <button type="submit" class="btn btn-primary " onclick="clickOk()">Submit</button>
  </center>      
</form:form>
</div>

<footer>&#128222;Call Today!09-767303582
  <a href="contact" class="a"> Contact Us</a> 
        <!-- <a href="physician" class="a">Department</a> -->
        <a href="service" class="a">Services</a>
        <a href="about_us" class="a">About Us</a> 
        <a href="home" class="a">Home</a>
</footer>
    

    <script>
        function clickOk(){
            alert("Your Registration is Successfully! We will contact you via Email.")
        }
    </script>
</body>
</html>