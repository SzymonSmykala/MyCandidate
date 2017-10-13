<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
