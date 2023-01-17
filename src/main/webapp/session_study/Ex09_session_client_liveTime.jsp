<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 10:38 AM
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
    세션 아이디와 웹 사이트에서 유지한 시간 출력하기.
    1) 고유한 세션 내장객체의 아이디를 가져오도록 session 내장 객체의 getId() 메서드 작성하기.
    2) 세션에 마지막으로 접근한 시간을 가져오도록 session 내장 객체의 getLastAccessedTime() 메서드 작성하기.
    3) 세션이 생성된 시간을 가져오도록 session 내장 객체의 getCreationTime() 메서드를 작성.
    4) 웹 사이트에 머문 시간을 계산하도록 작성.
--%>
<%
    String session_id = session.getId();    // 세션에 마지막으로 접근한 시간.
    long last_time = session.getLastAccessedTime();     //단위가 1 / 1000 초

    // 세션이 생성된 시간
    long start_time = session.getCreationTime();    //  단위가 1 / 1000초
    long used_time = (last_time - start_time) / 1000;

    out.println("세션 아이디 : " + session_id + "<br>");
    out.println("요청 시작 시간 : " + start_time + "<br>");
    out.println("요청 마지막 시간 : " + last_time + "<br>");
    out.println("웹 사이트에서 머물렀던 시간 : " + used_time + "<br>");

%>
</body>
</html>
