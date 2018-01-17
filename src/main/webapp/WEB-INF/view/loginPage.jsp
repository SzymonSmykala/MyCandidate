<html>
    <head>
        <link type="text/css"
              rel="stylesheet"
              href="${pageContext.request.contextPath}/resources/css/loginPageStyle.css"/>
    </head>
    <body>
    <div class="login-page">
        <div class="form">
            <form class="login-form">
                <input type="text" placeholder="username"/>
                <input type="password" placeholder="password"/>
                <button>login</button>
            </form>
        </div>
    </div>
    <%@ include file="parts/footer.jsp" %>
    </body>
</html>