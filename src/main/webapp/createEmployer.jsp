<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<jsp:include page="components/navbar.jsp"/>
<div class="testbox">
    <form class="form" id="myForm" method="POST" action="http://localhost:8080/easybankjee/employers">
        <input type="hidden" name="_METHOD" value="POST"/>
        <div class="banner">
            <h1>Ajouter un Employer</h1>
        </div>
        <div class="item">
            <p>Name</p>
            <div class="name-item">
                <input id="prenom" placeholder="Prenom" type="text" name="prenom">
                <input id="nom" placeholder="Nom" type="text" name="nom">
            </div>
        </div>
        <div class="item">
            <p>Email</p>
            <input id="adresseEmail" placeholder="E-mail" type="email" name="adresseEmail">
        </div>
        <div class="item">
            <p>Phone</p>
            <input id="numeroTel" placeholder="Numero Tel" type="text" name="numeroTel">
        </div>

        <div class="item">
            <p>Contact Address</p>
            <input id="Adresse" placeholder="Adresse" type="text" name="adresse">
        </div>
        <div class="item">
            <p>Date Naissance</p>
            <input id="dateNaissance" placeholder="01-01-1990" type="date" name="dateNaissance">
            <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="item">
            <p>Date Naissance</p>
            <input id="dateRecrutement" placeholder="01-01-2018" type="date" name="dateRecrutement">
            <i class="fas fa-calendar-alt"></i>
        </div>
        <div class="divToShowContainer">
            <button class="editButton" type="submit">SEND</button>
        </div>
    </form>
</div>
</body>
<script src="scripts/script.js"></script>
</html>
