<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/30
  Time: 10:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("addBook.jsp");
%>