<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/28
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8"></meta>
    <title>Title</title>
</head>
<body>
<%
    String user_id = request.getParameter("id");
    String user_pw = request.getParameter("password");

    if (user_id.equals("kjh6565") && user_pw.equals("test1234")) {
        Cookie ck_id = new Cookie("userID", user_id);
        Cookie ck_pw = new Cookie("userPW", user_pw);

        response.addCookie(ck_id);
        response.addCookie(ck_pw);

        response.sendRedirect("welcome.jsp");
    }
%>

</body>
</html>
