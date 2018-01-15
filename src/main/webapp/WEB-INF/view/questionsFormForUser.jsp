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

</head>
<body>
<div id="wrapper">

    <div id="body">
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


        <div class="container">
            <div class="row">

                <section class="content">

                    <div class="col-md-8 col-md-offset-2">


                        <h2>
                            Question Form for you! Answer all questions, we will find candidate for you!
                        </h2>


                        <form:form method="get" action="processForm" modelAttribute="answerForm"
                                   enctype="multipart/form-data">
                            <table class="table table-filter" cellspacing="0">
                                <thread>
                                    <tr>
                                        <th>Id</th>
                                        <th>Question</th>
                                        <th>Answer</th>
                                    </tr>
                                </thread>

                                <c:forEach items="${answerForm.answerWithQuestions}" var="answerWithQuestion"
                                           varStatus="status">

                                    <tr>

                                        <td align="center">${status.count}</td>
                                        <td>
                                                ${answerWithQuestion.questionContent}
                                            <input name="answerWithQuestions[${status.index}].questionContent"
                                                   value="${answerWithQuestion.questionContent}" type="hidden"/></td>
                                        <td>

                                            Yes <input name="answerWithQuestions[${status.index}].answer" value="Yes"
                                                       type="radio"/>
                                            No <input name="answerWithQuestions[${status.index}].answer" value="No"
                                                      type="radio"/>
                                        </td>
                                    </tr>

                                </c:forEach>


                            </table>
                            <div>
                                <input type="submit" value="Find Candidate For Me!" class="btn btn-primary"
                                       style="display: block; margin: 0 auto;"/>
                            </div>
                        </form:form>


                    </div>


                </section>

            </div>
        </div>

    </div>

    <%--<div class="container">--%>
        <%--<div class="footer">--%>
            <%--<footer class="footer-distributed">--%>

                <%--<div class="footer-left">--%>

                    <%--<h3>My <span>Candidate</span></h3>--%>

                    <%--<p class="footer-links">--%>
                        <%--<a href="#">Home</a>--%>
                        <%--·--%>
                        <%--<a href="#">Blog</a>--%>
                        <%--·--%>
                        <%--<a href="#">About Us</a>--%>
                        <%--·--%>
                        <%--<a href="#">Contact</a>--%>
                    <%--</p>--%>

                    <%--<p class="footer-company-name">Szymon Smykała &copy; 2018</p>--%>

                    <%--<div class="footer-icons">--%>

                        <%--<a href="#"><i class="fa fa-facebook"></i></a>--%>
                        <%--<a href="#"><i class="fa fa-twitter"></i></a>--%>
                        <%--<a href="https://www.linkedin.com/in/szymon-smyka%C5%82a/"><i class="fa fa-linkedin"></i></a>--%>
                        <%--<a href="https://github.com/SzymonSmykala"><i class="fa fa-github"></i></a>--%>

                    <%--</div>--%>

                <%--</div>--%>

                <%--<div class="footer-right">--%>

                    <%--<p>Contact Us</p>--%>

                    <%--<form action="#" method="post">--%>

                        <%--<input type="text" name="email" placeholder="Email"/>--%>
                        <%--<textarea name="message" placeholder="Message"></textarea>--%>
                        <%--<button>Send</button>--%>

                    <%--</form>--%>

                <%--</div>--%>

            <%--</footer>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

    <div class="container">
        <div class="row">
            <hr>
            <div class="col-lg-12">
                <div class="col-md-8">
                    <a href="#">Terms of Service</a> | <a href="#">Privacy</a>
                </div>
                <div class="col-md-4">
                    <p class="muted pull-right">© 2018 Szymon Smykała. All rights reserved</p>
                </div>
            </div>
        </div>
    </div>




</body>
</html>
