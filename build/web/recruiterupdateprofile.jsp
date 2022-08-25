
<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <link href="css/theme.css" rel="stylesheet" media="all">
<title> Updae Profile </title>
</head>
<body>


<% 
String username=(String)session.getAttribute("username");
String usertype=(String)session.getAttribute("usertype");
if(username==null || usertype!="recruiter") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp
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
                            <span class="logo_title"> Corporate Profile</span>
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



<jsp:include page="recruitermenu.jsp"/>


 </div>

                        <div class="col-xl-9">
              
<center>
<fieldset>
<legend>Profile Details</legend>
<%
Connection con=null;
Statement stmt=null;
ResultSet rs=null;

 Class.forName("com.mysql.jdbc.Driver");
 String url="jdbc:mysql://localhost:3306/employment";

 con=DriverManager.getConnection(url,"root","");
 stmt=con.createStatement();
 
 rs=stmt.executeQuery("select * from corporate where username='"+username+"'");

%>
	
	<%

 while(rs.next())
 {
%>
<form method="post" action="recruiterupdateprofileaction.jsp">
<table>

    <tr>
<td>Name</td>
<td><input type="text" name="name" placeholder="Name" value=<%=rs.getString("username") %>></td>
</tr>
    
<tr>
<td>First Name</td>
<td><input type="text" name="fname" placeholder="FirstName" value=<%=rs.getString("fname") %>></td>
</tr>

<tr>
<td>Last Name</td>
<td><input type="text" name="lname" placeholder="LastName" value=<%=rs.getString("lname") %>></td>
</tr>

<tr>
<td>Company Name</td>
<td><input type="text" name="company" value=<%=rs.getString("company") %>></td>
</tr>


<tr>
<td>Location</td>
<td><input type="text" name="location" value=<%=rs.getString("location") %>></td>
</tr>

<tr>
<td>Email</td>
<td><input type="text" name="email" value=<%=rs.getString("email") %>></td>
</tr>

<tr>
<td>Mobile</td>
<td><input type="text" name="mobile" value=<%=rs.getString("mobile") %>></td>
</tr>

<tr>
<td>Gender</td>
<td><input type="radio" name="gender" value="male" required>Male<input type="radio" name="gender" value="female" required>Female</td>
</tr>

<tr>
<td>&nbsp;</td>
</tr>

<tr>
<td align="center" colspan=2><input type="submit" value="Update"></td>
</tr>

</table>
</form>
<%
 }
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