<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
 <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <link href="css/theme.css" rel="stylesheet" media="all">
<title>Recruiter Add Job</title>
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
<legend>Post a Vacancy</legend>
<form action="recruiteraddjobaction.jsp"  method="post" id="jobform" >
<table>

    
<tr>
<td>Job ID</td>
<td><input type="number" name="jobid" required></td>
</tr>

<tr>
<td>Job Title:</td>
<td><input type="text" name="title" required></td>
</tr>

<tr>
<td>Location: </td>
<td>
<select  name="location" required>
<option> - Select -</option>
<option value="colombo">USA</option>
<option value="kandy">London</option>
<option value="badulla">Canada</option>


</select></td>	
</tr>

<tr>
<td>Minimum Experience</td>
<td>
<select name="experience" required>
					<option value="">- Select -</option>
					<option value="0">0</option>
					 <option value="1">1</option>

					 <option value="2">2</option>
					 <option value="3">3</option>
					 </select>&nbsp;Years</td>
</tr>

<tr>
<td >Salary:</td>
<td><input type="text" name="salary" required></td>
</tr>


<tr>
<td >Vacancy: </td>
<td><input type="number" name="vacancy" required></td>
</tr>

<tr>
<td >Interview Date:  </td>
<td><input type="date" name="interviewdate" required></td>
</tr>


<input type=hidden name="recruiter" value="<%=username %>">
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan=2 align=center><input type="submit" value="ADD" ></td>
</tr>

</table>
</form>

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