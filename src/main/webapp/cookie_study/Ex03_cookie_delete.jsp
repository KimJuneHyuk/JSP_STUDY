<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/28
  Time: 11:22 AM
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
    쿠키 객체에 저장된 모든 쿠키 삭제하기.
    1) 쿠키 정보를 얻어오도록 request 내장 객체의 getCookies() 메서드 작성.
    2) 얻어온 모든 쿠키를 삭제하도록 Cookie 객체의 setmaxAge() 메서드 유효 기간을 0 으로 설정 (int age ::타입으로 0이면 생명이 없다는 뜻.)
    3) 웹 페이지 cookie02.jsp  로 이동하도록 response 내장 객체의 sendRedirect() 메서드를 작성한다.
--%>
<%
    Cookie[] cookies = request.getCookies();

    for (int i = 0; i < cookies.length; i++) {
        cookies[i].setMaxAge(10);
        response.addCookie(cookies[i]);
    }
    response.sendRedirect("Ex02_cookie_arrayRead.jsp");
%>
</body>
</html>
