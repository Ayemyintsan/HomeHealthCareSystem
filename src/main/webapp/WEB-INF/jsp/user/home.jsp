<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.java.bean.*" %>
<%
	if(session.getAttribute("userSession")==null){
		User user=(User)session.getAttribute("userSession");
		
	}else{
		response.sendRedirect("logout");
	}

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    
    
    <title>Home Page</title>
    <style>
        body{
            background-color:#eef2f5;
            }
           
           
        
        section{
            position: relative;
            display: inline-block;
            text-align: center;
            width: 40%;


        }
        
        .section1{
            
            display: inline-block;
            float: right;
            margin: 20px;
            width: 50%;

        }
        
        a{
            color: #393e6f;
            text-decoration: none;
            padding: 10px;
            
            font-weight: bolder;
           font-size: 20px;
        }
        h1{
            text-align: center;
        }
        
        footer{
            background-color: #594f8d;
            width: 100%;
            height: 2.5em;
            font-weight: bold;
            font-style: normal;
            font-size: 20px;
            margin: 0;
            padding: 10px;
            color: azure;
        }
        .container{
            position: relative;
            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif
            
        }
        .text-block{
            
            position: absolute;
            bottom: 170px;
            left: 50px;
            height: 80em;
            color: black;
            padding-left: 60px;
            padding-right: 20px;
        }
        .text-block header{
            text-align: center;
        }
        .aa{
            color: white;
            background-color: #594f8d;
        }
        .section{
            
            display: inline-block;
            width: 40%;
            height: 10em;
            padding: 20px;
            font-family: 'Times New Roman', Times, serif;
        }
        h2{
            text-align: center;
            font-style: italic;

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
    
    <section >
    <img src="https://seniorhomecarecalgary.com/wp-content/uploads/SHBA-homecare-Logo.png" width="120px" height="120px"/>
    </section>
   
    <section class="section1">
        <a href="home">Home</a>
        <a href="about_us">About Us</a>
        <a href="service">Services</a>
        <!--<a href="physician">Department</a> -->
         <a href="signup">Contact Us</a>
        <a href="contact"> SignUp</a>
        <a href="showUserLoginForm"> Login</a>
        <%--<a href="logout" onclick="return confirm('Are you sure to logout?')"> LogOut</a> --%>
    </section>
   
    <h1> HOME HEALTH CARE </h1>

    <div class="container">
    <img src="https://aahealth.co/wp-content/uploads/2018/06/bigstock-Smiling-caregiver-embracing-ha-54611003_preview-1.jpeg" width="100%" height="500em" alt="Health Care"/>
    <div class="text-block">
       
        <h1>YOUR SATISFACTION IS OUR GOAL</h1>
        <a href="about_us" class="aa">GET MORE INFORMATION</a>
    </div>
</div>
    <section class="section">
        
        <h2>Trusted Home Care</h2>
        <p>Home Care is the ideal solution for seniors or disabled individuals who wish to keep their independence and dignity by continuing to live in the comfort of their own homes.
    </p>
    </section>

    <section class="section">
        
        <h2>Customized Care</h2>
        <p>We will create a customized plan of care based on your loved one’s needs and budget. We can provide care for just a few hours up to 24/7 live-in care.</p>
    </section>

    <section class="section">
        
        <h2>Compassionate Caregivers</h2>
        <p>Our team loves what they do. All of our caregivers are compassionate, dependable and friendly.</p>
    </section>

    <section class="section">
        
        <h2>24/7 Phone Support</h2>
        <p>We are always available with our 24-hour on call service. Speak with a supervisor for emergencies or to discuss important matters.</p>
    </section>

    <section class="section">
        
        <h2>Non-Medical Care Service</h2>
        <p> Home Care provides non-medical home care services to seniors, those recovering from surgery, and others. Our staff is fully committed to providing outstanding care to meet our clients’ needs 24/7.</p>
    </section>
    
    <section class="section">
        
        <h2>How to use</h2>
        <ul>
        <li>You enter the <b>Contact page</b>.</li>
        <li>If you have an account, you create the account fill with your information.
         	and <b>Register</b> for this service.</li>
         <li>If you have been create account, you don't use this services any reason or
         	 you're a client you ever use this service, you can register our service.
        </li></ul>
    </section>
    
    <div class="container">
        <img src="https://1homecare.co.uk/wp-content/uploads/2020/12/iStock_27046505_edited-800x533.jpg" width="100%" height="500em" alt="Health Care"/>

    

    <footer><p>&#128222;Call Today!09-767 303 582   
        <a href="contact" class="a"> Contact Us</a> 
        <!-- <a href="physician" class="a">Department</a> -->
        <a href="service" class="a">Services</a>
        <a href="about_us" class="a">About Us</a> 
        <a href="home" class="a">Home</a> 
    </p>
  </footer>
  </div>
</body>
</html>