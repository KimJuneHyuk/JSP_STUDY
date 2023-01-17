<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/30
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

<jsp:include page="fragments/menu.jsp"/>

<div class="jumbotron" >
    <div class="container">
        <h1 class="display-3" align="center">주문 취소</h1>
    </div>
</div>

<div class="container">
    <h2 class="alert alert-danger">주문이 취소 되었습니다.</h2>
</div>
<div class="container">
    <p>
        <a href="./bookProducts.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>
    </p>
</div>


</body>
</html>
