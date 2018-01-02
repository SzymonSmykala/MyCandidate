<%@ page import="com.mycan.entity.User" %>
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
    </head>

</head>
<body>

<h2>
    Qustions' Form for Candidate
</h2>


<form:form method="get" action="processForm" modelAttribute="answerForm" enctype="multipart/form-data">


    <form:select path="currentUser" items="${candidates}"/>


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
                           value="${answerWithQuestion.questionContent}" type="hidden"/></td>
                <td>

                    Yes <input name="answerWithQuestions[${status.index}].answer" value="Yes" type="radio"/>
                    No <input name="answerWithQuestions[${status.index}].answer" value="No" type="radio"/>
                </td>
            </tr>

        </c:forEach>


    </table>
    <input type="submit" value="Save"/>
</form:form>


</body>
</html>
