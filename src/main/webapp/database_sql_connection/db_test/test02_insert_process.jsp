<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 12:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8"></meta>
    <title>Title</title>
</head>
<body>
<%@include file="dbConn.jsp"%>

<%
    request.setCharacterEncoding("utf-8");

    String num = request.getParameter("num");
    String depart = request.getParameter("depart");
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");

    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String sql1 = "select `num` from `sample`.`students` where num = ?";
        pstmt = conn.prepareStatement(sql1);
        pstmt.setString(1, num);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            out.println("해당 학번이 이미 존재 함.");
            return;
        }

        String sql2 = "insert into `sample`.`students` (`num`, `depart`, `name`,`address`,`phone`) values (?,?,?,?,?)";

        pstmt = conn.prepareStatement(sql2);
        pstmt.setString(1, num);
        pstmt.setString(2, depart);
        pstmt.setString(3, name);
        pstmt.setString(4, address);
        pstmt.setString(5, phone);

        pstmt.executeUpdate();
        out.println("students 테이블 삽이에 성공하였습니다");
    } catch (SQLException e) {
        out.println("students 테이블에 삽입 실패! <br>");
    } finally {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
