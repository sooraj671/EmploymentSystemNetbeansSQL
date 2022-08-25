<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<html>
<head>
<title>JobSeeker- Send Message Action</title>
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
    
String user=request.getParameter("user");
String jobid=request.getParameter("jobid");
String message="Applied for ";

 Connection con=null;
 Statement stmt=null;
 
 
  Class.forName("com.mysql.jdbc.Driver");
  String url="jdbc:mysql://localhost:3306/employment";

  con=DriverManager.getConnection(url,"root","");
  stmt=con.createStatement();
  
  stmt.executeUpdate("insert into application values('"+username+"','"+user+"','"+message+"','"+jobid+"')");
    
	  
	  stmt.close();
	  con.close();
  
  response.sendRedirect("jobseekersearchresult.jsp?message=success");
  
%>

</body>
</html>