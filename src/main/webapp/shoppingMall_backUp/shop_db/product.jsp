<%@ page import="com.example.jsp_study.market.daos.ProductRepository" %>
<%@ page import="com.example.jsp_study.market.dtos.ProductDto" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/27
  Time: 10:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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
<jsp:include page="../fragments/menu.jsp"/>

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">상품 목록</h1>
    </div>
</div>

<%--<%--%>
<%--    String id = request.getParameter("id");--%>
<%--    ProductRepository dao = ProductRepository.getInstance();--%>
<%--    ProductDto product = dao.getProductById(id);--%>
<%--%>--%>

<%@include file="../fragments/dbConn.jsp"%>
<%
    String productId = request.getParameter("id");

    String sql  = "select * from `WebMarketDB`.`products` where p_id  = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,productId);
    rs=pstmt.executeQuery();
    if (rs.next()) {
%>

<div class="container">
    <div class="row">
        <div class="col-md-5">
            <img src="/shoppingMall/resources/images/<%=rs.getString("p_fileName")%>" alt="a" style="width: 100%">
        </div>
        <div class="col-md-6">
            <h3><%=rs.getString("p_id")%>
            </h3>
            <p><%=rs.getString("p_description")%>
            </p>
            <p><b>상품 코드 : </b> <span class="badge badge-danger"><%=rs.getString("p_id")%></span></p>
            <p><b>상품 제조사 : </b> <%=rs.getString("p_manufacturer")%>
            </p>
<%--            <p><b>상품 분류 : </b> <%=product.getCategory()%>--%>
            <p><b>상품 분류 : </b> <%=rs.getString("p_category")%>
            </p>
<%--            <p><b>상품 재고 수량 : </b> <%=product.getUnitsInStock()%>--%>
            <p><b>상품 재고 수량 : </b> <%=rs.getString("p_unitsInStock")%>
            </p>
<%--            <p><b>상품 가격 : </b> <%=product.getUnitPrice()%>--%>
            <p><b>상품 가격 : </b> <%=rs.getString("p_unitPrice")%>
            </p>
            <p>
                <form name="addForm" action="addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
                    <a href="#" class="btn btn-info" onclick="addToCart()"> 상품주문 &raquo;</a>
                    <a href="cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
                    <a href="products.jsp" class="btn btn-secondary"> 돌아가기 &raquo;</a>
                </form>
            </p>
        </div>
    </div>
    <%
        }
        if (rs != null) {
            rs.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    %>
</div>
<br>
<hr>
<br>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>
