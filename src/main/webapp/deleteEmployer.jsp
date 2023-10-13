<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<jsp:include page="components/navbar.jsp"/>
<h1>delete form</h1>
<form id="myForm" method="POST" action="http://localhost:8080/easybankjee/employers">

    <input type="hidden" name="_METHOD" value="DELETE"/>
    <button type="submit">DELETE</button>


</form>

</body>
<script src="scripts/script.js"></script>
</html>
