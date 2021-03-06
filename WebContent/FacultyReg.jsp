<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ page import="com.eduportal.model.SubjectInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faculty Registration</title>
<script type="text/javascript">
var check = function() {
	  if (document.getElementById('fpass').value ==
	    document.getElementById('frepass').value) {
	    document.getElementById('message').style.color = 'green';
	    document.getElementById('message').innerHTML = 'matching';
		  document.getElementById("Button").disabled = false;
	  } else {
	    document.getElementById('message').style.color = 'red';
	    document.getElementById('message').innerHTML = 'not matching';
	    
	    document.getElementById("Button").disabled = true;
	  }
	}
	

function getXMLObject()  //XML OBJECT
{
   var xmlHttp = false;
               
   try 
   {
      xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");  // For Old Microsoft Browsers
   }catch (e)
    {
       try 
       {
          xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");  // For Microsoft IE 6.0+
       }catch (e2) { xmlHttp = false;   /* No Browser accepts the XMLHTTP Object then false */  }
    }

    if (!xmlHttp && typeof XMLHttpRequest != 'undefined') 
    {
        xmlHttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
    }
    return xmlHttp;  // Mandatory Statement returning the ajax object created
}

var xmlhttp = new getXMLObject();	//xmlhttp holds the ajax object

function ajaxFunction() 
{
	 if(xmlhttp.readyState == 0 || xmlhttp.readyState == 4 )        
    {
   	var uid = document.getElementById("funame").value;
   	//alert(uid);
   	
       xmlhttp.open("GET","CheckFacultyUsernameAvailabilityServlet?data="+uid, true);
       xmlhttp.onreadystatechange  = handleServerResponse;
         //  xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
       xmlhttp.send(null);//disconnect server
    }
}

function handleServerResponse() 
{
	 
   if (xmlhttp.readyState == 4) 
   {
       if(xmlhttp.status == 200) 
       {
       	var xmlMessage= xmlhttp.responseXML;
       	var valid=xmlMessage.getElementsByTagName("valid")[0].firstChild.nodeValue;
       	
       	if(valid=="true")
       	{
       		var validationMessage=document.getElementById("validationMessage");
       		validationMessage.innerHTML = "";
       		//document.getElementById("submitForm").disabled = false;
           }
       	
       	if(valid=="false")
       	{
       		var validationMessage=document.getElementById("validationMessage");
       		validationMessage.innerHTML = "Username already exists";
       		document.getElementById("funame").value="";
       		//document.getElementById("submitForm").disabled = true;
       	}
       }
       else 
       {
            alert("Error during AJAX call. Please try again");
       }
   }
}

</script>
</head>
<style>
body{
	font-family: Georgia;
	font-size: x-large;
	font-style: normal;
	font-variant: normal;
	color: #003366;

}
	a:hover {
    color: white;
    font-size: large;
	}
input[type=text] {
    background-color: #FDFACB;
    color: blue;
}
input[type=password] {
    background-color: #FDFACB;
    color: blue;
}
input[type=button], input[type=submit], input[type=reset],button {
    background-color: #003366;
    border: none;
    color: white;
    padding: 16px 16px;
    text-decoration: none;
    margin: 2px 2px;
    cursor: pointer;
}

</style>
<body background="b.jpg">

<%
	Random r=new Random();
	int x=r.nextInt(1000000);
	String id="F"+x;
	ArrayList<SubjectInfo> sublist=(ArrayList<SubjectInfo>) request.getAttribute("subjectlist");
	

	%>
	
	<h2>Faculty Registration</h2>
	<form action="FacultyRegServlet">
	
	<div align="center">
	Id &nbsp; &nbsp;
	
	<input type="text" id="id" name="id" readonly="readonly" value="<%=id %>">
	</div>
	<hr>

	<h4>Personal Details</h4><br/>
	<table align="center">
	<tr>
	<td>
	First Name 
	</td>
	<td>
	<input type="text" id="ffname" name="ffname" required>
	</td>
	</tr>
	
	<tr>
	<td>
	Last Name 
	</td>
	<td>
	<input type="text" id="flname" name="flname" required>
	</td>
	</tr>
	
	<tr>
	<td>Username</td>
	<td> <input type="text" id="funame" name="funame" onblur="ajaxFunction()" required></td>
	<td><div id="validationMessage"></div></td>
	</tr>
	
	<tr>
	<td>Password</td>
	<td> <input type="password" id="fpass" name="fpass" onkeyup='check();' required></td>
	</tr>
	
	<tr>
	<td>Re-enter Password</td>
	<td> <input type="password" id="frepass" name="frepass" onkeyup='check();' required></td>
	<td><span id='message'></span></td>
	</tr>
	
	<br>
	<tr>
	<td>Date of Birth </td>
	<td><input type="date" id="fdob" name="fdob" required></td>
	</tr>
	<br/>
	</table>
	
	<table align="center">
	<tr>
	<td>Gender </td>
	<td> <input type="radio" id="fgender" name="fgender" value="Male">Male</td>
	<td> <input type="radio" id="fgender" name="fgender"value="Female">Female</td>
	<td> <input type="radio" id="stgender" name="stgender"value="Other">Other</td>
	</tr>
	<br/>
	
	
	
	
	</table>
	<hr>
	
	<h4>Communication Details</h4>
	<br/>
	
	<table align="center">
	<tr>
	<td>Permanent Address</td>
	<td><input type="text" id="fpermanentaddr" name="fpermanentaddr">
	</td>
	</tr>
	
	<tr>
	<td>Present Address</td>
	<td><input type="text" id="fpresentaddr" name="fpresentaddr">
	</td>
	</tr>
	
	<tr>
	<td>Phone(Res)</td>
	<td><input type="text" id="fresph" name="fresph"></td>
	</tr>
	
	<tr>
	<td>Mobile</td>
	<td><input type="text" id="fmob" name="fmob" size=10 required>
	</td>
	<td>&nbsp;&nbsp;
	<div></div>
	</tr>
	
	<tr>
	<td>Email</td>
	<td><input type="email" id="femail" name="femail" size=10 required>
	</td>
	<td>&nbsp;&nbsp;
	<div></div>
	</tr>
	
	</table>
	<hr>
	
	<h4> Domain and Educational Details </h4>
	<br/>
	<table align="center">
	<tr>
	<td>Subject of Expertise </td>
	<td><input type="text" id="fsub" name="fsub">
	<select id="fsub" name="fsub">
	<%
	for(SubjectInfo sub:sublist)
	{
	%>
	<option><%=sub.getSname() %></option>
	<%} %>
	
	</select>
	
	</td>
	</tr>
	
	<tr>
	<td>Highest Qualification </td>
	<td>
	<select id="fqual" name="fqual">
	<option>Matriculate</option>
	<option>Bachelors</option>
	<option>Masters</option>
	<option>Doctorate</option>
	<option>Post Doctorate</option>
	
	</select>
	
	</td>
	</tr>
	
	<tr>
	<td>Institute of Highest Education</td>
	<td><input type="text" id="fcollege" name="fcollege"></td>
	</tr>
	
	
	</table>
	<br/>
	
	<input type="submit" value="Submit" id="Button">
	<input type="reset" value="Clear">
	
	
	</form>

</body>
</html>