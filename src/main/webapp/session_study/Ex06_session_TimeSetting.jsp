<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 10:27 AM
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
    세션 유효 시간을 가져와 출력하기.
    1) 세션에 설정된 유효 시간을 가져오도록 session 내장객체의 getMaxInactiveInterval() 메서드 작성하고, 유효시간을 출력하도록 작성.
    2) 세션 유효 시간을 60 * 60 초로 설정하도록하기.
        - session 내장 객체의 setMaxInactiveInterval() 메서드를 작성.
    3) 세션에 설정된 유효 시간을 가져오도록 session 내장객체의 getMaxInactiveInterval() 메서드를 작성하고, 유효시간을 출력하도록 작성하기.
--%>
    <p><h4>-------- 세션 유효 시간 변경 전.--------</h4></p>
<%
    int time = session.getMaxInactiveInterval() / 60;
    //getMaxInactiveInterval() == 기본 값이 1800초 입니다. 30분.
    out.println("세션 유효 시간 : " + time + " 분 <br>");
%>
<p><h4>-------- 세션 유효 시간 변경 후.--------</h4></p>
<%
    session.setMaxInactiveInterval(60 * 60);
    time = session.getMaxInactiveInterval() / 60;

    out.println("세션 유효 시간 : " + time + "분 <br>");
%>
</body>
</html>
