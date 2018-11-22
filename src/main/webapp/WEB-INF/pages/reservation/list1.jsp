<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Liste Reservation</title>
</head>
<body>

<div class="container">

<table class="table">
		<tr>
			<th>Numero Reservation</th>
			<th>Date Reservation</th>
			<th>Id Client</th>
			<th>Id Passager</th>
			<th>Id Vol</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach var ="reservation" items="${reservations}">
			<tr>
				<td>${reservation.numeroReservation}</td>
				<td>${reservation.dateReservation}</td>
				<td>${reservation.client.idClient}</td>
				<td>${reservation.passager.idPassager}</td>
				<td>${reservation.vol.idVol}</td>
				<td><a class="btn btn-primary" href="./edit?id=${reservation.numeroReservation}">Modifier</a></td>
				<td><a class="btn btn-danger" href="./delete?id=${reservation.numeroReservation}">Supprimer</a></td>
			</tr>
		 </c:forEach>

	</table>
	<a class="btn btn-success" href="./addReservation"> Nouvelle Reservation</a>


</div>

</body>
</html>