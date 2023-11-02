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
    .sec1{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 20%;
            height: 9em;
            padding: 15px 20px;
            margin: 15px;
            background-color:#bdb8d7;
        }
        .sec1 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .sec1 .text{
            white-space: nowrap;
            font-size: 20px;
            font-weight: 500;
             color: var(--text-color); 
            text-align: center;
        }
        .sec1 .number{
            
            font-size: 22px;
            font-weight: 500;
            color: var(--text-color);
        }
         .sec2{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 20%;
            height: 9em;
            padding: 15px 20px;
            margin: 15px;
            background-color:#9182c4;
        }
        .sec2 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .sec2 .text{
            white-space: nowrap;
            font-size: 20px;
            font-weight: 500;
            color: var(--text-color);
        }
        .sec2 .number{
            
            font-size: 22px;
            font-weight: 500;
            color: var(--text-color);
        }
         .sec3{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 20%;
            height: 9em;
            padding: 15px 20px;
            margin: 15px;
            background-color:#8fb1e9;
        }
          .sec3 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .sec3 .text{
            white-space: nowrap;
            font-size: 20px;
            font-weight: 500;
            color: var(--text-color);
        }
        .sec3 .number{
            
            font-size: 22px;
            font-weight: 500;
            color: var(--text-color);
        }
         .sec4{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 20%;
            height: 9em;
            padding: 15px 20px;
            margin: 15px;
            background-color:#ca9dd7;
        }
          .sec4 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .sec4 .text{
            white-space: nowrap;
            font-size: 20px;
            font-weight: 500;
            color: var(--text-color);
        }
        .sec4 .number{
            
            font-size: 22px;
            font-weight: 500;
            color: var(--text-color);
        }
        
        .sec5{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 20%;
            height: 9em;
            padding: 15px 20px;
            margin: 15px;
            background-color:#ca9dd7;
        }
          .sec5 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .sec5 .text{
            white-space: nowrap;
            font-size: 20px;
            font-weight: 500;
            color: var(--text-color);
        }
        .sec5 .number{
            
            font-size: 22px;
            font-weight: 500;
            color: var(--text-color);
        }
        
         .sec6{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 20%;
            height: 9em;
            padding: 15px 20px;
            margin: 15px;
            background-color:#ca9dd7;
        }
          .sec6 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .sec6 .text{
            white-space: nowrap;
            font-size: 20px;
            font-weight: 500;
            color: var(--text-color);
        }
        .sec6 .number{
            
            font-size: 22px;
            font-weight: 500;
            color: var(--text-color);
        }
         
</style>

</head>

<body>

	    <div class="wrapper">
	        <div class="sidebar">
	            <h4>HOME HEALTH CARE</h4>
	            <ul>
	            <li><a href="dashboard"><i class="fa fa-home" aria-hidden="true"></i>Dashboard</a></li>
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
	            <div class="header">Dashboard</div>
            <a href="userList">
            <section class="sec1">
                <i class="fa fa-md" aria-hidden="true"></i>
                           <center><span class="text">USER</span></center>
                           <c:forEach var="count" items="${countuser}">
                           <center><span class="number">${count.id}</span></center>
                           </c:forEach>
            </section></a>
            <a href="servicetypeList">
             <section class="sec2">
                <i class="fa fa-md" aria-hidden="true"></i>
                           <center> <span class="text">SERVICETYPE</span></center>
                           <c:forEach var="countservicetype" items="${countservicetype}">
                           <center><span class="number">${countservicetype.id}</span></center>
                           </c:forEach>
            </section></a>
            <a href="supervisorList">
            <section class="sec3">
                <i class="fa fa-md" aria-hidden="true"></i>
                           <center> <span class="text">SUPERVISOR</span></center>
                           <c:forEach var="countsupervisor" items="${countsupervisor}">
                           <center><span class="number">${countsupervisor.supid}</span></center>
                           </c:forEach>
            </section></a>
            <br>
            <a href="allcaregiverList">
            <section class="sec4">
                <i class="fa fa-md" aria-hidden="true"></i>
                           <center> <span class="text">CAREGIVER</span></center>
                           <c:forEach var="countcaregiver" items="${countcaregiver}">
                           <center><span class="number">${countcaregiver.careid}</span></center>
                           </c:forEach>
            </section>
            </a>
            <a href="allpatientList">
             <section class="sec5">
                <i class="fa fa-md" aria-hidden="true"></i>
                           <center> <span class="text">PATIENT</span></center>
                           <c:forEach var="countpatient" items="${countpatient}">
                           <center><span class="number">${countpatient.patid}</span></center>
                           </c:forEach>
            </section>
            </a>
            <%-- <a href="departmentList">
            <section class="sec6">
                <i class="fa fa-md" aria-hidden="true"></i>
                           <center> <span class="text">DEPARTMENT</span></center>
                           <c:forEach var="countdepartment" items="${countdepartment}">
                           <center><span class="number">${countdepartment.id}</span></center>
                           </c:forEach>
            </section>
           </a>--%>
          </div>
       </div>
    </body>
</html>
          