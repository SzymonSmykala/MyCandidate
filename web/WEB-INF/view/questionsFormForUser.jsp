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
    Question Form for you! Answer all questions, we will find candidate for you!
</h2>


<form:form method="get" action="processForm" modelAttribute="answerForm" enctype="multipart/form-data">
    <table class="table-fill" cellspacing="0">
        <thread>
            <tr>
                <th>Id</th>
                <th>Question</th>
                <th>Answer</th>
            </tr>
        </thread>

        <c:forEach items="${answerForm.answers}" var="answer" varStatus="status">

            <tr>

                <td align="center">${status.count}</td>
                <td>
                    ${answer.questionContent}
                    <input name="answers[${status.index}].questionContent" value="${answer.questionContent}"  type="hidden"/></td>
                <td>
                    <%--<input name="answers[${status.index}].answer" value="${answer.answer}"/>--%>
                Yes <input type="radio" name="answers[${status.index}].answer" value="Yes"/>
                No  <input type="radio" name="answers[${status.index}].answer" value="No"/>
                </td>
            </tr>

        </c:forEach>


    </table>
    <input type="submit" value="Save"/>
</form:form>


</body>
</html>
