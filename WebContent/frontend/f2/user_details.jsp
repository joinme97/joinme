<!DOCTYPE html>
<%@page import="java.util.Random"%>
<%@page import="com.sjl.joinme.user.UserDTO"%>
<%@page import="com.sjl.joinme.contact.ContactDAO"%>
<%@page import="com.sjl.joinme.user.UserDAO"%>
<%@page
	import="com.sjl.joinme.selected_activity_list.SelectedActivityListDAO"%>






 

<%@page import="com.sjl.joinme.tags.TagsDAO"%>
<%@page
	import="com.sjl.joinme.created_activity_list.CreatedActivityListDAO"%>
<%@page
	import="com.sjl.joinme.created_activity_list.CreatedActivityListDTO"%>
<html lang="en">
<%
	if (session.getAttribute("user_id") == null) {
		session.setAttribute("user_id", 70);
	}
%>
<%!String message = "";%>
<%
	//to add a new contact 
	if ("add".equals(request.getParameter("add_user")) && request.getMethod().equalsIgnoreCase("post")) 
	{
		if (!new ContactDAO().friendExist((int) session.getAttribute("user_id") , Integer.parseInt(request.getParameter("friend_id"))))
		{
		new ContactDAO().addContact( (int)session.getAttribute("user_id") ,Integer.parseInt(request.getParameter("friend_id")));
			message="added";
		}
		

	}
else
if (!"details".equals(request.getParameter("show_details"))) {
	%>
	<jsp:forward page="home.jsp"></jsp:forward>
	<%
}

	UserDTO udto =  new UserDTO();
    udto=new UserDAO().getUser(Integer.parseInt(request.getParameter("friend_id")));
%>
<head>
	

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background: #ffffff00;
	color: #ffffff00;
}

#home-section {
	background: url("img/user.jpg") no-repeat;
	background-size: cover;
	background-attachment: fixed;
	min-height: 1080px;
}

#home-section .dark-overlay {
	background-color: rgba(0, 0, 0, 0);
	min-height: 1080px;
}

#home-section .home-inner {
	padding-top: 150px;
}

#home-section .card-form {
	opacity: 0.0;
}

#home-section .fa {
	color: #008ed6;
	background: #fff;
	padding: 4px;
	border-radius: 5px;
	font-size: 30px;
}

.navbar {
	border-bottom: #008ed6 3px solid;
	opacity: 0.8;
}

#authors img {
	width: 50%;
	margin-top: -130px;
}

#authors .fa {
	font-size: 25px;
}

#authors .card {
	background: #83899091;
	color: #fff;
}

#authors .card:hover .fa {
	color: #fff;
}
</style>

<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<!--  
</head>
<script>
	//(23.25023790227152, 77.47747421264648)

	function initMap() {
		var myLatLng = {
			lat :
<%//=adto.getLat()%>
	,
			lng :
<%//=adto.getLng()%>
	};
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 10,
			center : myLatLng
		});

		var marker = new google.maps.Marker({
			position : myLatLng,
			map : map,
			title : 'Hello World!'
		});

	}
</script>

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDJ7DiAylyJpPJlS8mPu5wJGbwWz7f9To4
&callback=initMap">
	
</script>


-->
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
		<div class="container">
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>

			<a href="index.html" class="w3-bar-item w3-right navbar-brand"><img
				class="w3-circle" src="img/joinme.jpg"
				style="width: 50px; margin-right: 5px;">JOIN ME!</a>

		</div>
	</nav>

	<!-- HOme section -->

	<header id="home-section">
		<div class="dark-overlay">
			<div class="home-inner">
				<!-- HEADINGGG -->
				<h5 class="display-4 text-center" style="margin-bottom: 130px;">
					<strong> Activity !</strong>
				</h5>
				<!-- Authoree details -->

				<section id="authors" class="my-5 text-center">
					<div class="container">

						<div class="row">



<!--  cost,count;

status; -->
							<div class="col text-center">
								<div class="card">
									<div class="card-body">
										<img src="pics/0 (<%=new Random().nextInt(1000)%150%>).jpg" alt="" class="img-fluid rounded-circle  mb-3">
										<%if((int) session.getAttribute("user_id") !=udto.getUser_id()&&!new ContactDAO().friendExist((int) session.getAttribute("user_id") , Integer.parseInt(request.getParameter("friend_id")))) {%>
		
										<form action="user_details.jsp" method="post">
											<div class="p-4">
												<input type="hidden" name="friend_id" value=<%=udto.getUser_id()%>> 
												<input class="btn btn-dark" type="submit" name="add_user" value="add">
											</div>
										</form>
										<%} %>
											<div class="p-4">
												<h1><%=udto.getFirst_name()%></h1>
												<h1>@<%=udto.getUnique_id()%></h1>
												<%=message%>
											</div>
		<!-- 
  location,
		 -->
										<h5 class="text-muted"></h5>
										<p><%=udto.getAbout()%></p>
										<h4 class="text-sm-left">Rating : <%=udto.getRating()%></h4>
										
										<form action="">
											<div class="form-group">
												<h4 class="text-sm-left">Comments :</h4>
												<textarea type="text" class="form-control form-control-lg" placeholder="Your Comments"></textarea>
											</div>
										</form>
										<h4 class="text-sm-left">Location on Map:</h4>
									</div>
								</div>
							</div>

<!--  
							<div class="col-lg-6">
								<br> <br>
								<div id="map"></div>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br>
							</div>
						</div>
						<br> <br> <br> <br> <br> <br> <br>
						<br> <br> <br> <br> <br>

-->

					</div>
			</div>

			</section>

		</div>
		</div>
	</header>

</body>
</html>

<%
	//to cleat data of
	message = "";
%>
