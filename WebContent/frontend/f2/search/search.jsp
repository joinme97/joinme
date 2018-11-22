
<!DOCTYPE html>
<%@page
	import="com.sjl.joinme.created_activity_list.CreatedActivityListDTO"%>
<%@page
	import="com.sjl.joinme.created_activity_list.CreatedActivityListDAO"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" rel="stylesheet" href="style.css">
<title>Search</title>
</head>
<body>
	<!--Make sure the form has the autocomplete function switched off:-->
	<form autocomplete="off" action="search.jsp" method="post">
		<div class="autocomplete" style="width: 300px;">
			<input id="myInput" type="text" name="tag"
				placeholder="Select Activities">
		</div>
		<input type="submit">
	</form>


	<%
		if (request.getMethod().equalsIgnoreCase("post")) {
	%>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="info-header mb-5">
					<h1 class="text-primary mt-5 pb-3">Trending List</h1>
					<p class="lead pb-3">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Amet omnis fuga maiores excepturi dolores
						explicabo.</p>
				</div>
			</div>
		</div>
		<div class="row">


			<%
				String tag = request.getParameter("tag");
					ArrayList<CreatedActivityListDTO> al = new ArrayList<>();
					al = new CreatedActivityListDAO().getAllCreatedActivityListWithTagName(tag);
					if (al != null)
						for (CreatedActivityListDTO tdto : al) {
			%>

			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body">
						<form action="show_activity.jsp" method="post">
							<img src="pics/0 (<%=tdto.getTag_id() % 150%>).jpg" alt=""
								class="img-fluid rounded-circle w-50 mb-3">
							<h3><%=tdto.getActivity_name()%></h3>
							<h5 class="text-muted"></h5>
							<p><%=tdto.getActivity_description()%></p>
							<div class="d-flex flex-row justify-content-center">
								<div class="p-4">
									<input type="hidden" name="tag_id"
										value=<%=tdto.getActivity_id()%>> <input
										class="btn btn-dark" type="button" name="show_activities"
										value="view">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
	</div>
	<%
		}
	%>


	<jsp:include page="main.jsp"></jsp:include>
</body>
</html>