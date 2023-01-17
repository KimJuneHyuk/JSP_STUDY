<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 9:24 AM
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
    세션에 저장된 세션 속성 값 가져와 출력하기
    1) 세션에 저장된 세션 속성 이름 userID, userPW 의 속성 값을 가져오도록 session내장 객체의 getAttribute() 메서드를 작성하기
--%>

<%
    String user_id = (String) session.getAttribute("userID");
    String user_pw = (String) session.getAttribute("userPW");

    out.println("설정된 세션의 속성 값 [1] : " + user_id + "<br>");
    out.println("설정된 세션의 속성 값 [2] : " + user_pw + "<br>");
%>
</body>
</html>
