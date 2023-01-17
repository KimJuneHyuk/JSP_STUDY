<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/27
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="fragments/menu.jsp"/>
<%--<%@include file="fragments/menu.jsp"%>--%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">로그인</h1>
    </div>
</div>

<div class="container" align="center">
    <div class="col-md-4 col-md-offset-4">
        <h3 class="form-signin-heading">Please sign in</h3>
        <%
            String error = request.getParameter("error");
            if (error != null) {
                out.println("<div class='alert alert-danger'>");
                out.println("아이디와 비밀번호를 입력해 주세요.");
                out.println("</div>");
            }
        %>

        <form action="j_security_check" method="post" class="form-signin">
            <div class="form-group">
                <label for="inputUserName" class="sr-only">User Name</label>
                <input type="text" id="inputUserName" class="form-control" placeholder="ID" name="j_username" required autofocus>
            </div>

            <div class="form-group">
                <label for="inputPassword" class="sr-only">Password</label>
                <input type="text" id="inputPassword" class="form-control" placeholder="password" name="j_password" required autofocus>
            </div>
            <button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
        </form>
    </div>
</div>
</body>
</html>
