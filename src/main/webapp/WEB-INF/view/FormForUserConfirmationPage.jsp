<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your answers</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="footer, contact, form, icons" />

    <title>Footer Distributed With Contact Form</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer-distributed-with-contact-form.css">

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

</head>
<body>


<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/user/questionForm">My Candidate</a>
        </div>
        <ul class="nav navbar-nav">


            <li><a href="#">Statistics</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">About Us</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>

<%--<form:form method="get" action="processForm" modelAttribute="answerForm"  enctype="multipart/form-data">--%>

<%--//Everything saves in DB with userId = 0--%>
<%--//For candidates saves in DB with userId--%>
<%--<table>--%>
<%--<tr>--%>
<%--<td>Question</td>--%>
<%--<td>Answer</td>--%>
<%--</tr>--%>

<%--<c:forEach items="${answerForm.answerWithQuestions}" var="answerWithQuestion" varStatus="status">--%>

<%--<tr>--%>
<%--<td>--%>
<%--${answerWithQuestion.questionContent}--%>
<%--<td>--%>
<%--${answerWithQuestion.answer}--%>
<%--</td>--%>
<%--</tr>--%>

<%--</c:forEach>--%>


<%--</table>--%>

<%--</form:form >--%>


<div class="container">
    <div class="row">

        <section class="content">
            <h1 align="center">Matched Candidates</h1>
            <div class="col-md-8 col-md-offset-2">

                <div class="table-container">
                    <table class="table table-filter">


                        <tr>
                            <%--<td> Candidate Name</td>--%>
                            <%--<td>Percent Of Match</td>--%>
                        </tr>

                        <c:forEach items="${matchedCandidates}" var="cadidate">
                            <tr>

                                <td>
                                    <div class="media">
                                        <a href="#" class="pull-left">
                                            <img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg"
                                                 class="media-photo">
                                        </a>
                                        <div class="media-body">
                                            <span class="media-meta pull-right">  </span>
                                            <h4 class="title">
                                                 <b style="color: #3F71AE"> ${cadidate.firstName} ${cadidate.lastName} </b>

                                            </h4>
                                            <p class="summary">//Here will be more information of candidate</p>
                                        </div>
                                    </div>
                                </td>


                                <td style="align-items: center">
                                     <b style="color: forestgreen; ont-size:300%; ">   ${cadidate.percentOfMatch} %  </b>
                                </td>

                            </tr>

                        </c:forEach>

                    </table>
                </div>
            </div>
        </section>
    </div>
</div>

<%@ include file="parts/footer.jsp" %>


</body>
</html>
