<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<jsp:include page="components/navbar.jsp"/>
<jsp:include page="components/searchForm.jsp"/>
<h1>${person.matricule}</h1><br>
<h1>${person.prenom}</h1><br>
<h1>${person.nom}</h1><br>
<h1>${person.numeroTel}</h1><br>
<h1>${person.adresse}</h1><br>
<h1>${person.adresseEmail}</h1><br>
<h1>${person.dateNaissance}</h1><br>
<h1>${person.dateRecrutement}</h1><br>


</body>
<script src="scripts/script.js"></script>
</html>
