<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 10:08 AM
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
    세션에 저장된 모든 세션 속성 삭제하기.
    1) 요청에 포함된 클라이언트의 세션이 유효하면 유효한 메세지를 출력하고, 그렇지 않으면 ㅠㅇ효하지 않은 메세지를 출력하도록 작성한다.
    2) 세션 저장된 모든 세션 속성을 삭제하도록 session 내장 객체의 invalidate() 메서드를 작성.
--%>
<p><h4>------세션을 삭제 전!!!!!!---------</h4></p>
<%
    String user_id = (String) session.getAttribute("userID");
    String user_pw = (String) session.getAttribute("userPW");

    out.println("설정된 세션 이름 userID : " + user_id +"<br>");
    out.println("설정된 세션 이름 userPW : " + user_pw +"<br>");

    if (request.isRequestedSessionIdValid() == true) {
        out.print("세션이 유효합니다.");
    } else {
        out.print("세션이 유효하지 않습니다.");
    }
    session.invalidate();
%>
<p><h4>------세션을 삭제 한 후---------</h4></p>
<%
    if (request.isRequestedSessionIdValid() == true) {
        out.print("세션이 유효");
    } else {
        out.print("세션 존재하지 않음.");
    }
%>

</body>
</html>
