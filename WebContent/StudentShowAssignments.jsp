<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.eduportal.model.AssignmentInfo" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
form
{
	float:left;
	
}
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
input[type=button], input[type=submit], input[type=reset] {
    background-color: #003366;
    border: none;
    color: white;
    padding: 16px 16px;
    text-decoration: none;
    margin: 2px 2px;
    cursor: pointer;
}

</style>

</head>
<body background="b.jpg">

<% ArrayList<AssignmentInfo> alist=(ArrayList<AssignmentInfo>)request.getAttribute("alist"); 
//HttpSession ses=request.getSession(false);

for(AssignmentInfo aobj:alist)
{
%>
<a href="StudentUploadAssignment.jsp?qno=<%=aobj.getQno() %>&fid=<%=aobj.getTeacher()%>"><%=aobj.getQuestion() %></a>

<br>

<%} %>

<a href="StudentHomepage.jsp">Home</a>
</body>
</html>