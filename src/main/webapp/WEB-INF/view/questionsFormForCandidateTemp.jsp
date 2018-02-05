<%@ page import="com.mycan.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Question Form</title>

    <head>
        <title>Temp Candidate form</title>
        <link type="text/css"
              rel="stylesheet"
              href="${pageContext.request.contextPath}/resources/css/tableStyle.css"/>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


        <script>
            function confirm() {
                alert("Candidate's answers have been added to Database!")
            }
        </script>

    </head>

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
            <li class="active"><a href="${pageContext.request.contextPath}/admin/candidateForm">Candidate Form</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/addUser">Add user</a></li>
            <li><a href="${pageContext.request.contextPath}/user/questionForm">User Form</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>





<h2 align="center">
    This is temp Questions' form for candidate. <br>
    You can add candidate answers to Database and check that application works.
</h2>






<form:form method="get" action="candidateSubmit" modelAttribute="answerForm" enctype="multipart/form-data">

    <h2 style="color: #3F71AE" align="center"><b>Select Candidate to answer</b></h2>
    <form:select cssStyle="margin-left: 43%" path="currentUserId" items="${candidates}" title="Select Candidate to answer"/>
    <br><br>


    <table class="table-fill" cellspacing="0">
        <thread>
            <tr>
                <th>Id</th>
                <th>Question</th>
                <th>Answer</th>
            </tr>
        </thread>

        <c:forEach items="${answerForm.answerWithQuestions}" var="answerWithQuestion" varStatus="status">

            <tr>

                <td align="center">${status.count}</td>
                <td>
                        ${answerWithQuestion.questionContent}
                    <input name="answerWithQuestions[${status.index}].questionContent"
                           value="${answerWithQuestion.questionContent}" type="hidden"/>
                    <input name="answerWithQuestions[${status.index}].questionId"
                           value="${answerWithQuestion.questionId}" type="hidden"/>

                </td>
                <td>

                    Yes <input name="answerWithQuestions[${status.index}].answer" value="Yes" type="radio"/>
                    No <input name="answerWithQuestions[${status.index}].answer" value="No" type="radio"/>
                </td>
            </tr>

        </c:forEach>


    </table>
<br>
    <input type="submit" value="Save" onclick="return confirm()" class="btn btn-primary"
           style="display: block; margin: 0 auto;/>
</form:form>

<%@ include file="parts/footer.jsp" %>