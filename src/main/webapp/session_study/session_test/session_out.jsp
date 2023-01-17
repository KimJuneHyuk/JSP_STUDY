<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  session.removeAttribute("uID");
  String id = (String) session.getAttribute("uID");
    out.println(id);
  response.sendRedirect("session.jsp");
%>

</body>
</html>
