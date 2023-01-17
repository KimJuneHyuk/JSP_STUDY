<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 12:23 PM
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
<table width="500" border="1">
    <tr>
        <th>학번</th>
        <th>학과</th>
        <th>이름</th>
        <th>주소</th>
        <th>연락처</th>
    </tr>

    <%
        ResultSet rs = null;
        PreparedStatement pstmt = null;

        try {
            String sql = "select * from `sample`.`students`";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String num = rs.getString("num");
                String depart = rs.getString("depart");
                String name = rs.getString("name");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
    %>
    <tr>
        <td><%=num%></td>
        <td><%=depart%></td>
        <td><%=name%></td>
        <td><%=address%></td>
        <td><%=phone%></td>
    </tr>
    <%
            }
        } catch (SQLException e) {
            out.println("students 테이블 호출에 실패 !!<br>");
            out.println("SQLException : " + e.getMessage());
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    %>
</table>

</body>
</html>
