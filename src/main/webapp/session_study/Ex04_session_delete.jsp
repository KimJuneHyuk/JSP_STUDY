<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <p><h4>-------세션 삭제 전--------</h4></p>
<%--
    세션에 저장된 세션 속성 삭제하기.
    1) 세션에 저장된 세션 속성 이름 userID를 삭제하도록 session 내장 객체의 removeAttribute() 메서드 작성.
--%>
<%
        String user_id = (String) session.getAttribute("userID");
        String user_pw = (String) session.getAttribute("userPW");
        out.println("설정된 세션 userID : " + user_id + "<br>");
        out.println("설정된 세션 userPW : " + user_pw + "<br>");

        session.removeAttribute("userID");
%>
<p><h4>--------- 세션 삭제 후 ---------</h4></p>
<%
    user_id = (String) session.getAttribute("userID");
    user_pw = (String) session.getAttribute("userPW");

    out.println("설정된 세션 userID : " + user_id + "<br>");
    out.println("설정된 세션 userPW : " + user_pw + "<br>");
%>
</body>
</html>
