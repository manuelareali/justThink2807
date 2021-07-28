<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="entity.CoordinateMap"%>
<%
Class.forName("com.mysql.jdbc.Driver");
%>
<!-- dichiarazione e instanziazione di un loginBean !-->
<jsp:useBean id="CercaCaritas" scope="application"
	class="beanweb.CercaCaritas" />

<!-- mappare gli attributi di un oggetto sui campi della form -->
<jsp:setProperty name="CercaCaritas" property="*" />


<%
List<CoordinateMap> caritas = CercaCaritas.initMarkersCaritas();
List<CoordinateMap> evento = CercaCaritas.initMarkersEvento();
List<CoordinateMap> donazione = CercaCaritas.initMarkersDonazione();
%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>MAPPA</title>
    <style>
#map {
	position: absolute;
	top: 110px;
	right: 0;
	bottom: 0;
	left: 320px;
	width: 1030px;
	height: 530px
}
</style>
</head>
<script type="text/javascript">
	var idMarker = 0;
	var hidden = false;
	var tipoUtente = "";
</script>
    

  <body>
  <div class="p-3 mb-2 bg-light text-dark">
  <div class = "container text-center">
    <h1>Just Think It</h1>
    </div>
    <form action="mappa.jsp" name="reg" method="POST">
    <div class="cordinate">
			<input type="button" value="INDICATORE"
				onClick="updateLatLng(document.getElementById('latitude').value,document.getElementById('longitude').value,1)">
			<label for="latitude">Latitude:</label> <input id="latitude"
				type="text" /> <label for="longitude">Longitude:</label> <input
				id="longitude" type="text" />
		</div>
		
		<%
		if (CercaCaritas.getInstance().trovaRuoloBean().equalsIgnoreCase("Volontario")) {
		%>
		<button class="btn  btn-light" id="donazione" name="donazione"
			style="visibility: hidden; position: absolute; top: 35%; left: 1%; border: 1px solid red; background: red; color: white; height: 40px; width: 150px; font-weight: bold; font-size: 14px;">CREA
			DONAZIONE</button>
		<button class="btn  btn-light" id="necessita" name="necessita"
			style="visibility: hidden; position: absolute; top: 42%; left: 1%; border: 1px solid red; background: red; color: white; height: 40px; width: 150px; font-weight: bold; font-size: 14px;">VEDI
			BACHECA</button>
		<button class="btn  btn-light" id="turno" name="turno"
			style="visibility: hidden; position: absolute; top: 49%; left: 1%; border: 1px solid red; background: red; color: white; height: 40px; width: 150px; font-weight: bold; font-size: 14px;">PRENOTA
			TURNO</button>
		<button class="btn  btn-light" id="partecipaEvento" name="partecipaEvento"
			style="visibility: hidden; position: absolute; top: 35%; left: 1%; border: 1px solid red; background: red; color: white; height: 40px; width: 150px; font-weight: bold; font-size: 14px;">PARTECIPA
			EVENTO</button>

		<div class="ind">
			<a href= "homeVolontario.jsp"><button class="btn btn-warning" type="submit" name="INDIETRO"
					value="INDIETRO">Indietro</button></a>
		</div>
		<script>
			tipoUtente = "Volontario";
		</script>

		<%
		}

		if (CercaCaritas.getInstance().trovaRuoloBean().equalsIgnoreCase("Negozio")) {
		%>
		<button class="btn  btn-light" id="donazione" name="donazione"
			style="visibility: hidden; position: absolute; top: 35%; left: 1%; border: 1px solid red; background: red; color: white; height: 40px; width: 150px; font-weight: bold; font-size: 14px;">CREA
			DONAZIONE</button>
		<button  class="btn  btn-light" id="necessita" name="necessita"
			style="visibility: hidden; position: absolute; top: 42%; left: 1%; border: 1px solid red; background: red; color: white; height: 40px; width: 150px; font-weight: bold; font-size: 14px;">VEDI
			BACHECA</button>
		<button class="btn  btn-light" id="promuoviEvento" name="promuoviEvento"
			style="visibility: hidden; position: absolute; top: 49%; left: 1%; border: 1px solid red; background: red; color: white; height: 40px; width: 150px; font-weight: bold; font-size: 14px;">PROMUOVI
			EVENTO</button>

		<div class="ind">
			<a href= "homeNegozio.jsp"><button class="btn btn-warning" type="submit" name="INDIETRO"
					value="INDIETRO">Indietro</button></a>
		</div>
		<script>
			tipoUtente = "Negozio";
		</script>
		<%
		}
		%>
		<div class="hidden">
			<input type="text" id="donazioneInput" name="donazioneInput">
			<input type="text" id="turnoInput" name="turnoInput"> <input
				type="text" id="eventoInput" name="eventoInput"> <input
				type="text" id="necessitaInput" name="necessitaInput"> <input
				type="text" id="promuoviInput" name="promuoviInput"> <input
				type="text" id="partecipaInput" name="partecipaInput">
		</div>
		</form>
		
		<div id="map"></div>
		
		
		<div class="check">
		<div>
			<input type="radio" class="gaucher" id="1" name="1"
				onClick=" checkRadio(name)" onblur="processCheck(this)" value="1">
			<label for="1">Caritas</label>
		</div>
		<div>
			<input type="radio" class="gaucher" id="2" name="2"
				onClick=" checkRadio(name)" onblur="processCheck(this)" value="2">
			<label for="2">Eventi</label>
		</div>

		<div>
			<input type="radio" class="gaucher" id="3" name="3"
				onClick=" checkRadio(name)" onblur="processCheck(this)" value="3">
			<label for="3">Donazioni</label>
		</div>
		<div>
			<input type="radio" class="gaucher" id="4" name="4"
				onClick=" checkRadio(name)" onchange="processCheck(this)" value="4">
			<label for="4">MioMarker</label>
		</div>
	</div>

	<%
	if (request.getParameter("promuoviEvento") != null) {
		String parametroPromuovi = request.getParameter("promuoviInput");
		System.out.println(parametroPromuovi);
		out.print("<b>" + parametroPromuovi + "</b>");
		CercaCaritas.getInstance().promuoviEvento(Integer.parseInt(parametroPromuovi));
	%>
	<jsp:forward page="promuoviEventoMap.jsp" />
	<%
	}
	if (request.getParameter("donazione") != null) {
	String parametro = request.getParameter("donazioneInput");
	out.print("<b>" + parametro + "</b>");
	CercaCaritas.getInstance().creaDonazione(Integer.parseInt(parametro));
	%>
	<jsp:forward page="creaDonazioneMap.jsp" />
	<%
	}
	if (request.getParameter("evento") != null) {
	String parametroEvento = request.getParameter("eventoInput");
	System.out.println(parametroEvento);
	out.print("<b>" + parametroEvento + "</b>");
	CercaCaritas.getInstance().partecipaEvento(Integer.parseInt(parametroEvento));
	%>
	<jsp:forward page="partecipaEventoVolontario.jsp" />
	<%
	}

	if (request.getParameter("turno") != null) {
	String parametroTurno = request.getParameter("turnoInput");
	out.print("<b>" + parametroTurno + "</b>");
	CercaCaritas.getInstance().prenotaTurno(Integer.parseInt(parametroTurno));
	%>
	<jsp:forward page="prenotaTurnoMap.jsp" />
	<%
	}
	if (request.getParameter("necessita") != null) {
	String parametroNecessita = request.getParameter("necessitaInput");
	out.print("<b>" + parametroNecessita + "</b>");
	CercaCaritas.getInstance().vediNecessita(Integer.parseInt(parametroNecessita));
	%>
	<jsp:forward page="bachecaCaritasMap.jsp" />
	<%
	}

	if (request.getParameter("partecipaEvento") != null) {
	String parametroPartecipa = request.getParameter("partecipaInput");
	out.print("<b>" + parametroPartecipa + "</b>");
	CercaCaritas.getInstance().partecipaEvento(Integer.parseInt(parametroPartecipa));
	%>
	<jsp:forward page="partecipaEventoVolontario.jsp" />
	<%
	}

	String jsMarker = "";
	for (int i = 0; i < caritas.size(); i++) {
	String myY = caritas.get(i).getLongitudine();
	String myX = caritas.get(i).getLatitudine();

	int id = caritas.get(i).getIdMarker();
	jsMarker += "{\"geometry\": {\"type\": \"Point\",\"coordinates\": [" + myX + "," + myY
			+ "]},\"type\": \"Feature\",\"properties\": {\"popupContent\": \"Caritas\"},\"id\": " + id + " }";
	if (i != caritas.size() - 1) {
		jsMarker += ",";
	}
	}
	String jsMarkerEvento = "";
	for (int i = 0; i < evento.size(); i++) {
	String myY = evento.get(i).getLongitudine();
	String myX = evento.get(i).getLatitudine();
	int id = evento.get(i).getIdMarker();
	jsMarkerEvento += "{\"geometry\": {\"type\": \"Point\",\"coordinates\": [" + myX + "," + myY
			+ "]},\"type\": \"Feature\",\"properties\": {\"popupContent\": \"Evento\"},\"id\": " + id + " }";
	if (i != evento.size() - 1) {
		jsMarkerEvento += ",";
	}
	}

	String jsMarkerDonazioni = "";
	for (int i = 0; i < evento.size(); i++) {
	String myY = donazione.get(i).getLongitudine();
	String myX = donazione.get(i).getLatitudine();
	int id = donazione.get(i).getIdMarker();
	jsMarkerDonazioni += "{\"geometry\": {\"type\": \"Point\",\"coordinates\": [" + myX + "," + myY
			+ "]},\"type\": \"Feature\",\"properties\": {\"popupContent\": \"Donazione\"},\"id\": " + id + " }";
	if (i != donazione.size() - 1) {
		jsMarkerDonazioni += ",";
	}
	}

	int idUte = CercaCaritas.getIdUte();
	%>
	<script>
		var caritasMarker = {
			"type" : "FeatureCollection",
			"features" : [
	<%=jsMarker%>
		]
		};

		var eventoMarker = {
			"type" : "FeatureCollection",
			"features" : [
	<%=jsMarkerEvento%>
		]
		};

		var donazioniMarker = {
			"type" : "FeatureCollection",
			"features" : [
	<%=jsMarkerDonazioni%>
		]
		};

		var map = L.map('map').setView([ 41.87, 12.47 ], 8);

		var baselayer1 = L
				.tileLayer(
						'http://{s}.tile.osm.org/{z}/{x}/{y}.png',
						{
							attribution : '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
						}).addTo(map);

		var layerDonazioni = L.geoJSON(donazioniMarker);
		var layerEvento = L.geoJSON(eventoMarker);
		var layerCaritas = L.geoJSON(caritasMarker);

		var marker = L.marker([ 41.87, 12.47 ], {
			draggable : true
		}).addTo(map);
		marker.on('dragend', function(e) {
			updateLatLng(marker.getLatLng().lat, marker.getLatLng().lng);
		});
		map.on('click', function(e) {
			marker.setLatLng(e.latlng);
			updateLatLng(marker.getLatLng().lat, marker.getLatLng().lng);
		});

		function updateLatLng(lat, lng, reverse) {
			if (reverse) {
				marker.setLatLng([ lat, lng ]);
				map.panTo([ lat, lng ]);
			} else {
				document.getElementById('latitude').value = marker.getLatLng().lat;
				document.getElementById('longitude').value = marker.getLatLng().lng;
				map.panTo([ lat, lng ]);
			}
		}

		var layers = [ layerCaritas, layerEvento, layerDonazioni ];

		selId = null;

		var tipo;
		var id;

		function onClick(e) {
			tipo = e.layer.feature.properties.popupContent;

			if (tipo == "Caritas") {
				idMarker = e.layer.feature.id;
				document.getElementById("donazioneInput").value = idMarker;
				document.getElementById("turnoInput").value = idMarker;
				document.getElementById("necessitaInput").value = idMarker;
				document.getElementById("promuoviInput").value = idMarker;
			} else if (tipo == "Evento") {
				document.getElementById("partecipaInput").value = idMarker;
			}
			alert(e.layer.feature.properties.popupContent);
		}
		

		function processCheck(checkbox) {
			var checkId = checkbox.id;

			if (checkbox.checked) {
				if (selId != null) {
					map.removeLayer(layers[selId - 1]);
					document.getElementById(selId).checked = false;
				}

				layers[checkId - 1].addTo(map).on('click', onClick);
				selId = checkId;
			} else {
				map.removeLayer(layers[checkId - 1]);
				selId = null;
			}
		}

		
		function checkRadio(name) {
			hidden = !hidden;
			if (tipoUtente == "Volontario") {
				if (hidden) {
					if (name == "1") {

						document.getElementById('donazione').style.visibility = 'visible';
						document.getElementById('necessita').style.visibility = 'visible';
						document.getElementById('turno').style.visibility = 'visible';
						document.getElementById('partecipaEvento').style.visibility = 'hidden';
						document.getElementById("1").checked = true;
						document.getElementById("2").checked = false;
						document.getElementById("3").checked = false;
						document.getElementById("4").checked = false;
					}

					else if (name == "2") {
						document.getElementById('donazione').style.visibility = 'hidden';
						document.getElementById('necessita').style.visibility = 'hidden';
						document.getElementById('turno').style.visibility = 'hidden';
						document.getElementById('partecipaEvento').style.visibility = 'visible';
						document.getElementById("1").checked = false;
						document.getElementById("2").checked = true;
						document.getElementById("3").checked = false;
						document.getElementById("4").checked = false;
					} else if (name == "3") {
						document.getElementById('donazione').style.visibility = 'hidden';
						document.getElementById('necessita').style.visibility = 'hidden';
						document.getElementById('turno').style.visibility = 'hidden';
						document.getElementById('partecipaEvento').style.visibility = 'hidden';
						document.getElementById("1").checked = false;
						document.getElementById("2").checked = false;
						document.getElementById("3").checked = true;
						document.getElementById("4").checked = false;
					} else if (name == "4") {
						document.getElementById('donazione').style.visibility = 'hidden';
						document.getElementById('necessita').style.visibility = 'hidden';
						document.getElementById('turno').style.visibility = 'hidden';
						document.getElementById('partecipaEvento').style.visibility = 'hidden';
						document.getElementById("1").checked = false;
						document.getElementById("2").checked = false;
						document.getElementById("3").checked = false;
						document.getElementById("4").checked = true;
					}
				}
			}
			else if (tipoUtente == "Negozio") {
				if (hidden) {
					if (name == "1") {
						document.getElementById('donazione').style.visibility = 'visible';
						document.getElementById('necessita').style.visibility = 'visible';
						document.getElementById('promuoviEvento').style.visibility = 'visible';
						document.getElementById("1").checked = true;
						document.getElementById("2").checked = false;
						document.getElementById("3").checked = false;
						document.getElementById("4").checked = false;
					} else if (name == "2") {
						document.getElementById('donazione').style.visibility = 'hidden';
						document.getElementById('necessita').style.visibility = 'hidden';
						document.getElementById('promuoviEvento').style.visibility = 'hidden';
						document.getElementById("1").checked = false;
						document.getElementById("2").checked = true;
						document.getElementById("3").checked = false;
						document.getElementById("4").checked = false;
					} else if (name == 3) {
						document.getElementById('donazione').style.visibility = 'hidden';
						document.getElementById('necessita').style.visibility = 'hidden';
						document.getElementById('promuoviEvento').style.visibility = 'hidden';
						document.getElementById("1").checked = false;
						document.getElementById("2").checked = false;
						document.getElementById("3").checked = true;
						document.getElementById("4").checked = false;

					} else if (name == 4) {
						document.getElementById('donazione').style.visibility = 'hidden';
						document.getElementById('necessita').style.visibility = 'hidden';
						document.getElementById('promuoviEvento').style.visibility = 'hidden';
						document.getElementById("1").checked = false;
						document.getElementById("2").checked = false;
						document.getElementById("3").checked = false;
						document.getElementById("4").checked = true;
					}
				}
			}

		}



	</script>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
    </div>
  </body>
</html>