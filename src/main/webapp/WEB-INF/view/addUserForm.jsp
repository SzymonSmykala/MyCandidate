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
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/tableStyle.css"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
          crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="footer, contact, form, icons"/>

    <title>Footer Distributed With Contact Form</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/demo.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/footer-distributed-with-contact-form.css">

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">



</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/questionsList">My Candidate Admin</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}/admin/questionsList">Questions List</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/addQuestion">Add Question</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/candidateForm">Candidate Form</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/admin/addUser">Add user</a></li>
            <li><a href="${pageContext.request.contextPath}/user/questionForm">User Form</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>




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
    <input class="btn-success" type="submit" value="Submit" onclick="return confirm()">

</form:form>
<%@ include file="parts/footer.jsp" %>
</body>
</html>
