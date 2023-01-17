<%@ page import="com.example.jsp_study.market.daos.CartDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../fragments/dbConn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");

    String sql = "select * from `WebMarketDB`.`members` where `id` = ? and `password` = ?";

    pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, id);
    pstmt.setString(2, password);

    rs = pstmt.executeQuery();

    if (rs.next()) {
        session.setAttribute("sessionId", id);
        session.setAttribute("sessionName", rs.getString("name"));

        CartDao cartDao = new CartDao();
        cartDao.updateCartByLogin(session);

        response.sendRedirect("resultMember.jsp?msg=2");
    } else {
        response.sendRedirect("loginMember.jsp?error=1");
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
<%--    <c:redirect url="resultMember.jsp?msg=2" />--%>
<%--</c:forEach>--%>

<%--<c:redirect url="loginMember.jsp?error=1" />--%>