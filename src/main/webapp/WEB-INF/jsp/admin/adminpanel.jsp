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
        .boxes{
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .sec1{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 24%;
            height: 8.5em;
            padding: 15px 20px;
            margin: 15px;
            background-color:#bdb8d7;
        }

        .sec2{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 24%;
            height: 8.5em;
            padding: 15px 20px;
            margin: 15px;
            background-color:beige;
        }

        .sec3{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 24%;
            height: 8.5em;
            padding: 15px 20px;
            margin: 15px;
            background-color:#bdb8d7;
        }

        .sec4{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 24%;
            height: 8.5em;
            padding: 15px 20px;
            margin: 15px;
            background-color:#bdb8d7;
        }
        .sec5{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 24%;
            height: 8.5em;
            padding: 15px 20px;
            margin: 15px;
            background-color:#bdb8d7;
        }
        .sec6{
            display:inline-block;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: 24%;
            height: 8.5em;
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
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
            text-align: center;
        }
        .sec1 .number{
            
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
        }
         
        .sec2 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .sec2 .text{
            white-space: nowrap;
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
        }
        .sec2 .number{
            
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
        }
        .sec4 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .sec4 .text{
            white-space: nowrap;
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
        }
        .sec4 .number{
            
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
        }
        .boxes  .box3{
            display:flex;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: calc(100% /3 - 15px);
            height: 8em;
            padding: 15px 20px;
            margin: 15px;
            background-color:bisque;
        }
        .sec3 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .sec3 .text{
            white-space: nowrap;
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
        }
        .sec3 .number{
            
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
        }
        .boxes  .box4{
            display:inline;
            flex-direction: column;
            align-items: center;
            border-radius: 12px;
            width: calc(100% /3 - 15px);
            height: 8em;
            padding: 15px 20px;
            
            background-color:bisque;
        }
        .boxes .box4 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .boxes .box4 .text{
            white-space: nowrap;
            font-size: 30px;
            font-weight: 500;
            color: var(--text-color);
        }
        .boxes .box4 .number{
            
            font-size: 30px;
            font-weight: 500;
            color: var(--text-color);
        }
        .sec5 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .sec5 .text{
            white-space: nowrap;
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
            align: center;
        }
        .sec5 .number{
            
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
        }
        .sec6 i{
            font-size: 15px;
            color: var(--text-color);
        }
        .sec6 .text{
            white-space: nowrap;
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
            align: center;
        }
        .sec6 .number{
            
            font-size: 25px;
            font-weight: 500;
            color: var(--text-color);
        }

    </style>
<body>
    <div class="wrapper">
        <div class="sidebar">
            <h4>HOME HEALTH CARE</h4>
            <ul>
            <li><a href="dashboard"><i class="fa fa-address-book" aria-hidden="true"></i>Dashboard</a></li>
                <li><a href="userList"><i class="fa fa-address-book" aria-hidden="true"></i>User</a></li>
                <li><a href="allpatientList"><i class="fa fa-user" aria-hidden="true"></i>Request Patient</a></li>
                <li><a href="servicetypeList"><i class="fa fa-user" aria-hidden="true"></i>ServiceType</a></li>
                <li><a href="allserviceList"><i class="fa fa-folder" aria-hidden="true"></i>Services</a></li>
                
                <li><a href="physicianList"><i class="fa fa-user-md" aria-hidden="true"></i>Physician</a></li>
                <li><a href="supervisorList"><i class="fa fa-user-circle" aria-hidden="true"></i>Supervisor</a></li>
                <li><a href="allcaregiverList"><i class="fa fa-user-nurse" aria-hidden="true"></i>Caregiver</a></li>
                <li><a href="allpatientList"><i class="fa fa-reply-all" aria-hidden="true"></i>Reply Request</a></li>
                <li><a href="showLoginForm" onclick="return confirm('Are you sure to logout?')"><i class="fa fa-reply" aria-hidden="true"></i>Log Out</a></li>
            </ul>
        </div>
        <div class="main_content">
            <div class="header">Admin Panel</div>

            <section class="sec1">
                <i class="fa fa-md" aria-hidden="true"></i>
                           <center> <span class="text">Patient</span></center><br>
                           <center><span class="number">13</span></center>
            </section>
                
            <section class="sec2">
                <i class="fa fa-md" aria-hidden="true"></i>
                <center> <span class="text">Physicians</span></center><br>
                <center> <span class="number">13</span></center>
            </section>

                    
            <section class="sec3">
                <i class="fa fa-md" aria-hidden="true"></i>
                <center>    <span class="text">Supervisors</span></center><br>
                <center>        <span class="number">13</span></center>
            </section>

            <section class="sec4">
                <i class="fa fa-md" aria-hidden="true"></i>
                <center>    <span class="text">Caregivers</span></center><br>
                    <center>      <span class="number">13</span></center>
            </section>

            <section class="sec5">
                <i class="fa fa-folder" aria-hidden="true"></i>
                <center>     <span class="text">ServiceTypes</span></center><br>
                    <center>       <span class="number">13</span></center>
            </section>

            <section class="sec6">
                <i class="fa fa-folder" aria-hidden="true"></i>
                <center>   <span class="text">Services</span></center><br>
                    <center>      <span class="number">13</span></center>
            </section>
                        
                        
                        </div>
</body>
</html>