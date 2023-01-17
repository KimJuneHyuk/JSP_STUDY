<%@ page import="com.example.jsp_study.bookmarket.daos.BookRepository" %>
<%@ page import="com.example.jsp_study.bookmarket.dtos.BookDto" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/30
  Time: 9:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품 상세 정보</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script type="text/javascript">
        function addToCart() {
            if (confirm("상품을 장바구니에 추가 하시겠습니까?")) {
                document.addForm.submit();
            } else {
                document.addForm.reset();
            }
        }
    </script>
</head>
<body>
<jsp:include page="fragments/menu.jsp"/>
<%--<%@include file="fragments/menu.jsp"%>--%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">도서 상세 정보</h1>
    </div>
</div>

<%
    String id = request.getParameter("id");
    BookRepository dao = BookRepository.getInstance();
    BookDto book = dao.getBookById(id);
%>
<div class="container">
    <div class="row">
        <div class="col-md-5">
            <img src="/bookMarket/resources/images/<%=book.getFilename()%>" alt="a"
                 style="width: 100%">
        </div>
        <div class="col-md-6">
            <h3><%=book.getName()%>
            </h3>
            <p><%=book.getDescription()%>
            </p>
            <p><b>상품 코드 : </b> <span class="badge badge-danger"> <%=book.getBookId()%></span></p>
            <p><b>저 자 : </b> <%=book.getAuthor()%>
            </p>
            <p><b>출판사 : </b> <%=book.getPublisher()%>
            </p>
            <p><b>재고 수 : </b> <%=book.getUnitsInStock()%>
            </p>
            <h4><%=book.getUnitPrice()%>
            </h4>
            <p>
                <form action="./addCart.jsp?id=<%=book.getBookId()%>" method="post" name="addForm">
            <a href="#" class="btn btn-info" onclick="addToCart()">도서 주문 &raquo;</a>
            <a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
            <a href="./bookProducts.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
                </form>
            </p>
        </div>
    </div>
</div>

<jsp:include page="fragments/footer.jsp"/>
</body>
</html>
