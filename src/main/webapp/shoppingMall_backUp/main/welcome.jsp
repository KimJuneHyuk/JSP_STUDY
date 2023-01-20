<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/27
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
<%--    부트스트랩 링크.   --%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<%--  header, footer 처럼 공통적으로 사용되는 웹 html 경우 include 로 필요한 파일을 불러와 사용가능하다.  --%>
<%@include file="../fragments/menu.jsp"%>

<%!
    String greeting = "웹 쇼핑몰에 오신것을 환영합니다.";
    String tagline = "Welcome to Web Market";
%>

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            <%=greeting%>
        </h1>
    </div>
</div>

<div class="container">
    <div class="text-center">
        <h3>
            <%=tagline%>
        </h3>
        <%
            Date day = new Date();
            String am_pm;
            
            int hour = day.getHours();
            int minute = day.getMinutes();
            int second = day.getSeconds();
            
            if (hour/12 == 0) {
                am_pm = "AM";
            } else {
                am_pm = "PM";
            }
            
            String CT = hour + " : " + minute + " " + am_pm;
            out.println("현재 접속 시간 : " + CT);
        %>
    </div>
</div>

<br>
<hr>

<%@include file="../fragments/footer.jsp"%>
</body>
</html>
