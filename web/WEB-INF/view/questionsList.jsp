<%--
  Created by IntelliJ IDEA.
  User: Szymon
  Date: 08.09.2017
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Questions' List</title>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/tableStyle.css"/>
</head>
<body>
<div class="table-title">
    <h3>Questions' List</h3>
</div>
<h2>
    <a href="${pageContext.request.contextPath}/admin/addQuestion">Add question</a>
</h2>

<table cellspacing="0" class="table-fill">
    <tr>
        <th>ID</th>
        <th>Content</th>
        <th>Action</th>
    </tr>

    <c:forEach var="question" items="${questionsList}">

        <c:url var="deleteLink" value="deleteQuestion">
            <c:param name="questionId" value="${question.id}"/>
        </c:url>

        <c:url var="editLink" value="editQuestion">
            <c:param name="questionId" value="${question.id}"/>
        </c:url>

        <tr>
            <td class="text-left">${question.id}</td>
            <td class="text-left">${question.questionContent}</td>
            <td>
                <a href="${deleteLink}"
                   onclick="if (!(confirm('Are you sure to delete this question?')))return false">Delete</a>
                | <a href="${editLink}">EDIT</a>
            </td>
        </tr>

    </c:forEach>
</table>

</body>
</html>
