<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/04
  Time: 9:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@ include file="../fragments/dbConn.jsp"%>

<%
    String productId = request.getParameter("id");

    String sql = "select * from `WebMarketDB`.`products` where `p_id` = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, productId);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        sql = "delete from `WebMarketDB`.`products` where `p_id` = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productId);
        pstmt.executeUpdate();
    } else {
        out.println("일치하는 상품이 없습니다");
    }

    if (rs != null) {
        rs.close();
    }
    if (pstmt != null) {
        pstmt.close();
    }
    if (conn != null) {
        conn.close();
    }

    response.sendRedirect("editProduct.jsp?edit=delete");
%>
