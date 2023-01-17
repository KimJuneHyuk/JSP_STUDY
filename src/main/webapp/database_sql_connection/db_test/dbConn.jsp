<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 12:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    Connection conn = null;

    String url = "jdbc:mariadb://localhost:3306/sample";
    String user = "kjh";
    String password = "9172";

    Class.forName("org.mariadb.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
%>
