<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Question Form</title>

    <head>
        <title>Questions' List</title>
        <link type="text/css"
              rel="stylesheet"
              href="${pageContext.request.contextPath}/resources/css/tableStyle.css"/>
    </head>

</head>
<body>

<h2>
    Question Form for you! Answer all questions, we will find candidate for you!
</h2>



    <table class="table-fill" cellspacing="0">
        <thread>
            <tr>
                <th>Question</th>
                <th>Answer</th>
            </tr>
        </thread>
        <tbody>


        <c:forEach var="question" items="${questionList}">

        <tr>
            <td class = "text-left">${question.questionContent}</td>
            <td class="text-left">

                <%--<form:radiobutton  path="typeOfAnswer" items=" ${typeOfAnswer}"/>--%>

            </td>
        </tr>
        </tbody>
        </c:forEach>

    </table>




</body>
</html>
