<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/06
  Time: 10:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>관리자 메인</title>
</head>
<body>
<%@include file="./menu.jsp"%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">관리자 메인 페이지입니다.</h1>
    </div>
</div>

<div class="container">
    <%
        out.println(" <h2 class='alert alert-success'>" + sessionAdminName + " 님 환연합니다.</h2>");

        String sessionAdminDay = (String) session.getAttribute("sessionAdminDay");
        out.println(" <h2 class='alert alert-danger'> 최근 로그인한 시간은 [ " + sessionAdminDay + " ] 입니다. </h2>");
    %>
    <%@include file="../fragments/footer.jsp"%>
</div>

</body>
</html>
