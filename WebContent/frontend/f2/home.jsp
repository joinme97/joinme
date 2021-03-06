<!DOCTYPE html>
<%@page
	import="com.sjl.joinme.created_activity_list.CreatedActivityListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page
	import="com.sjl.joinme.created_activity_list.CreatedActivityListDAO"%>
<html>
<title>W3.CSS Template</title>
<%
	if (false && session.getAttribute("first_name") == null && session.getAttribute("user_id") == null) {
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Acme"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: 'Acme', sans-serif;
}

#authors img {
	margin-top: -50px;
}

#authors .fa {
	font-size: 25px;
}

#authors .card:hover {
	background: #3292a6;
	color: #fff;
}

#authors .card:hover .fa {
	color: #fff;
}

#home-section {
	background: url("img/background.jpg") no-repeat;
	background-size: cover;
	background-attachment: fixed;
	min-height: 1080px;
}
</style>
<!--  
<audio autoplay>
<source src="audio/01 - Happy Now - MusicMingo.Com.mp3"type="audio/mpeg">
</audio>-->
<body class="w3-light-grey">
	<header id="home-section">
		<!-- Top container -->
		<div class="w3-bar w3-top w3-black w3-large bg-dark"
			style="z-index: 4">
			<button
				class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey"
				onclick="w3_open();">
				<i class="fa fa-bars"></i> Menu
			</button>
			<span class="w3-bar-item w3-right"><img class="w3-circle"
				src="img/joinme.jpg" style="width: 50px;">JOIN ME!</span>
		</div>

		<!-- Sidebar/menu -->
		<nav
			class="bg-dark text-light w3-sidebar w3-collapse w3-white w3-animate-left"
			style="z-index: 3; width: 300px;" id="mySidebar">
			<br>
			<div class="w3-container w3-row">
				<div class="w3-col s4">
					<img
						src="data:image/jpeg;base64,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"
						class="w3-circle w3-margin-right" style="width: 46px">
				</div>
				<div class="w3-col s8 w3-bar">
					<span>Welcome,<br> <%=session.getAttribute("first_name")%></span><br>
					<!-- <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a> -->
				</div>
			</div>
			<hr>

			<div class="w3-bar-block ">
				<a href="#"
					class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black"
					onclick="w3_close()" title="close menu"><i
					class="fas fa-user-alt"></i>Close Menu</a> <a href="home.jsp"
					class="w3-bar-item w3-button w3-padding w3-blue"><i
					class="fa fa-users fa-fw"></i>Home</a> <a href="my_activities.jsp"
					class="w3-bar-item w3-button w3-padding  "><i
					class="fa fa-user fa-fw"></i> My Activities</a> <a
					href="selected_activities.jsp"
					class="w3-bar-item w3-button w3-padding  "><i
					class="fa fa-eye fa-fw"></i>Selected Activities</a> <a
					href="search_activities.jsp"
					class="w3-bar-item w3-button w3-padding"><i
					class="fa fa-search fa-fw"></i>Search Activities</a> <a
					href="contacts.jsp" class="w3-bar-item w3-button w3-padding"><i
					class="fa fa-users fa-fw"></i>My Contacts</a> <a
					href="activity_request.jsp"
					class="w3-bar-item w3-button w3-padding"><i
					class="fa fa-users fa-fw"></i>Request Activity</a> <a href="logout.jsp"
					class="w3-bar-item w3-button w3-padding"><i
					class="fa fa-users fa-fw"></i>Logout</a>

			</div>
		</nav>


		<!-- Overlay effect when opening sidebar on small screens -->
		<div class="w3-overlay w3-hide-large w3-animate-opacity"
			onclick="w3_close()" style="cursor: pointer" title="close side menu"
			id="myOverlay"></div>

		<!-- !PAGE CONTENT! -->
		<div class="w3-main" style="margin-left: 300px; margin-top: 60px;">
			<!-- ADD ACTIVITY BUTTONS -->
			<div class="text-center">
				<br> <br> <br> <a
					class="btn btn-primary btn-lg text-light"
					href="add_new_activity.jsp" role="button">ADD Activity</a>
			</div>
			<!-- ADD ACTIVITY BUTTONS ENDS-->

			<!-- Header -->



			<section id="authors" class="my-5 text-center">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="info-header mb-5">
								<h1 class="text-primary mt-5 pb-3">Home</h1>
								<p class="lead pb-3">hum apka swagt krte hai joinme.co.in pr
								</p>
							</div>
						</div>
					</div>
					<div class="row">













						<%
							ArrayList<CreatedActivityListDTO> alADTO = new ArrayList<>();
							CreatedActivityListDAO adao = new CreatedActivityListDAO();
							alADTO = adao.getAllCreatedActivityListOrderByCount();
							if (alADTO != null) {
								for (CreatedActivityListDTO adto : alADTO) {
						%>

						<div class="col-lg-3 col-md-6">
							<div class="card">
								<div class="card-body">
									<form action="activity_details.jsp" method="post">
										<img src="pics/0 (<%=adto.getActivity_id() % 150%>).jpg"
											alt="" class="img-fluid rounded-circle w-50 mb-3">
										<h3><%=adto.getActivity_name()%></h3>
										<h5>
											View :
											<%=adto.getCount()%></h5>
										<h5 class="text-muted"></h5>
										<p><%=adto.getActivity_description()%></p>
										<div class="d-flex flex-row justify-content-center">
											<div class="p-4">
												<input type="hidden" name="activity_id"
													value=<%=adto.getActivity_id()%>> <input
													class="btn btn-dark" type="submit" name="show_details"
													value="details">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<%
							}
							} else {
							}
						%>
















					</div>
				</div>
			</section>




			<!-- End page content -->
		</div>

		<script>
			// Get the Sidebar
			var mySidebar = document.getElementById("mySidebar");
			// Get the DIV with overlay effect
			var overlayBg = document.getElementById("myOverlay");
			// Toggle between showing and hiding the sidebar, and add overlay effect
			function w3_open() {
				if (mySidebar.style.display === 'block') {
					mySidebar.style.display = 'none';
					overlayBg.style.display = "none";
				} else {
					mySidebar.style.display = 'block';
					overlayBg.style.display = "block";
				}
			}
			// Close the sidebar with the close button
			function w3_close() {
				mySidebar.style.display = "none";
				overlayBg.style.display = "none";
			}
		</script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
			crossorigin="anonymous"></script>
	</header>
</body>
</html>