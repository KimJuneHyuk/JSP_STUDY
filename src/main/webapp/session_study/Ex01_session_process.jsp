<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/28
  Time: 12:44 PM
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
    세션 설정하기
    1) 전송된 아이디 비번이 일치하면 세션 속성 이름 userID, userPW 에 값을 설정하도록 session 내장 객체의 setAttribute() 메서드 작성.
    2) 일치하지 않으면 실패 메세지를 출력하기.
--%>
<%
    String user_id = request.getParameter("id");
    String user_pw = request.getParameter("password");

    if (user_id.equals("admin") && user_pw.equals("1234")) {
        session.setAttribute("userID", user_id);
        session.setAttribute("userPW", user_pw);
        out.println("세션 설정에 성공하였습니다. <br>");
        out.println(user_id +" 님 환영합니다..");
    } else {
        out.println("세션 설정에 실패 하였습니다.");
    }
%>

</body>
</html>
