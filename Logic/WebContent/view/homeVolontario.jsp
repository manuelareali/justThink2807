<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="beanweb.UserHomeBoundary"%>


<%
	if(request.getParameter("CERCA CARITAS") != null){
		if(UserHomeBoundary.getInstance().searchCaritasButtonPressed() == 0){
%>
	<jsp:forward page="mappa.jsp"/>
<%	
		}
	}
%>	

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>HOME VOLONTARIO</title>
<link rel="icon" sizes="64x64" href="../img/favicon.png">
<link rel="stylesheet" href="../css/homeVol.css">
</head>
<body>
	<div class="p-3 mb-2 bg-light text-dark">
		<form action="homeVolontario.jsp" name="my" method="POST">




			<div class="row">
				<div class="col-sm-6 col-md-8">
					<div class="position-absolute top-0 start-0">

						<img src="../img/caritas.png" width="450px" height="300px"
							alt="...">
					</div>
				</div>
				<div class="col-6 col-md-4">
					<h1 class="fw-bold">JUST THINK IT</h1>
					<h2>Search, Find, Help</h2>

				</div>
			</div>



			<div class="container text-center">
				<div class="btns">
					<button class="btn  btn-light" type="submit"  name= "CERCA CARITAS" value="CERCA CARITAS">MAPPA</button>
				</div>
			</div>











			<!-- Optional JavaScript; choose one of the two! -->

			<!-- Option 1: Bootstrap Bundle with Popper -->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
				crossorigin="anonymous"></script>

			<!-- Option 2: Separate Popper and Bootstrap JS -->
			<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
		</form>
		<div class="box">
			<div class="container text-center">


				<a class="button" href="#popup1"><button
						class="btn btn-outline-primary" type="submit" name="LOGOUT"
						value="LOGOUT">ESCI</button></a>
			</div>
		</div>
		<div id="popup1" class="overlay">
			<div class="popup">

				<div class="content">
					<h3 class="fw-bold">Sei sicuro di voler uscire?</h3>
					<p>Se uscirai dovrai effettuare un nuovo accesso.</p>
					<div class="content text-center">
						<a href="index.jsp"><button class="btn btn-outline-light"
								type="submit" name="" value="">OK</button></a> <a
							href="homeVolontario.jsp"><button class="btn btn-outline-light"
								type="submit" name="" value="">ANNULLA</button></a>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>