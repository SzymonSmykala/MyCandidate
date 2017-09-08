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
    </tr>

    <c:forEach var="question" items="${questionsList}">

        <tr>
            <td class="text-left">${question.id}</td>
            <td class="text-left">${question.questionContent}</td>
        </tr>

    </c:forEach>
</table>

</body>
</html>
