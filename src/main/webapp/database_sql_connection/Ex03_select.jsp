<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 11:02 AM
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
<table width="300" border="1">
    <tr>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
    </tr>

    <%
        ResultSet rs = null;
        Statement stmt = null;

        try {
            String sql = "select * from `sample`.`users`";
            stmt = conn.createStatement();

            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String id = rs.getString("id");
                String pw = rs.getString("password");
                String name = rs.getString("name");
    %>
    <tr>
        <td><%=id%></td>
        <td><%=pw%></td>
        <td><%=name%></td>
    </tr>
    <%
            }
        } catch (SQLException e) {
            out.println("users 테이블 호출에 실패 !!<br>");
            out.println("SQLException : " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    %>
</table>

</body>
</html>
