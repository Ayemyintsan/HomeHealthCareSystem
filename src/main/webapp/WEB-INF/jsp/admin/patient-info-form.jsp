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
</style>
<body>
    <div class="wrapper">
        <div class="sidebar">
            <h2>HOME HEALTH CARE</h2>
            <ul>
                <li><a href="patient_request_form.html"><i class="fa fa-address-book" aria-hidden="true"></i>Request Form</a></li>
                <li><a href="service.html"><i class="fa fa-folder" aria-hidden="true"></i>Services</a></li>
                <li><a href="patient-info-form.html"><i class="fa fa-user" aria-hidden="true"></i>Patient Infromation</a></li>
                <!-- <li><a href="departmentList"><i class="fa fa-folder" aria-hidden="true"></i>Department</a></li> -->
                <li><a href="messageList"><i class="fa fa-user-circle" aria-hidden="true"></i>Message</a></li>
                <li><a href="supervisor.html"><i class="fa fa-user-circle" aria-hidden="true"></i>Supervisor</a></li>
                <li><a href="caregiver.html"><i class="fa fa-user-circle" aria-hidden="true"></i></i>Caregiver</a></li>
                <li><a href="reply.html"><i class="fa fa-reply-all" aria-hidden="true"></i>Reply Request</a></li>
                <li><a href="login.html"><i class="fa fa-reply" aria-hidden="true"></i>Log Out</a></li>
            </ul>
        </div>
        <div class="main_content">
            <div class="header">Patient Infromation</div>
            <div class="info">
                <div>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>FirstName</th>
                                <th>LastName</th>
                                <th>Physician</th>
                                <th>DateofBirth</th>
                                <th>Gender</th>
                                <th>Address</th>
                                <th>PhoneNo</th>
                                <th>Email Address</th>
                                <th>RegisterDate</th>
                                <th>ServicesPackage</th>
                                <th>ActionInRow</th>
                                
                                
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>U Aung</td>
                            <td>Aung</td>
                            <td>Psychiatrist</td>
                            <td>12/4/1940</td>
                            <td>Male</td>
                            <td>Yangon</td>
                            <td>0977887766555</td>
                            <td>aungaung@gmial.com</td>
                            <td>25/5/2020</td>
                            <td>Personal Care</td>
                            <td><button><a href="reply.html">Confrim</a></button></td>
                            
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>U Aung</td>
                            <td>Sein</td>
                            <td>Neurologist</td>
                            <td>6/4/1939</td>
                            <td>Male</td>
                            <td>Yangon</td>
                            <td>097865432189</td>
                            <td>aungsein@gmial.com</td>
                            <td>25/5/2020</td>
                            <td>Personal Care</td>
                            <td><button><a href="reply.html">Confrim</a></button></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Daw Aye</td>
                            <td>Aye</td>
                            <td>Osteoporosis</td>
                            <td>5/4/1939</td>
                            <td>Female</td>
                            <td>Yangon</td>
                            <td>0925457889</td>
                            <td>ayeaye@gmial.com</td>
                            <td>26/8/2020</td>
                            <td>Personal Care, Transporation</td>
                            <td><button><a href="reply.html">Confrim</a></button></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td> John</td>
                            <td>John</td>
                            <td>Gastroenterologist</td>
                            <td>20/9/1939</td>
                            <td>Male</td>
                            <td>Yangon</td>
                            <td>0998989898989</td>
                            <td>john@gmial.com</td>
                            <td>26/8/2020</td>
                            <td>Personal Care, Transporation</td>
                            <td><button><a href="reply.html">Confrim</a></button></td>
                        </tr>
                        <tr>
                            <td>5<
                </div>
            </div>
        </div>
    </div>
</body>
</html>