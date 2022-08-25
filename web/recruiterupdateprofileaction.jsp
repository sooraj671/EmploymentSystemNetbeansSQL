<%@ page import="java.sql.*" %>
<html>
<head>
<title> Recruiter – Update Profile </title>
</head>
<body>
<%
String username=(String)session.getAttribute("username");
String usertype=(String)session.getAttribute("usertype");
%>
<% 
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String company=request.getParameter("company");

String location=request.getParameter("location");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String gender=request.getParameter("gender");

 Connection con=null;
 Statement stmt=null;
 ResultSet rs=null;
 ResultSet rs1=null;
 ResultSet rs2=null;
 ResultSet rs3=null;
 
  Class.forName("com.mysql.jdbc.Driver");
  String url="jdbc:mysql://localhost:3306/employment";

  con=DriverManager.getConnection(url,"root","");
  stmt=con.createStatement();
  
  rs=stmt.executeQuery("select * from login where username='"+username+"'");
  if(rs.next())
  {
  rs1=stmt.executeQuery("select * from corporate where username='"+username+"'");
	  if(rs1.next())
	  {
            stmt.executeUpdate("update corporate set username='"+username+"' , fname='"+fname+"' , lname='"+lname+"' , company='"+company+"'  , location='"+location+"' , email='"+email+"' , mobile='"+mobile+"' , gender='"+gender+"' where username='"+username+"' ");     
	  }
	  else
	  {
            stmt.executeUpdate("insert into corporate values('"+username+"','"+fname+"','"+lname+"','"+company+"','"+location+"','"+email+"','"+mobile+"','"+gender+"')");     
	  }
	 
	  stmt.close();
	  con.close();
  }
  response.sendRedirect("recruiterprofile.jsp");
  
%>
</body>
</html>