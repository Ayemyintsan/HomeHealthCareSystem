<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.java.util.common"%>
<%@page import="com.java.bean.*" %>
<%@page import="com.java.bean.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	 
    <title>Contact</title>
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
            font-style: italic;
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
            width: 49%;
            height: 900px;
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
        .cancel{
         color:white;
          font-size: 15px;
        }
        .container .signin{
        font-size:15px;
        align :center;
        }
        .container .login{
        	float:right;
        	font-size:10px;
        }
        .form-group.span{
        font-size:10px
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
        <%-- <a href="logout" onclick="return confirm('Are you sure to logout?')"> LogOut</a>--%>
            </section>
            
       <h1> HOME HEALTH CARE</h1>
       </header>
     
    
    
    
    <div class="container">
        <center><h2>Create Your Account</h2></center>
        
        <c:if test="${wrong_login}">
              		<span>You have an account.Click <b>Login</b> and <b>Register</b>.</span>
              </c:if>
        
          <form:form action="saveUser" modelAttribute="user" method="post">
          
            <div class="form-group">
             <label>Name</label>
              <form:input class="form-control" id="inputdefault" type="text" path="name" placeholder="Name" pattern="^[A-Za-z\s]+$" maxlength="49" required="true"/>
            </div>
            

            <div class="form-group">
             <label>Age</label>
              <form:input class="form-control " id="inputlg" type="text" path="age" placeholder="Age" pattern="[1-9][0-9]?|1[0-2][0-9]|100" title="Please enter a valid age (1-130)" required="true"/>
            </div>
            
            

            <div class="form-group" >
             <label>Gender</label>
              <form:select class="form-control" id="sel1" path="gender" >
                <form:option value="Male" lable="Male"/>
                <form:option value="Female" label="Female"/>
                
              </form:select>
            </div>
            
            <div class="form-group">
              <label>Address</label>
              <form:input class="form-control " id="address" type="text" path="address" placeholder="Address" maxlength="49" required="true"/>
            </div>
            
            <div class="form-group">
           <label>Phone Number</label>
              <form:input class="form-control " id="phone" type="text" path="phone" placeholder="+959767303582"
               onkeyup="validatePhone()" required="true"/>
              <span id="phone-error" style="color:red;"></span>
            </div>                   
            
            
            <div class="form-group">
             <label>Email Address</label>
              <form:input class="form-control" id="email" type="email" path="email" placeholder="aaaa@gmail.com" 
               onkeyup="validateEmail()" required="true"/>
            	<span id="email-error" style="color:red;"></span>
            </div> 
      
            
            <div class="form-group">
             <label>Password</label>
              <form:input class="form-control" id="password" type="password" path="password" placeholder="Password" maxlength="39" required="true"/>
            </div>
            
          
	<center>
      <button type="submit" class="btn btn-primary ">SUBMIT NOW</button>
      <button type="cancel" value="cancel"  class="btn btn-primary"><a href="${pageContext.request.contextPath}/cancelSaveUser" class="cancel">CANCEL</a></button>
     </center>   
        <br>
       <div class="signin">Already have account? 
        
       <div class="login"><a href="${pageContext.request.contextPath}/showUserLoginForm">Log in</a></div>
        
      <%--<li><a href="home"><i class="fa fa-reply" aria-hidden="true"></i>Log Out</a></li> --%>   
    </div>
    
    
    </form:form>
</div>
<footer>&#128222;Call Today!09-767303582
  <a href="contact" class="a"> Contact Us</a> 
       <!--  <a href="physician" class="a">Department</a> -->
        <a href="service" class="a">Services</a>
        <a href="about_us" class="a">About Us</a> 
        <a href="home" class="a">Home</a>
</footer>
 
   
   <script src="<%=common.url%>/js/jquery-3.3.1.min.js"></script> 
</body>
 
<script type="text/javascript">
	var email = document.getElementById("email");
	var emailError = document.getElementById("email-error")
	
	function validateEmail(){
		if(!email.value.match(/^[A-Za-z\._\-0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)){
			emailError.innerHTML = "Please enter a valid email";
			email.style.borderBottomColor = "red";
			return false;
		}
		emailError.innerHTML="";
		email.style.borderBottomColor="green";
		return true;
	}
	
</script>

<script type="text/javascript">
	var phone = document.getElementById("phone");
	var phoneError = document.getElementById("phone-error")
	
	function validatePhone(){
		if(!phone.value.match(/^\+?95[1-9]\d{9}$/)){
			phoneError.innerHTML = "Please enter a valid phone";
			phone.style.borderBottomColor = "red";
			return false;
		}
		phoneError.innerHTML="";
		phone.style.borderBottomColor="green";
		return true;
	}
	
</script>
</html>