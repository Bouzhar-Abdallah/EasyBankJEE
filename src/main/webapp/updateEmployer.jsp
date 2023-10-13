<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<jsp:include page="components/navbar.jsp"/>
<h1>update form</h1>
<form id="myForm" method="POST" action="http://localhost:8080/easybankjee/employers">

    <input type="hidden" name="_METHOD" value="submitedUpdate"/>


    <input value="${person.matricule}" type="hidden" name="matricule">
    <label for="prenom">First name:</label>
    <input value="${person.prenom}" id="prenom" placeholder="Prenom" type="text" name="prenom">
    <label for="nom">Last name:</label>
    <input value="${person.nom}" id="nom" placeholder="Nom"  type="text" name="nom">
    <label for="dateNaissance">birthdate:</label>
    <input value="${person.dateNaissance}" id="dateNaissance" placeholder="01-01-1990" type="date" name="dateNaissance">
    <label for="numeroTel">Phone number:</label>
    <input value="${person.numeroTel}" id="numeroTel" placeholder="Numero Tel" type="text" name="numeroTel">
    <label for="Adresse">Adress:</label>
    <input value="${person.adresse}" id="Adresse" placeholder="Adresse" type="text" name="adresse">
    <label for="adresseEmail">Email</label>
    <input value="${person.adresseEmail}" id="adresseEmail" placeholder="E-mail" type="email" name="adresseEmail">
    <label for="dateRecrutement">Recrutement date</label>
    <input value="${person.dateRecrutement}" id="dateRecrutement" placeholder="01-01-2018" type="date" name="dateRecrutement">
    <button type="submit">PUT</button>
</form>
</body>
<script src="scripts/script.js"></script>
</html>
