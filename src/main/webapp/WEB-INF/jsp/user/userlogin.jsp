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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous">
     </script>
    <title>Login</title>
    </head>
    <style>
        h1{
            text-transform: uppercase;
           color: azure;
        }
        body{
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #594f8d;
        }
        .container{
            position: relative;
            background-color: #fff;
            max-width: 900px;
            width: 40%;
            height: 400px;
            border-radius: 6px;
            padding: 30px;
            margin: 0 15px;
            background-color: #fff;
            box-shadow: 0 5px 10px rgb(0, 0, 0, 1);
        }
        .container form{
            position: relative;
            background-color: #f2f2f2;
            margin-top: 16px;
            background-color: #fff;
        }
        
        .input-field input{
            outline: none;
            font-size: 14px;
            font-weight: 400;
            color: #333;
            border-radius: 5px;
            border: 1px solid #aaa;
            padding: 0 15px;
            height: 42px;
            width: 420px;
            margin: 8px 0; 
        }
        button{
            background-color: #594f8d;
            width: 100%;
            height: 2.5em;
            color:white;
            border-radius: 6px;
            margin-top: 20px;
            text-align: center;
        }
        a{
        color:white;
        text-decoration:none;
        list-style:none;
        }
        span{
        color:red;
        }
    </style>
</head>
<body>
    <h1>Home Health Care</h1>
    <div class="container">
        
        <h3>Welcome Back!</h3>
        	<c:if test="${wrong_login}">
              		<span>You don't have an account. Please create an account.</span>
              </c:if>
              <c:if test="${wrong_email}">
              		<span>Wrong Email. Please try again.</span>
              </c:if>
              <c:if test="${wrong_password}">
              		<span>Wrong Password. Please try again.</span>
              </c:if>
        
        <div class="field">
            
			  <form:form action="userlogin" modelAttribute="user" method="post">
            <div class="form-group">
             <label>Email</label>
              <form:input class="form-control" type="text" path="email"/>
             </div>
             
             <div class="form-group">
              <label>Password</label>
              <form:input class="form-control" type="password" path="password"/>
             </div>
             
            
             
    	<br>

              <button type="submit" class="btn btn-primary btn-block">LOGIN</button>
                <button type="cancel" value="cancel"  class="btn btn-primary btn-block"><a href="${pageContext.request.contextPath}/cancelUser">CANCEL</a></button>
              
              
              
                </form:form>
            </div>
          
        </div>
       
    </body>
   
</html>