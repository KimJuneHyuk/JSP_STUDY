<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/28
  Time: 11:08 AM
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
    쿠키 객체에 저장된 모든 쿠키 값을 가져와 출력해보기
    1) 쿠키 정보를 얻어오도록 request 내장 객체의 getCokkies() 메서드 작성한다.
    2) 얻어온 쿠키 정보의 개수를 출력하도록 Cookie 객체의 length를 작성한다.
    3) 얻어온 쿠키 정보에서 쿠키 이름과 값을 하나씩 출력하도록 Cookie 객체의 getName(), getValue() 메서드를 작성한다.
--%>
<%
    boolean isLogin = false;
    Cookie[] cookies = request.getCookies();
    for (int i = 0; i < cookies.length; i++) {
        out.println("현재 설정된 쿠키의 개수 ::" + cookies.length + "<br>" ) ;
        out.println("설정된 쿠키의 속성 이름 [ " + i + " ] :: " + cookies[i].getName() + " <br> ");
        out.println("설정된 쿠키의 속성 값 [ " + i + " ] :: " + cookies[i].getValue() + " <br> ");
        out.println("================================== <br>");
        if (cookies[i].getName().equals("userID") && cookies[i].getValue() != null) {
            isLogin = true;
        }
    }
    out.print("##  " + isLogin + " ## <br>");
    if (isLogin) {
        out.print("로그인 중입니다.");
    } else {
        out.print("로그인 상태가 아닙니다.");
    }
%>

</body>
</html>
