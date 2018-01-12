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


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/questionsList">My Candidate Admin</a>
        </div>
        <ul class="nav navbar-nav">
            <li ><a href="${pageContext.request.contextPath}/admin/questionsList">Questions List</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/admin/addQuestion">Add Question</a></li>

        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>






<form:form action="saveQuestion" modelAttribute="question" method="post">
    <table cellspacing="0" class="table table-bordered table-responsive table-striped text-center">
        <tr>
            <th>ADD QUESTION</th>
        </tr>

        <tr>

            <td>

                <form:textarea path="questionContent"/>
                <input type="submit">
            </td>
        </tr>

    </table>

</form:form>


</body>
</html>
