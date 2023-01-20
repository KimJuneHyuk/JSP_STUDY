<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/05
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String sessionAdminId = (String) session.getAttribute("sessionAdminId");
    String sessionAdminDay = (String) session.getAttribute("sessionAdminDay");
    String sessionAdminName = (String) session.getAttribute("sessionAdminName");

    out.println("설정된 세션 userID : " + sessionAdminId + "<br>");
    out.println("설정된 세션 userPW : " + sessionAdminDay + "<br>");
    out.println("설정된 세션 userPW : " + sessionAdminName + "<br>");

    session.removeAttribute("sessionAdminId");
    session.removeAttribute("sessionAdminName");
    session.removeAttribute("sessionAdminDay");


//    session.invalidate();
    response.sendRedirect("loginAdmin.jsp");
%>
