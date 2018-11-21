<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Liste des Réservations du client</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<table class="table" style="text-align: center">
		<tr>
			<th>Client</th>
			<th>Numéro Reservation</th>
			<th>Date Reservation</th>
			<th>Passager</th>
			<th>Vol</th>
		</tr>
		<c:forEach var="reservation" items="${reservations }">
			<tr>
				<td>${reservation.numeroReservation }</td>
				<td>${reservation.dateReservation }</td>
				<td>${reservation.client }</td>
				<td>${reservation.passager }</td>
				<td>${reservation.vol }</td>
			</tr>
		</c:forEach>
	</table>
	<a class="btn btn-dark" href="./">Retour</a>
</body>

</html>