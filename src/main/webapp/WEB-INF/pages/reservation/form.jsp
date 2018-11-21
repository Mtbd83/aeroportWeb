<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>Edition Reservation</title>
</head>
<body>

<div class="container">

	<fieldset>
		<legend>Edition Reservation</legend>
	</fieldset>
	
	<form:form action="saveReservation" method="post" modelAttribute="reservation">
		<form:hidden path="version"/>
		
		<div class="form-group">
			<form:label path="numeroReservation"> Numero Reservation</form:label>
			<form:input  path="numeroReservation" cssClass="form-control" readonly="true"/>
		</div>
		
		<div class="form-group">
			<form:label path="dateReservation"> Date Reservation</form:label>
			<form:input  path="dateReservation" cssClass="form-control" readonly="true"/>
		</div>
		
		
		<div class="form-group">
			<form:label path="client.idClient">Id Client</form:label>
			<form:input path="client.idClient" cssClass="form-control" readonly="true" />
			<form:errors path="client.idClient"></form:errors>
		</div>
		
		
			<div class="form-group">
				<form:label path="client.nom">Nom Client</form:label>
				<form:input path="client.nom" cssClass="form-control" readonly="true" />
				<form:errors path="client.nom"></form:errors>
			</div>

		
		<div class="form-group">
			<form:label path="passager.idPassager">Id Passager</form:label>
			<form:input path="passager.idPassager" cssClass="form-control" readonly="true" />
			<form:errors path="passager.idPassager"></form:errors>
		</div>
		
<!-- 		<div class="form-group">	 -->
<%-- 			<form:label path="passager">Passager</form:label> --%>
<%-- 			<form:select path="passager.nom" cssClass="form-control" > --%>
<%-- 				<form:option value="">Aucun passager</form:option> --%>
<%-- 				<form:options items="${passagers}" itemLabel="nom" itemValue="id"/> --%>
<%-- 			</form:select> --%>
<%-- 			<form:errors path="vol"></form:errors> --%>
<!-- 		</div> -->
		
<!-- 		<div class="form-group"> -->
<%-- 			<form:label path="vol">Vol</form:label> --%>
<%-- 			<form:select path="vol.idVol" cssClass="form-control" > --%>
<%-- 				<form:option value="">Pas de vol</form:option> --%>
<%-- 				<form:options items="${vols}" itemLabel="idVol" itemValue="idVol"/> --%>
<%-- 			</form:select> --%>
<%-- 			<form:errors path="vol"></form:errors> --%>
<!-- 		</div> -->
		
		
		<div>
			<button class="btn btn-success" type="submit">Enregistrer</button>
			<a href="./" class="btn btn-warning" type="submit">Annuler</a>
		</div>
	
	</form:form>
	
	

</div>

</body>
</html>