<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/05
  Time: 10:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="dataSource"
                   url="jdbc:mariadb://localhost:3306/WebMarketDB"
                   driver="org.mariadb.jdbc.Driver"
                   user="kjh"
                   password="9172"/>
<%@include file="../fragments/dbConn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");

    String sql = "select * from `WebMarketDB`.`admin` where `id` = ? and `password` = ?";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, password);
    rs = pstmt.executeQuery();
    if (rs.next()) {
        session.setAttribute("sessionAdminId", rs.getString("id"));
        session.setAttribute("sessionAdminName", rs.getString("name"));
        session.setAttribute("sessionAdminDay", rs.getString("lately_login_day"));



        sql = "update `WebMarketDB`.`admin` set `lately_login_day` = now() where `id` = ? and `password` = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,id);
        pstmt.setString(2,password);
        pstmt.executeUpdate();

//        인덱스 페이지로 이동
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("loginAdmin.jsp?error=1");
    }

%>

<%--<sql:query dataSource="${dataSource}" var="resultSet">--%>
<%--    select * from `WebMarketDB`.`members` where `id` = ? and `password` = ?--%>

<%--    <sql:param value="<%=id%>" />--%>
<%--    <sql:param value="<%=password%>" />--%>
<%--</sql:query>--%>

<%--<c:forEach var="row" items="${resultSet.rows}">--%>
<%--    <%--%>
<%--        session.setAttribute("sessionId", id);--%>
<%--    %>--%>
<%--    <c:redirect url="resultAdmin.jsp?msg=2" />--%>
<%--</c:forEach>--%>

<%--<c:redirect url="loginAdmin.jsp?error=1" />--%>