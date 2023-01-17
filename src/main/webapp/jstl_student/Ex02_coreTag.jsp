<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/04
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--
  웹 브라우저 헤더를 변수에 저장하고, 설정한 변수를 삭제하기
  1) 브라우저 browser 변수에 변수 값으로 header['User-Agent']를 설정하도록 <c:set> 태그를 작성.
  1) 브라우저 browser 변수 값을 출력하도록 c:out 태그 작성
  1) 브라우저 browser 변수 값을 삭제 하도록 c:remove
  1) 브라우저 browser 변수 값을 출력하도록 c:out
--%>
browser 변수 값 설정.
<c:set var="browser" value="${header['User-Agent']}"/>
<hr>
<br>
<c:out value="${browser}"/>
<p>browser 변수 값 제거 후.</p>
<c:remove var="browser"/>
<c:out value="${browser}"></c:out>불

</body>
</html>
