<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Szymon
  Date: 08.09.2017
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add question</title>
</head>
<body>
<form:form action="saveQuestion" modelAttribute="question" method="post">

    <form:textarea path="questionContent"/>
    <input type="submit">


</form:form>


</body>
</html>
