<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des Vols</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<table class="table">
			<tr align="center">
				<th>Id</th>
				<th>Date de Depart</th>
				<th>Date d'Arriver</th>
				<th>Heure de Depart</th>
				<th>Heure d'Arriver</th>
				<th></th>
				<th></th>
				<th></th>

			</tr>
			<c:forEach var="vol" items="${vols}">
				<tr align="center">
					<td>${vol.idVol}</td>
					<td><fmt:formatDate value="${vol.dateDepart}" type="date"
							pattern="dd/MM/YYYY" /></td>
					<td><fmt:formatDate value="${vol.dateArrivee}" type="date"
							pattern="dd/MM/YYYY" /></td>
					<td><fmt:formatDate value="${vol.heureDepart}" type="time" /></td>
					<td><fmt:formatDate value="${vol.heureArrivee}" type="time" /></td>
					<td><a class="btn btn-danger"
						href="./delete?idVol=${vol.idVol}">Supprimer</a></td>
					<td><a class="btn btn-primary" href="./edit?idVol=${vol.idVol}">Editer</a></td>
					<td><a class="btn btn-success"
						href="./passagersVol?idVol=${vol.idVol}">Voir Passagers</a></td>
				</tr>
			</c:forEach>

		</table>

		<a class="btn btn-info" href="./addVol">Nouveau Vol</a>

	</div>

</body>
</html>