<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 9:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>SQL DATABASE</title>
</head>
<body>
<%@ include file="dbConn.jsp"%>
<%--
    Statement 객체로 INSERT 쿼리문 실행하기
    1)statement 객체를 null로 초기화
    2) users 테이블의 각 필드에 폼 페이지에서 전송된 아이디, 비밀번호, 이름을 삽입하도록 insert문 작성하기.
    3) statement 객체를 생성하도록 작성.
    4) INSERT 문을 실행하도록 Statement 객체의 executeUpdate() 메서드를 작성
    5) INSERT 문의 실해잉 성공하면 메세지 출력하기.
    6) 생성한 Statement 객체와 Connection객체를 해제.
--%>

<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String pw = request.getParameter("password");
    String name = request.getParameter("name");

    Statement stmt = null;

    try {
        String sql = "insert into `sample`.`users` (`id`, `password`, `name`) values ('" + id + "', '" + pw + "', '" + name + "')";
        out.print(sql);
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        out.println("Users 테이블 삽이에 성공하였습니다");
    } catch (SQLException e) {
        out.println("Users 테이블에 삽입 실패! <br>");
    } finally {
        try {
            if (stmt != null) {
                stmt.close();
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
