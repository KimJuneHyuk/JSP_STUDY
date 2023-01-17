<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/28
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="Ex01_errorCode_error.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String num1 = request.getParameter("num1");
    String num2 = request.getParameter("num2");

    int a = Integer.parseInt(num1);
    int b = Integer.parseInt(num2);
    int c = a / b;

    out.print(num1 + " / " + num2 + " = " + c);
%>

</body>
</html>
