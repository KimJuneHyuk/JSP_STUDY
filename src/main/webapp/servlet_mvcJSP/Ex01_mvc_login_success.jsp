<%@ page import="com.example.jsp_study.model.LoginBean" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/10
  Time: 1:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>로그인 성공하였습니다.</p>
<p>
    <%
        LoginBean bean = (LoginBean) request.getAttribute("bean");
        out.print("아이디 : " + bean.getId());
    %>
</p>

</body>
</html>
