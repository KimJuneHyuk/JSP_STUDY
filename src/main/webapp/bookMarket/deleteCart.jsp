<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/03
  Time: 11:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("cart.jsp");
%>