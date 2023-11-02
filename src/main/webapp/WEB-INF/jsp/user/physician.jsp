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
    <title>Physician</title>
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
          font-style: italic;
        }
        .sec3{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        
        .sec4{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        .sec5{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        .sec6{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        .sec7{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        .sec8{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        .sec9{
            color: azure;
            display: inline-block;
            background-color: #594f8d;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        .sec10{
            color: azure;
            display: inline-block;
            background-color: #594f8d;;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        .sec11{
            color: azure;
            display: inline-block;
            background-color: #594f8d;;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        .sec12{
            color: azure;
            display: inline-block;
            background-color: #594f8d;;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        .sec13{
            color: azure;
            display: inline-block;
            background-color: #594f8d;;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        .sec14{
            color: azure;
            display: inline-block;
            background-color: #594f8d;;
            width: 20%;
            height: 19em;
            padding: 20px;
            margin: 20px;
        }
        
       
        h3{
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
            margin: 0;
            padding: 10px;
            
        }
        .a{
            color: azure;
            float: right;
            font-size: 15px;
            font-family: 'Times New Roman', Times, serif;
        }
        button{
            background-color: antiquewhite;
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
        <a href="physician">Department</a>
         <a href="signup">Contact Us</a>
        <a href="contact"> SignUp</a>
        </section>
        
   <h1>HOME HEALTH CARE</h1>
   </header>
    <h2>Our Department</h2>
    <section class="sec3">
      <img src="https://clipground.com/images/psychologist-logo-3.jpg" width="100%" height="60%"/>
        <h3>Psychologist</h3>
        <p>specialized in psychology and studies mental states, perceptual, cognitive, emotional, and social processes and behaviours.</p>
      
    </section>

    <section class="sec4">
      <img src="https://image.shutterstock.com/image-vector/knee-joint-icon-bones-graphic-260nw-1506733313.jpg" width="100%" height="60%"/>
        <h3 >Osteoporosis</h3>
        <p>specialized in bone mass with decreased density and enlargement of bone spaces producing porosity and fragility</p>
      
    </section>

    <section class="sec5">
        <img src="https://image.freepik.com/free-vector/gradient-mental-health-logo-template_23-2148820570.jpg" width="100%" height="60%"/>
        <h3>Psychiatrist</h3>
        <p> specialized in psychiatry, the branch of medicine devoted to the diagnosis, prevention, study, and treatment of mental disorders.</p>
      
    </section>

    <section class="sec6">
        <img src="https://cdn3.iconfinder.com/data/icons/e-commerce-web/400/human_mind-512.png" width="100%" height="60%"/>
        <h3>Neurologist</h3> 
        <p> specialized in diagnosing and treating diseases of the brain, spinal cord and nerves. </p>
      
    </section>

    <section class="sec7">
        <img src="https://img-aws.ehowcdn.com/450x235/s3-us-west-1.amazonaws.com/contentlab.studiod/getty/b0e647074fdf4e70a2771461bfa24852.jpg" width="100%" height="60%"/>
        <h3>Hematologist</h3>
        <p> specialized in researching, diagnosing, treating, and preventing blood disorders </p>
      
    </section>

    <section class="sec8">
        <img src="https://smhs.gwu.edu/sites/default/files/field/image/Heart_image.jpg" width="100%" height="60%"/>
        <h3 align="center">Cardiologist</h3>
        <p>specialized in heart and blood vessels and treat or help to prevent a  cardiovascular problem</p>
      
    </section>

    <section class="sec9">
        <img src="https://www.nicepng.com/png/detail/795-7952314_ear-nose-and-throat-board-icon-ent-clinic.png" width="100%" height="60%"/>
        <h3>Otolaryngologist</h3>
        <p>specializes in treating conditions that affect the ears, nose, and throat, as well as head and neck surgery.</p>
      
    </section>

    <section class="sec10">
        <img src="https://thumbs.dreamstime.com/b/stomach-logo-vector-illustration-design-creative-gastroenterology-healthy-element-icon-healthcare-template-208680754.jpg" width="100%" height="60%"/>
        <h3>Gastroenterologist</h3>
        <p>specializes in conditions that affect the organ and structure of the digestive system.</p>
      
    </section>

    <section class="sec11">
        <img src="https://ih1.redbubble.net/image.2045851322.7394/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg" width="100%" height="60%"/>
        <h3>General Surgeon</h3>
        <p> specialized in diagnosis and preoperative, operative, and postoperative management </p>
      
    </section>

    <section class="sec12">
        <img src="https://bukalemun.pusula.pau.edu.tr/upload/BIYS/siteler/ipd/editor/oncology-department.jpg" width="100%" height="60%"/>
        <h3>Oncologist</h3>
        <p>specialized in diagnosing and treating cancer. They provide for people with cancer to coordinate and manage their treatment.</p>
      
    </section>

    <section class="sec13">
        <img src="https://static.vecteezy.com/system/resources/previews/000/585/008/original/eye-care-vector-logo-design-template.jpg" width="100%" height="60%"/>
        <h3>Ophthalmologist</h3>
        <p> specialized in eye and vision care. Ophthalmologists must complete many more years of training than optometrists and opticians.</p>
      
    </section>

    <section class="sec14">
        <img src="https://cdn2.poz.com/105570_P03-19-008.jpg_4f2f25c8-cc27-40df-a287-7f2c3529c784.jpeg" width="100%" height="60%"/>
        <h3>Hepatologists</h3>
        <p> specialized in diagnose, treat, and manage problems associated with your liver, gallbladder, bile ducts, and pancreas. </p>
      
    </section>

    <button><a href="contact">Register Now</a></button>


    
    
    <footer><p>&#128222;Call Today!09-767 303 582   
        <a href="contact" class="a"> Contact Us</a> 
        <a href="physician" class="a">Department</a>
        <a href="service" class="a">Services</a>
        <a href="about_us" class="a">About Us</a> 
        <a href="home" class="a">Home</a> 
    </p></footer>
</body>
</html>