<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 9:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%--
    JDBD API 로 접속하기.

    - Connection 객체를 null 로 초기화 하기

    1) 데이터 베이스와 연동하기 위해 JDBC 로 로딩하도록 classs.forName() 메서드 작성.
    2) DriverManager 객체로 부터 Connection 객체를 얻어오고록 getConnection() 메서드 작성하기.
--%>
<%
    Connection conn = null;
    try {
        String url = "jdbc:mariadb://localhost:3306/sample";
        String user = "kjh";
        String password  = "9172";

        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        out.println("데이터베이스 연결에 성공하였습니다.");
    } catch (SQLException e ) {
        out.println("데이터 베이스 연결 실패!");
        out.println("SQLException : " + e.getMessage());
    } finally {
        if (conn != null) {
            conn.close();;
        }
    }
%>

</body>
</html>
