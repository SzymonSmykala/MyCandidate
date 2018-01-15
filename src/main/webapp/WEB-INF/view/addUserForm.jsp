<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Szymon
  Date: 31.12.2017
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new User</title>
    <script>
        function confirm() {
            alert("User has been added to database!")
        }
    </script>


</head>
<body>

<h1>This is new user form!</h1>


<form:form action="addUserSubmit" method="post" modelAttribute="user">

    Email: <form:input path="email"/> <br>
    First Name: <form:input path="firstName"/> <br>
    Last Name: <form:input path="lastName"/> <br>
    Password: <form:password path="password"/><br>

    Role: ADMIN <form:radiobutton path="role" value="ADMIN"/>
    CANDIDATE <form:radiobutton path="role" value="CANDIDATE"/>
    USER <form:radiobutton path="role" value="USER"/>
    <br>
    <input type="submit" value="Submit" onclick="return confirm()">

</form:form>

</body>
</html>
