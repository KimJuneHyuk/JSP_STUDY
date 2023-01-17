<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/27
  Time: 11:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script defer src="../resources/scripts/validation.js"></script>
</head>
<body>
<jsp:include page="../fragments/menu.jsp"/>
<%--<%@include file="fragments/menu.jsp"%>--%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">상품 등록</h1>
    </div>
</div>

<div class="container">
    <div class="text-right">
        <a href="../logout.jsp" class="btn btn-sm btn-success pull-right">Logout</a>
    </div>
    <form action="processAddProduct.jsp" method="post" id="form" name="newProduct" class="form-horizontal" enctype="multipart/form-data">
        <div class="form-group row">
            <label class="col-sm-2">상품 코드</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="productId">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">상품 이름</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="pname">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">상품 가격</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="unitPrice">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">상세 정보</label>
            <div class="col-sm-5">
                <textarea cols="50" rows="2" class="form-control" name="description"></textarea>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">상품 제조사</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="manufacturer">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">상품 분류</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="category">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">재고 수량</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="unitsInStock">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">상품 상태</label>
            <div class="col-sm-5">
                <input type="radio" name="condition" value="New"> 새상품
                <input type="radio" name="condition" value="Old"> 중고 상품
                <input type="radio" name="condition" value="Refurbished"> 재활용 상품
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">상품 이미지</label>
            <div class="col-sm-5">
                <input type="file" class="form-control" name="productImage">
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10">
<%--                <input type="submit" class="btn btn-primary" value="등록">--%>
                <input type="button" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
            </div>
        </div>


    </form>
</div>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>
