<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 10:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%@include file="dbConn.jsp"%>

<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("password");
    String name = request.getParameter("name");

    PreparedStatement pstmt = null; // PreparedStatement    참조변수를 null  로 초기화 하기

    try {
        // users 테이블의 id, password, name 필드에 정해지지않은 값을 삽입하도록 insert문 작성하기.
        String sql = "insert into `sample`.`users` (`id`, `password`, `name`) values (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);     // PreparedStatement 객체를 생성하도록 작성.
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        pstmt.setString(3, name);
        pstmt.executeUpdate();
        out.println("users 테이블에 삽입 성공하였습니다");
    } catch (SQLException e) {
        out.println("users 테이블 삽입 실패!! <br>");
        out.println("SqlException : " + e.getMessage());
    } finally {
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            pstmt.close();
        }
    }
%>

</body>
</html>
