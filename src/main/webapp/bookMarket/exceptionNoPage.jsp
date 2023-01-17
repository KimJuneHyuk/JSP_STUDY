<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/27
  Time: 11:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>오류 페이지 :: 404 </title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="fragments/menu.jsp"/>
<%--<%@include file="fragments/menu.jsp"%>--%>
<div class="jumbotron">
  <div class="container">
    <h1 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h1>
  </div>
</div>

<div class="container">
  <p><%=request.getRequestURL()%></p>
  <p>
    <a href="bookProducts.jsp" class="btn btn-secondary"> 상품 등록 &raquo;</a>
  </p>
</div>

</body>
</html>
