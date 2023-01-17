<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/28
  Time: 9:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="Ex05_tryCatch_error.jsp" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<%
    try {
        String num1 = request.getParameter("num1");
        String num2 = request.getParameter("num2");

        int a = Integer.parseInt(num1);
        int b = Integer.parseInt(num2);
        int c = a / b;
    } catch (NumberFormatException e) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("Ex05_tryCatch_error.jsp");
        dispatcher.forward(request, response);
    }

%>

</body>
</html>
