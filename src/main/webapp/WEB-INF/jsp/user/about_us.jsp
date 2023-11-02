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
    <title>About Us</title>
     <style>
        body{
            background-color: #eef2f5;
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
            text-align: center;
        }
        
        h2{
            
            font-style: italic;

        }
       
        .nav{
            text-align: center;
        }
       
        section{
            display: inline-block;
            width: 40%;
            height: 10em;
            padding: 20px;
            
        }
        h2{
            background-color:aliceblue;
            height: 3em;
        }
        
        button{
            background-color: #594f8d;
            float: right;
            color:azure;
        }
        footer{
            color: azure;
            background-color: #594f8d;
            width: 100%;
            height: 2.5em;
            font-weight: bold;
            font-style: normal;
            font-size: 20px;
            margin: 0;
            padding: 10px;
        }
        .a{
            color: azure;
            float: right;
            font-size: 15px;
            font-family: 'Times New Roman', Times, serif;
        }
        .sec3{
            padding: 20px;
            margin: 10px;
            display: inline-block;
           
            width: 50%;
            height: 0em;
        }
        .sec5{
            display: inline-block;
            width: 40%;
            height: 20em;
         }

		 h2{
          background-color: aliceblue;
          height: 2.5em;
          font-style: italic;
        }        
        
    </style>
</head>
<body>
    <header>
    <section class="sec1">
        <img src="https://seniorhomecarecalgary.com/wp-content/uploads/SHBA-homecare-Logo.png" width="60px" height="70px"/>
        </section>
       
        <section class="sec2">
            <a href="home">Home</a>
        <a href="about_us">About Us</a>
        <a href="service">Services</a>
       	<!--<a href="physician">Department</a> -->
        <a href="signup">Contact Us</a>
        <a href="contact"> SignUp</a>
        <a href="showUserLoginForm"> Login</a>
        <%--<a href="logout" onclick="return confirm('Are you sure to logout?')"> LogOut</a> --%>
        </section>
        
   <h1>HOME HEALTH CARE</h1>
   </header>
   <div class="container">
    <h2>About Us</h2>

    <img src="https://s3.amazonaws.com/systemimage/44407339_Subscription_S.jpg" width="120px" height="120px"/>
    <section class="sec3">
        <p><h3> ABOUT OUR HOME HEALTH CARE </h3>
            OUR HOME HEALTH CARE is local. Our Home Care is dedicated to assisting people of all ages and abilities in enhancing their quality 
            of life while having the benefit of enjoying the comfort 
            and familiarity of their own homes. </p>
        <p>Our Home Care staff are friendly, reliable, and compassionate individuals committed to providing care, services, and support to patients and their
             families. Center Home Care is passionate about providing high quality care to its
             patients while maintaining the dignity and respect of those needing the care.</p>
             <p>Our Home Care is to provide care, services, and support to patients and their families so they are able to enjoy life to its fullest.</p>
    
    </section>
    <section class="sec5">
        <img src="https://optimalcareservices.com/wp-content/uploads/2018/10/backcare.jpg" width="100%" height="100%"/>
    </section>

    
    <footer><p>&#128222;Call Today!09-767 303 582   
        <a href="contact" class="a"> Contact Us</a> 
        <!-- <a href="physician" class="a">Department</a> -->
        <a href="service" class="a">Services</a>
        <a href="about_us" class="a">About Us</a> 
        <a href="home" class="a">Home</a> 
    </p></footer>

   </div>
    
</body>
</html>