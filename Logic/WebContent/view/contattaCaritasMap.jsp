<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="beanweb.EmailBoundary"%>

<%
Class.forName("com.mysql.jdbc.Driver");
	if(request.getParameter("INVIA")!=null){
		if(EmailBoundary.getInstance().sendMessage(request.getParameter("codice_mittente"),request.getParameter("codice_destinatario"), request.getParameter("messaggio"), request.getParameter("oggetto")) == 0){
			
%>
<jsp:forward page="homeCaritas.jsp" />
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

<title>CONTATTA</title>
<link rel="stylesheet" href="../css/contatti.css">
<link rel="icon" sizes="64x64" href="../img/favicon.png">
</head>
<body>
	<div class="p-3 mb-2 bg-light text-dark">
		<form action="contattaCaritasMap.jsp" name="my" method="POST">

			<div class="container text-center">
				<h1>Contattaci ti risponderemo appena possibile!</h1>
			</div>

			<div class="container text-center my-5">
				<div class="row">
					<div class="col">
						<input type="text" id="codice_mittente" name="codice_mittente"
							placeholder="Mittente" />
					</div>
					<div class="col">
						<input type="text" id="codice_destinatario"
							name="codice_destinatario" placeholder="Destinatario" />
					</div>
					<div class="col">
						<input type="text" id="oggetto" name="oggetto"
							placeholder="Oggetto" />
					</div>

				</div>

				<div class="container text-center my-5">
					<textarea id="messaggio" name="messaggio"
						placeholder="Scrivi qui il tuo messaggio."></textarea>
				</div>


			</div>
			<div class="indietro">
				<a href = "homeCaritas.jsp"><button class="btn btn-warning" type="submit" name="INDIETRO"
					value="INDIETRO">Indietro</button></a>
			</div>

			<div class="invia">
				<button type="submit" class="btn btn-light" name="INVIA"
					value="INVIA">INVIA</button>
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
	</div>
</body>
</html>