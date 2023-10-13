<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<jsp:include page="components/navbar.jsp"/>
<jsp:include page="components/searchForm.jsp"/>

<div class="testbox">
    <div class="form" id="myForm">

        <div class="banner">
            <h1>Employer trouvé</h1>
        </div>
        <div class="item">
            <div class="flex">
                <p class="labelFlex">matricule :</p>
            <p>${person.matricule}</p>
            </div>
        </div>
        <div class="item">
            <div class="flex">
                <p class="labelFlex">Prenom :</p>
            <p>${person.prenom}</p>
            </div>
        </div>
        <div class="item">
            <div class="flex">
                <p class="labelFlex">Nom :</p>
            <p>${person.nom}</p>
            </div>
        </div>
        <div class="item">
            <div class="flex">
                <p class="labelFlex">Numero Tel :</p>
            <p>${person.numeroTel}</p>
            </div>
        </div>
        <div class="item">
            <div class="flex">
                <p class="labelFlex">Adresse :</p>
            <p>${person.adresse}</p>
            </div>
        </div>
        <div class="item">
            <div class="flex">
                <p class="labelFlex">E-mail :</p>
            <p>${person.adresseEmail}</p>
            </div>
        </div>
        <div class="item">
            <div class="flex">
                <p class="labelFlex">Date Naissance :</p>
            <p>${person.dateNaissance}</p>
            </div>
        </div>
        <div class="item">
            <div class="flex">
                <p class="labelFlex">Date Recrutement :</p>
            <p>${person.dateRecrutement}</p>
            </div>
        </div>
    </div>
</div>

</body>
<script src="scripts/script.js"></script>
</html>
