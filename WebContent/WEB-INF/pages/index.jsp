<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V17</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="t<html>
<head>
<title>College ERP</title>
    <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
<style>
body {
  background: #eee !important;
}

.wrapper {
  margin-top: 80px;
  margin-bottom: 80px;
}

.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #fff;
  border: 1px solid rgba(0, 0, 0, 0.1);
  height:370px;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 30px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  font-size: 16px;
  height: auto;
  padding: 10px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 20px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

</style>
</head>


  <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>

      <link rel="stylesheet" href="css/style.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      
          <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>



<script>
	function modalOpen(Name, Username, Email, password,ID) {
		const name = document.getElementById('name');
		
		const userName = document.getElementById('userName');
		//alert(id);
		const email = document.getElementById('email');
		const pwd = document.getElementById('pwd');
		const id = document.getElementById('id');
		document.write(argument.length);

		/* form.setAttribute('action', 'updateDish?dishId='+ id); */
		name.value = Name;
		userName.value = Username;
		email.value = Email;
		pwd.value = password;
		id.value = ID;

		$('#myModal').modal();

	}
</script>


      
<body>
                     
<div class="container" style="padding-top:300px;min-height:900px;">
    <form class="form-signin" action="adduser" method="post">        
      <h2 class="form-signin-heading">Please login</h2>

      <input type="text" class="form-control" name="email" placeholder="USERNAME" required="" autofocus="" />
      
      <input type="password" class="form-control" name="pwd" placeholder="PASSWORD" required=""/>      
     
     
     
      <div class="form-group"> 
	      
	      <label class="col-md-6">

	      </label>
	      
	      <label class="col-md-6">
	         
	      </label>
	      
      </div>
     
      <label style="color:red"></label>
      
         <div class="form-group">
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button> 
      </div>
       <div class="form-group"><a href="signup">Sign Up</a>
      </div> 
      <div class="form-group"><a  href="ForgotPass">Forgot password?</a>
      </div>
      <div class="form-group"><a  href="ChangePass">Change Password?</a>
      </div>
    </form>
  </div>
	<div align="center">
        <table border="1" cellpadding="5">
          <caption>List of users</caption>
			<tr>
                 <th>Name</th>
                 <th>UserName</th>
                <th>Email</th>
                <th>Password</th>
                <th>Edit</th>
                <th>Delete</th>
			</tr>
				<c:forEach var="user" items="${list}">
                <tr>
					<td><c:out value="${user.name}"/></td>
					<td><c:out value="${user.userName}" /></td>
					<td><c:out value="${user.email}" /></td>
					<td><c:out value="${user.pwd}" /></td>
					
					<td>
					        <form class="form-signin" action="editcourse" method="post">
							<button type="button" class="btn btn-info btn-lg" data-target="#myModal"
								onClick="modalOpen('${user.name}','${user.userName}','${user.email}','${user.pwd}','${user.id}')"
								>Edit</button>
								</form>
						</td>
						<td>
							<form class="form-signin" action="deleteCourse" method="post">
							<input type="hidden" name="id" value="${user.id }"/>
								<button type="submit" class="btn btn-danger">Delete</button>
							</form>
						</td>
					
					
					</tr>
            </c:forEach>
		</table>
    </div>
	
	
	
	
	<div class="container">
  
  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit details</h5>
					
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
          </button>
          
        </div>
        <form action="editcourse"  method="post">
        <div class="modal-body">
          <input type="hidden" id="id" name="id" />
          <label>Name:</label>
          <input type="text"  name="name" id="name" />
          <br />
          <label>User Name:</label>
          <input type="text"  name="userName" id="userName" />
          <br/>
          
          <label>Email:</label> 
          <input type="email"  name="email" id="email" />
          <br/>
          <label>password:</label>
          <input type="password"  name="pwd" id="pwd" />
          <br/>
        </div>
        
          <button class="btn btn-default" data-dismiss="modal">Close</button>
          <button class="btn btn-primary" type="submit">Save changes</button>
          
        </form>
      </div>
      
    </div>
  </div>
  
</div>
	
	
	
	
</body>
</html>ext/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="LogIn">
					<span class="login100-form-title p-b-34">
						Account Login
					</span>
					
					<div>
						<input id="first-name"  name="email" placeholder="User name">
						
					</div>
					<div >
						<input  type="password" name="pass" placeholder="Password">
						
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">
							Sign in
						</button>
					</div>
					${msg}
                  </form>
					<div class="w-full text-center p-t-27 p-b-239">
						<span class="txt1">
							Forgot
						</span>

						<a href="#" class="txt2">
							User name / password?
						</a>
					</div>

					<div class="w-full text-center">
						<a href="signup" class="txt3">
							Sign Up
						</a>
					</div>
		
				<div class="login100-more" style="background-image: url('images/bg-01.jpg');"></div>
			</div>
		</div>
	</div>
	
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>