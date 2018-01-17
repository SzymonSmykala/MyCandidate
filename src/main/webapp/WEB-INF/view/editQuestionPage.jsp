<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <title>Edit Question</title>
    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/tableStyle.css"/>
</head>
<body>

<table cellspacing="0" class="table-fill">
    <tr>
        <th>EDIT QUESTION</th>
        <param name="questionId" value="${currentQuestion.id}"/>
    </tr>

    <tr>

        <td>

        <form:form action="editQuestionSubmit" modelAttribute="currentQuestion" method="post">

            <form:textarea path="questionContent" rows="3" cols="60" />
            <form:hidden path="id"/>
            <input type="submit">


        </form:form>
        </td>
    </tr>

</table>


<%@ include file="parts/footer.jsp" %>
</body>



