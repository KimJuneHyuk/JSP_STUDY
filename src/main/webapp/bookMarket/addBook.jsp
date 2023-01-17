<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/30
  Time: 9:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script defer src="./resources/scripts/validation.js"></script>
</head>
<body>
<jsp:include page="fragments/menu.jsp"/>
<%--<%@include file="fragments/menu.jsp"%>--%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">도서 상세 정보</h1>
    </div>
</div>

<div class="container">
    <div class="text-right">
        <a href="logout.jsp" class="btn btn-sm btn-success pull-right">Logout</a>
    </div>
    <form action="./processAddBook" class="form=horizontal" id="newBook" name="newBook" method="post">
        <div class="form-group row">
            <label class="col-sm-2">도서 코드</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="bookId">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">도서 명</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="name">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">가격</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="unitPrice">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">저 자</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="author">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">상세 설명</label>
            <div class="col-sm-3">
                <textarea name="description" cols="50" rows="2" class="form-control"></textarea>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">출판사</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="publisher">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">분 류</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="category">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">출간일자</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="releaseDate">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">재고 수량</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="unitsInStock">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">페이지 수</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="totalPages">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">도서 상태</label>
            <div class="col-sm-5">
                <input type="radio" name="condition" value="New"> 신규 도서
                <input type="radio" name="condition" value="Old"> 중고 도서
                <input type="radio" name="condition" value="Refurbished"> e-book
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">이미지</label>
            <div class="col-sm-5">
                <input type="file" class="form-control" name="productImage">
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="submit" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
            </div>
        </div>
    </form>
</div>

<jsp:include page="fragments/footer.jsp"/>
</body>
</html>
