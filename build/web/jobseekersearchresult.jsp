<%@ page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <link href="css/theme.css" rel="stylesheet" media="all">
<title> JobSeeker Search Result </title>
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

 <div class="page-wrapper">
        <!-- HEADER DESKTOP-->
        <header class="header-desktop4">
            <div class="container">
                <div class="header4-wrap">
                    <div class="header__logo">
                        <a href="#">
                            <span class="logo_title"> JobSeeker</span>
                        </a>
                    </div>
                    <div class="header__tool">
                        
                       
                        <div class="account-wrap">
                            <div class="account-item account-item--style2 js-item-menu">
                               
                                <div class="content">
                                    <a class="js-acc-btn" href="#"><%=username %></a>
                                </div>
                                <div class="account-dropdown js-dropdown">
                                    
                                    
                                    
                                    <div class="account-dropdown__footer">
                                        <a href="logout.jsp">
                                            <i class="zmdi zmdi-power"></i>Logout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>





<jsp:include page="jobseekermenu.jsp"/>

 </div>
 <div class="col-xl-9">
<center>
<fieldset>
<% 
    

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/employment";

con=DriverManager.getConnection(url,"root","");
stmt=con.createStatement();


rs=stmt.executeQuery("select * from vacancy"); 

while(rs.next())
{
%>
<hr width=30%>
<div>
<table width=30%>
    
    <tr>
        <td>Job ID:
<td><%=rs.getString("jobid") %></td>

</tr>
<tr>
<td>Job Title:
<td><b><a href="jobseekerjobdetails.jsp?jobid=<%=rs.getString("jobid") %>"><%=rs.getString("title") %></a></b></td></td>

</tr>
<tr>
    <td>Experience:</td>
<td><%=rs.getString("experience") %>&nbsp;Years</td>
</tr>
<tr>
        <td>Location:</td>

<td><%=rs.getString("location") %></td>
</tr>
<tr>
        <td>Salary:</td>

<td><%=rs.getString("salary") %> $</td>
</tr>

<td>No. of vacancy:</td>

<td><%=rs.getString("vacancy") %></td>
</tr>
</table>
</div>
<hr width=30%>
<%	
}
rs.close();
stmt.close();
con.close();
%>
</fieldset>
</center>

 </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- END PAGE CONTENT  -->

    </div>














 <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
  
 

    <!-- Main JS-->
    <script src="js/main.js"></script>

</body>

</html>