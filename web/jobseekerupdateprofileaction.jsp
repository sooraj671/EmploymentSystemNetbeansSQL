<%@ page import="java.sql.*" %>
<html>
<head>
<title>JobSeeker Update Profile Action</title>
</head>
<body>
<%
String username=(String)session.getAttribute("username");
String usertype=(String)session.getAttribute("usertype");
if(username==null || usertype!="jobseeker") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp
{
	 response.sendRedirect("index.jsp");
}
%>
<% 
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");

String email=request.getParameter("email");
String mobile=request.getParameter("mobile");

String education=request.getParameter("education");

String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
String hometown=request.getParameter("hometown");



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
  
  rs=stmt.executeQuery("select * from login where username='"+username+"' and usertype='"+usertype+"' ");
  if(rs.next())
  {
	  rs1=stmt.executeQuery("select * from jobseeker where username='"+username+"'");
	  if(rs1.next())
	  {
          stmt.executeUpdate("update jobseeker set username='"+username+"', fname='"+fname+"', lname='"+lname+"', email='"+email+"', mobile='"+mobile+"', "
          + "education='"+education+"', dob='"+dob+"', gender='"+gender+"', hometown='"+hometown+"' where username='"+username+"' ");     
	  }
	  else
	  {
	  stmt.executeUpdate("insert into jobseeker values('"+username+"','"+fname+"','"+lname+"','"+email+"','"+mobile+"',"
          + "'"+education+"','"+dob+"','"+gender+"','"+hometown+"')");     
          
	  }
	  rs.close();
	  stmt.close();
	  con.close();
  }
  response.sendRedirect("jobseekerprofile.jsp");
  
%>
</body>
</html>