<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html>
<head>
    <title>Questions List</title>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/tableStyle.css"/>

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
            <li class="active"><a href="${pageContext.request.contextPath}/admin/questionsList">Questions List</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/addQuestion">Add Question</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/candidateForm">Candidate Form</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/addUser">Add user</a></li>
            <li><a href="${pageContext.request.contextPath}/user/questionForm">User Form</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
    </div>
</nav>



<div style="margin:100px">
    <div class="card">
        <h3 class="card-header text-center font-bold font-up py-4">Edit/Add/Delete questions</h3>
        <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i class="fa fa-plus fa-2x"
                                                                                           aria-hidden="true"></i></a></span>
        <table cellspacing="0" class="table table-bordered table-responsive table-striped text-center">
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Content</th>
                <th class="text-center">Action</th>
            </tr>

            <c:forEach var="question" items="${questionsList}">

                <c:url var="deleteLink" value="deleteQuestion">
                    <c:param name="questionId" value="${question.id}"/>
                </c:url>

                <c:url var="editLink" value="editQuestion">
                    <c:param name="questionId" value="${question.id}"/>
                </c:url>

                <tr>
                    <td class="pt-3-half">${question.id}</td>
                    <td class="pt-3-half">${question.questionContent}</td>
                    <td class="pt-3-half" >


                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure to delete this question?')))return false">
                            <span class="table-remove"><button type="button"
                                                               class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span></a>


                        <a href="${editLink}">
                            <button type="button" class="btn">Edit</button>
                        </a>
                    </td>
                </tr>

            </c:forEach>
        </table>



    </div>
</div>



<%@ include file="parts/footer.jsp"  %>
</body>
</html>
