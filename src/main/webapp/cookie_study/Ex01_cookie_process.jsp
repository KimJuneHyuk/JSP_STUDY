<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/28
  Time: 10:35 AM
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
    쿠키 생성하기.
    1) 전송된 아이디와 비밀번호가 일치하면, 쿠키 이름 userID, userPW 에 값을 설정하도록 Cookie 객체를 생성한다.
    생성된Cookie 객체를 쿠키로 저장하도록 response 내장 객체의 addCookie() 메서드를 작성하고, 성공 메세지를 출력.
    일치하지 않으면 실패 메세지를 출력하도록 하기.
--%>
<%
    String user_id = request.getParameter("id");
    String user_pw = request.getParameter("password");

    if (user_id.equals("admin") && user_pw.equals("1234")) {
        Cookie cookie_id = new Cookie("userID", user_id);
        Cookie cookie_pw = new Cookie("userPW", user_pw);

        response.addCookie(cookie_id);
        response.addCookie(cookie_pw);

        out.println("쿠키 생성에 성공하였습니다 <br> ");
        out.println(user_id + " 님 환영합니다.");
    } else {
        out.println("쿠키 생성 실패.");
    }
%>

</body>
</html>
