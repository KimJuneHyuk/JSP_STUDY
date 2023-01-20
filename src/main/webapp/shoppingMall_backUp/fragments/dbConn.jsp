<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 12:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String url = "jdbc:mariadb://localhost:3306/WebMarketDb";
        String user = "kjh";
        String password  = "9172";

        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
    } catch (SQLException e ) {
        out.println("데이터 베이스 연결 실패!");
        out.println("SQLException : " + e.getMessage());
    }
%>
