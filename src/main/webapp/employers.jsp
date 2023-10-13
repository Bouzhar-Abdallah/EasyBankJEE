<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<jsp:include page="components/navbar.jsp"/>

<form id="myForm" method="POST" action="http://localhost:8080/easybankjee/employers/update">
    <!-- Use a hidden input field to specify the HTTP method -->
    <!-- Other form fields go here -->
    <input type="hidden" name="_METHOD" value="PUT"/>
    <input type="text" name="data" value="Some data">
    <button type="submit">PUT</button>


</form>
<%--<form id="myForm" method="POST" action="http://localhost:8080/easybankjee/employers/new">
    <!-- Use a hidden input field to specify the HTTP method -->
    <!-- Other form fields go here -->
    <input type="hidden" name="_METHOD" value="POST"/>

    <button type="submit">new</button>


</form>--%>

<table>
    <tr>
        <th>Matricule</th>
        <th>Prenom</th>
        <th>Nom</th>
        <th>Numero Tel</th>
        <th>adresse</th>
        <th>email</th>
        <th>Date Naissance</th>
        <th>Date Recrutement</th>
        <th>actions</th>
    </tr>
    <c:forEach items="${clients}" var="person">
        <tr>
            <td>${person.matricule}</td>
            <td>${person.prenom}</td>
            <td>${person.nom}</td>
            <td>${person.numeroTel}</td>
            <td>${person.adresse}</td>
            <td>${person.adresseEmail}</td>
            <td>${person.dateNaissance}</td>
            <td>${person.dateRecrutement}</td>
            <td class="actions">
                    <%--edit--%>
                <form method="POST" action="/easybankjee/employers/update">
                    <input type="hidden" name="_METHOD" value="updateForm"/>
                    <input type="hidden" name="matricule" value="${person.matricule}">
                    <button type="submit">

                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="15" height="15" viewBox="0 0 64 64">
                            <path d="M22 51c-1-1-4-1-4-1l-.425-1.274c-.362-1.086-1.215-1.939-2.301-2.301L14 46c0 0 .5-2.5-1-4l25-25 8 10L22 51zM52 21l-9-9 4.68-4.68c0 0 3.5-1.5 7 2s2 7 2 7L52 21zM9 50l-1.843 4.476c-.614 1.49.877 2.981 2.367 2.367L14 55 9 50z"></path>
                        </svg>
                    </button>
                </form>
                    <%--delete--%>
                <form method="POST" action="/easybankjee/employers/delete">
                    <input type="hidden" name="_METHOD" value="delete"/>
                    <input type="hidden" name="matricule" value="${person.matricule}">
                    <button type="submit">
                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="15" height="15"
                             viewBox="0 0 24 24">
                            <path d="M 10.806641 2 C 10.289641 2 9.7956875 2.2043125 9.4296875 2.5703125 L 9 3 L 4 3 A 1.0001 1.0001 0 1 0 4 5 L 20 5 A 1.0001 1.0001 0 1 0 20 3 L 15 3 L 14.570312 2.5703125 C 14.205312 2.2043125 13.710359 2 13.193359 2 L 10.806641 2 z M 4.3652344 7 L 5.8925781 20.263672 C 6.0245781 21.253672 6.877 22 7.875 22 L 16.123047 22 C 17.121047 22 17.974422 21.254859 18.107422 20.255859 L 19.634766 7 L 4.3652344 7 z"></path>
                        </svg>
                    </button>
                </form>
                <form method="GET" action="/easybankjee/employers/new">


                    <button type="submit">
                        new
                    </button>
                </form>
            </td>
        </tr>
    </c:forEach>

</table>
</body>
<script src="scripts/script.js"></script>
</html>
