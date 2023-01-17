<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/05
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("loginMember.jsp");
%>
