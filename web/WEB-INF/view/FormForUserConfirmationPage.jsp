
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your answers</title>
</head>
<body>

<form:form method="get" action="processForm" modelAttribute="answerForm" enctype="multipart/form-data">

    //Everything saves in DB with userId = 0
    //For candidates saves in DB with userId
    <table>
        <tr>
            <td>Question</td>
            <td>Answer</td>
        </tr>

        <c:forEach items="${answerForm.answerWithQuestions}" var="answerWithQuestion" varStatus="status">

            <tr>
                <td>
                        ${answerWithQuestion.questionContent}
                <td>
                        ${answerWithQuestion.answer}
                </td>
            </tr>

        </c:forEach>


    </table>

</form:form>

</body>
</html>
