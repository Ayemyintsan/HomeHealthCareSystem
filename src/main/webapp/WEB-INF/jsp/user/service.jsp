<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.java.bean.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service</title>
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
            background-color: aliceblue;
            
            height: 2.5em;
            padding: 20px;
            font-style: italic;
            font-weight: bold;
        }
        .sec3{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 25%;
           height: 20em;
           padding: 20px;
           margin: 20px;
        }
        .sec4{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 25%;
           height: 20em;
           padding: 20px;
           margin: 20px;
        }
        .sec5{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 25%;
           height: 20em;
           padding: 20px;
           margin: 20px;
        }
        .sec6{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 25%;
           height: 20em;
           padding: 20px;
           margin: 20px;
        }
        .sec7{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 25%;
           height: 20em;
           padding: 20px;
           margin: 20px;
        }
        .sec8{
           color: azure;
           display: inline-block;
            background-color: #594f8d;
            width: 25%;
           height: 20em;
           padding: 20px;
           margin: 20px;
        }
        h5{
            text-align: center;
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
        a:hover {
  			background-color: #ddd;
  			color: black;
}

.previous {
  background-color: #594f8d;
  color: black;
   
}

.next {
  background-color: #594f8d;
  color: white;
   float: right;
}
        
  .round {
  border-radius: 50%;
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
        		<!-- <a href="physician">Department</a> -->
         		<a href="signup">Contact Us</a>
        		<a href="contact"> SignUp</a>
        		<a href="showUserLoginForm"> Login</a>
        		 <%--<a href="logout" onclick="return confirm('Are you sure to logout?')"> LogOut</a> --%>
            </section>
            
       <h1>HOME HEALTH CARE</h1>
       </header>
    <h3>Our Services</h3>
    <p>OUR HOME HEALTH CARE is the ideal service solution for elderly or disabled individuals
         who want to maintain their independence and dignity by continuing to live in the comfort of their own homes.  Our home health aides and companions make 
        their lives easier by performing many of the tasks which have become difficult and unmanageable.</p>
    <section class="sec3">
        <img src="http://thecampuscareercoach.com/wp-content/uploads/2015/09/jobs.jpg" width="100%" height="150em"/>
    
    <h5>PERSONAL CARE</h5>
    <ul>
        <li>Bathing and dressing assistance</li>
        <li>Hygiene supervision and assistance</li>
        <li>Supervising ambulation and preventing falls</li>
        <li>Medication remainders</li>
    </ul>
   
    </section>

    <section class="sec4">
        <img src="https://www.greatseniorliving.com/assets/img/companion-care-@3X.jpg" width="100%" height="155em"/>
        <h5>COMPANION CARE</h5>
    <ul>
        <li>Providing socalization, friendship & support</li>
        <li>Helping with correspondence</li>
        <li>Encoutaging stimulating activities</li>
        <li>Going on walks</li>
    </ul>
    
    </section>

    <section class="sec5">
        <img src="https://www.buckscounty-elderlaw.com/blog/wp-content/uploads/2015/11/Need-Help-at-Home-AdobeStock_29692590.jpeg" width="100%" height="150em"/>
        <h5>HOUSEHOLD ASSISTANCE</h5>
    <ul>
        <li>Cleaning bathroom and kitchen,washing dishes</li>
        <li>Doing laundry and changing bed lines</li>
        <li>Preparing and serving meals</li>
        <li>Mopping, dusting and vacuuming</li>
    </ul>
    
    </section>
	<section class="sec6">
        <img src="https://www.ezryde.com.sg/wp-content/uploads/2020/08/4-Wheelchair-Transport-to-Nursing-Home-in-Singapore.jpg" width="100%" height="150em"/>
        <h5>TRANSPORTATION</h5>
    <ul>
        <li>Driving and accompaning client to doctor</li>
        <li>Shopping and errands</li>
        <li>Bringing client to social gathering & activities</li>
        
    </ul>
    
    </section>

    <section class="sec7">
        <img src="https://www.nightingaleprivatecare.com/wp-content/uploads/hourly-home-care-services.jpg" width="100%" height="150em"/>
        <h5>ALZHEIMER'S / DEMENTIA CARE</h5>
    <ul>
        <li>Provide joy, laughter & purpose to individual</li>
        <li>Reduce challenging behaviours and boredom</li>
        <li>Make decisions and succeed with challenges.</li>
        
    </ul>
    
    </section>

    <section class="sec8">
        <img src="https://johnpauloshea.ie/wp-content/uploads/2017/07/Home-Care-Services.jpg" width="100%" height="150em"/>
        <h5>MISCELLANEOUS</h5>
    <ul>
        <li>Home satefy assessments</li>
        <li>Providing respite for family caregivers</li>
        <li>Assistance for those recovering from surgery</li>
        <li>pet care and vet trip</li>
    </ul>
    </section>
    
    <footer><p>&#128222;Call Today!09-767 303 582   
        <a href="contact" class="a"> Contact Us</a> 
        <!-- <a href="physician" class="a">Department</a> -->
        <a href="service" class="a">Services</a>
        <a href="about_us" class="a">About Us</a> 
        <a href="home" class="a">Home</a> 
    </p></footer>
    <br>
    <%-- <a href="service" class="previous round">&#8249;</a>
    <a href="service2" class="next round">&#8250;</a>--%>
    
</body>
</html>