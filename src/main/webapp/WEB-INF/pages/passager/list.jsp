<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Passager</title>
</head>

<body>
	<div class="container">
		<table class="table">
			<tr>
				<th>idPassager</th>
				<th>prenom</th>
				<th>nom</th>
				<th>numero</th>
				<th>rue</th>
				<th>code postal</th>
				<th>ville</th>
				<th>pays</th>
			</tr>
			<c:forEach var="passager" items="${passagers}">
				<tr>
					<td>${passager.idPassager}</td>
					<td>${passager.prenom}</td>
					<td>${passager.nom}</td>
					<td>${passager.adresse.numero}</td>
					<td>${passager.adresse.rue}</td>
					<td>${passager.adresse.codePostal}</td>
					<td>${passager.adresse.ville}</td>
					<td>${passager.adresse.pays}</td>

					<td><a class="btn btn-danger"
						href="./delete?idPassager=${passager.idPassager}">Supprimer</a></td>
					<td><a class="btn btn-info"
						href="./edit?idPassager=${passager.idPassager}">Editer</a></td>

				</tr>
			</c:forEach>
		</table>

		<a class="btn btn-info" href="./add">Nouveau passager</a>
	</div>
</body>
</html>