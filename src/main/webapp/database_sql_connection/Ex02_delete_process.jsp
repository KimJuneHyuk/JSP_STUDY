<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%@include file="dbConn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String pw = request.getParameter("password");

    ResultSet rs = null;
    Statement stmt = null;

    try {
        String sql = "select `id`, `password` from `sample`.`users` where `id` = '" + id + "'";
        stmt = conn.createStatement();
        rs= stmt.executeQuery(sql)  ;

        if (rs.next()) {
            String rId = rs.getString("id");
            String rPw = rs.getString("password");

            if (id.equals(rId) && pw.equals(rPw)) {
                sql = "delete from `sample`.`users` where `id` = '" + id + "'";
                stmt = conn.createStatement();
                stmt.executeUpdate(sql);
                out.println("users 테이블을 삭제 핳였습니다.");
            } else {
                out.println("일치하는 비밀번호가 없습니다.");
            }
        } else {
            out.println("users 테이블에 일치하는 아이디가 없습니다.");
        }
    } catch (SQLException e) {
        out.println("SQLException : " + e.getMessage());
    } finally {
        if (stmt != null) {
            stmt.close();
        }
        if (rs != null) {
            rs.close();
        }
    }
%>

</body>
</html>
