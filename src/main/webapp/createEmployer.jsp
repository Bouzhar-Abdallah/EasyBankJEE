<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<jsp:include page="components/navbar.jsp"/>
<h1>create form</h1>
<form id="myForm" method="POST" action="http://localhost:8080/easybankjee/employers">
    <input type="hidden" name="_METHOD" value="POST"/>
    <label for="nom">First name:</label>
    <input id="nom" placeholder="Nom"  type="text" name="nom">

    <label for="prenom">First name:</label>
    <input id="prenom" placeholder="Prenom" type="text" name="prenom">
    <label for="dateNaissance">First name:</label>
    <input id="dateNaissance" placeholder="01-01-1990" type="date" name="dateNaissance">
    <label for="numeroTel">First name:</label>
    <input id="numeroTel" placeholder="Numero Tel" type="text" name="numeroTel">
    <label for="Adresse">First name:</label>
    <input id="Adresse" placeholder="Adresse" type="text" name="adresse">
    <label for="adresseEmail">First name:</label>
    <input id="adresseEmail" placeholder="E-mail" type="email" name="adresseEmail">
    <label for="dateRecrutement">First name:</label>
    <input id="dateRecrutement" placeholder="01-01-2018" type="date" name="dateRecrutement">
    <button type="submit">POST</button>
</form>

</body>
<script src="scripts/script.js"></script>
</html>
