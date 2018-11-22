<!DOCTYPE html>
<%
	
	if (session.getAttribute("user_id") == null) {
		session.setAttribute("user_id", 70);
	}
%>
<%@page
	import="com.sjl.joinme.created_activity_list.CreatedActivityListDAO"%>
<%@page import="com.sjl.joinme.tags.TagsDAO"%>
<html lang="en">




<%
	if ("done".equals(request.getParameter("add_activity")) && request.getMethod().equalsIgnoreCase("post")) {
%>

<jsp:useBean id="adto"
	class="com.sjl.joinme.created_activity_list.CreatedActivityListDTO"></jsp:useBean>
<jsp:setProperty property="*" name="adto" />


<jsp:useBean id="tdto" class="com.sjl.joinme.tags.TagsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="tdto" />
<%
	new TagsDAO().addTags(tdto);
		adto.setTag_id(new TagsDAO().tagNameToTagID(request.getParameter("tag")));
		System.out.println(new TagsDAO().tagNameToTagID(request.getParameter("tag")));
		new CreatedActivityListDAO().addCreatedActivityList(adto);

	}
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
body {
	background: #ffffff00;
	color: #ffffff00;
}

#home-section {
	background: url("img/home.jpg") no-repeat;
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
	opacity: 0.8;
}

#home-section .fa {
	color: #008ed6;
	background: #ffffff00;
	padding: 4px;
	border-radius: 5px;
	font-size: 30px;
}

.navbar {
	border-bottom: #008ed6 3px solid;
	opacity: 0.8;
}
</style>

<!--css for get marker and lat,lug //////////////////////////////////////////////////////////////////// -->


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


<!-- //////////////////////////////////////////////////////////////////// -->



</head>

<!--java  scripts for get marker and lat,lug //////////////////////////////////////////////////////////////////// -->


<script type="text/javascript">
	// In the following example, markers appear when the user clicks on the map.
	// The markers are stored in an array.
	// The user can then click an option to hide, show or delete the markers.
	var map;
	var markers = [];

	function initMap() {
		var haightAshbury = {
			lat : 23.2748308,
			lng : 77.4519248
		};

		map = new google.maps.Map(document.getElementById('map'), {
			zoom : 4, // Set the zoom level manually
			center : haightAshbury,
			mapTypeId : 'terrain'
		});

		// This event listener will call addMarker() when the map is clicked.
		map.addListener('click', function(event) {
			if (markers.length >= 1) {
				deleteMarkers();
			}

			addMarker(event.latLng);
			document.getElementById('lat').value = event.latLng.lat();
			document.getElementById('long').value = event.latLng.lng();
		});
	}

	// Adds a marker to the map and push to the array.
	function addMarker(location) {
		var marker = new google.maps.Marker({
			position : location,
			map : map
		});
		markers.push(marker);
		//alert(location);
	}

	// Sets the map on all markers in the array.
	function setMapOnAll(map) {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
		}
	}

	// Removes the markers from the map, but keeps them in the array.
	function clearMarkers() {
		setMapOnAll(null);
	}

	// Deletes all markers in the array by removing references to them.
	function deleteMarkers() {
		clearMarkers();
		markers = [];
	}
</script>
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDJ7DiAylyJpPJlS8mPu5wJGbwWz7f9To4
&callback=initMap">
	
</script>
<!-- //////////////////////////////////////////////////////////////////// -->
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

	<!-- HOME SECTIONNN -->
	<header id="home-section">
		<div class="dark-overlay">
			<div class="home-inner">
				<h5 class="display-4 text-center mb-4">
					<strong> Add a new Activity!</strong>
				</h5>
				<p class="display-5 text-center mb-4 lead">Just fill the form to
					add a new Activity.</p>
				<div class="container">
					<div class="row">


						<div class="col-lg-6">
							<br> <br>
							<div class="card bg-primary text-center card-form">
								<div class="card-body">
									<h3>Activity Details</h3>
									<p>please fill out this form to add activity</p>
									<form action="add_new_activity.jsp" method="post">

										<div class="form-group">
											<input type="text" class="form-control form-control-lg"
												name="tag" placeholder="Tag Name">
										</div>

										<div class="form-group">
											<input type="text" class="form-control form-control-lg"
												name="tag_description" maxlength="70"
												placeholder="Tag description">
										</div>

										<div class="form-group">
											<input type="file" class="form-control form-control-lg"
												name="tag_image" placeholder="tag_image">
										</div>

										<div class="form-group">
											<input type="text" class="form-control form-control-lg"
												name="activity_name" placeholder="activity name">
										</div>

										<div class="form-group">
											<textarea type="text" class="form-control form-control-lg"
												name="activity_description"
												placeholder="activity Description"></textarea>
										</div>

										<div class="form-group">
											<input type="file" class="form-control form-control-lg"
												name="activities_images" placeholder="activities_images">
										</div>


										<div class="form-group">
											<input type="datetime-local" class="form-control form-control-lg"
												name="activity_date" placeholder="dateandtime">
										</div>



										<input type="text" name="lat"
											class="form-control form-control-lg" id="lat"
											placeholder="lat"> <input type="text" name="lng"
											class="form-control form-control-lg" id="long"
											placeholder="lng"> <input type="hidden"
											name="user_id" value=<%=(int)session.getAttribute("user_id")%>>

										<div class="form-group">
											<input type="text" class="form-control form-control-lg"
												name="cost" placeholder="cost">
										</div>

										<input type="submit" name="add_activity" value="done"
											class="btn btn-outline-light btn-block">
									</form>
									<br>
								</div>

							</div>
						</div>


						<div class="col-lg-6">
							<br> <br>
							<div id="map"></div>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br>
						</div>
					</div>
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br> <br> <br>


				</div>
			</div>
		</div>
		</div>
	</header>

</body>
</html>