<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.EventTab"%>
<%@ page import="beanweb.GestisciEventiBoundary"%>

<%
Class.forName("com.mysql.jdbc.Driver");
%>
<%
if (request.getParameter("cancella") != null) {
	if (GestisciEventiBoundary.getInstance().eliminaEvento(request.getParameter("evento")) == true) {
%>
<jsp:forward page="homeNegozio.jsp" />
<%
}
}
%>
<%
if (request.getParameter("INDIETRO") != null) {
%>
<jsp:forward page="homeNegozio.jsp" />
<%
}
%>

<%
if (request.getParameter("contatta") != null) {
%>
<jsp:forward page="contattaCaritasMap.jsp" />
<%
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

<title>GESTISCI EVENTI NEGOZIO</title>
<link rel="stylesheet" href="../css/gestisciEventiShop.css">
<link rel="icon" sizes="64x64" href="../img/favicon.png">
</head>
<body>
	<div class="p-3 mb-2 bg-light text-dark">
		<div class="container text-center">
			<h1>Gestione degli Eventi</h1>
		</div>
		<form action="gestisciEventiNegozio.jsp" name="my" method="POST">

			<div class="row">
				<div class="col">
					</br>
					<button class="btn  btn-light" type="submit" name="contatta"
						value="contatta">Contatta Caritas</button>
				</div>
			</div>


			<div class="row">
				<div class="col">
					</br>
					<button class="btn btn-light" type="submit" name="cancella"
						value="cancella">Elimina Evento</button>
					<input type="text" id="evento" name="evento"
						placeholder="Inserisci l'ID del turno da eliminare">
				</div>

			</div>

			<div class="indietro">
				<button class="btn btn-warning" type="submit" name="INDIETRO"
					value="INDIETRO ">Indietro</button>
			</div>

			<div class="content text-center">
			<table class="table table-hover">
			<caption  style="visibility: hidden;">Eventi</caption>
				<thead>
					<tr>
						<th scope="col">ID EVENTO</th>
						<th scope="col">EVENTO</th>
						<th scope="col">NEGOZIO</th>
						<th scope="col">NOTE EVENTO</th>
						<th scope="col">PARTECIPANTI</th>
						<th scope="col">IMPORTO RAGGIUNTO</th>
					</tr>
				</thead>
				<tbody>


					<%
					List<EventTab> list = GestisciEventiBoundary.getInstance().loadShopBoundary();
					int i = 0;
					while (i < list.size()) {
					%>
					<tr>
						<td>
							<%
							out.println(list.get(i).getId());
							%>
						</td>
						<td>
							<%
							out.println(list.get(i).getNomeEvento());
							%>
						</td>
						<td>
							<%
							out.println(list.get(i).getNomeCaritas());
							%>
						</td>
						<td>
							<%
							out.println(list.get(i).getNoteEvento());
							%>
						</td>
						<td>
							<%
							out.println(list.get(i).getNumPartecipanti());
							%>
						</td>
						<td>
							<%
							out.println(list.get(i).getImportoRaggiunto());
							%>
						</td>
					</tr>

					<%
					i++;
					}
					%>
					
				</tbody>
			</table>
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