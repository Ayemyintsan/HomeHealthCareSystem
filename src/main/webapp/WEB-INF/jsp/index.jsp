<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

    
    
    <title>Home Page</title>
    <style>
        body{
            background-color:#eef2f5;
            }
        
        section{
        	
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
            font-size: 18px;
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
            

        }
        .a{
            color: azure;
            float: right;
            font-size: 15px;
            font-family: 'Times New Roman', Times, serif;
        }
        .sec3{
            color: azure;
            display: inline-block;
            background-color:antiquewhite;
            color: #393e6f;
            width: 25%;
           height: 10em;
           padding: 20px;
           margin: 20px;
        }
        .sec4{
            color: azure;
            color: azure;
            display: inline-block;
            color:#393e6f;
            background-color:antiquewhite;
            width: 25%;
            height: 10em;
            padding: 20px;
            margin: 20px;
        }
        .sec5{
            color: azure;
            display: inline-block;
            background-color:antiquewhite;
            color:#393e6f;
            width: 25%;
            height: 10em;
            padding: 20px;
            margin: 20px;
        }
       
        
    </style>
</head>
<body>
    
    <section >
    <img src="https://seniorhomecarecalgary.com/wp-content/uploads/SHBA-homecare-Logo.png" width="100px" height="70px"/>
    </section>
   
    <section class="section1">
        <a href="home">Home</a>
        <a href="about_us">About Us</a>
        <a href="service">Services</a>
        <!-- <a href="physician">Department</a> -->
         <a href="signup">Contact Us</a>
        <a href="contact"> SignUp</a>
        <a href="showLoginForm">AdminLogin</a>
        
    </section>
    
    <h1>HOME HEALTH CARE </h1>

    <div class="container">
    <img src="http://blog.dulcian.com/wp-content/uploads/2015/06/HomeCare.jpg" width="100%" height="700em" alt="Health Care"/>
    
       
    
    <section class="sec3">
        
    
    <h2>Experienced Caregivers</h2>
    <p>Our professional compassionate, dependable caregivers are experienced and trusted.</p>
   
    </section>

    <section class="sec4">
        
        <h2>Special Needs Care</h2>
        <p>We are experienced in caring for clients with Parkinsons, Alzheimer’s and related dementia.</p>
    </section>

    <section class="sec5">
        
        <h2>24/7 On Call Service</h2>
        <p>We are always available with our 24/7 on call service. Call us anytime with urgent matters or concerns.</p>
    
    </section>
    <footer><p>&#128222;Call Today!09-767 303 582   
        <a href="contact_us.html" class="a"> Contact Us</a> 
        <a href="physician.html" class="a">Department</a>
        <a href="service.html" class="a">Services</a>
        <a href="about_us.html" class="a">About Us</a> 
        <a href="home.html" class="a">Home</a> 
    </p></footer>
</body>
</html>