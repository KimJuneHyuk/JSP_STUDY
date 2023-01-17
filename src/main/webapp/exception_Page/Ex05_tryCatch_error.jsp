<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/28
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>잘못된 데이터가 입력되었습니다.</p>
    <p><%="숫자 1 : " + request.getParameter("num1")%></p>
    <p><%="숫자 2 : " + request.getParameter("num2")%></p>
</body>
</html>
