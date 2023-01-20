<%@ page import="com.example.jsp_study.market.daos.ProductRepository" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp_study.market.dtos.ProductDto" %>
<%@page errorPage="../exceptions/exceptionNoProductId.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/27
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 목록 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../fragments/menu.jsp"/>
<%--<%@include file="fragments/menu.jsp"%>--%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">상품 목록</h1>
    </div>
</div>
<%
    ProductRepository dao = ProductRepository.getInstance();
    ArrayList<ProductDto> listOfProducts = dao.getAllProducts();
%>
<div class="container">
    <div class="row" align="center">
        <%@include file="../fragments/dbConn.jsp"%>

        <%
            String sql = "select * from `WebMarketDB`.`products`";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
        %>

<%--        <%--%>
<%--            for (int i = 0; i < listOfProducts.size(); i++) {--%>
<%--                ProductDto productDto = listOfProducts.get(i);--%>
<%--        %>--%>
        <div class="col-md-4">
            <img src="/shoppingMall/resources/images/<%=rs.getString("p_fileName")%>" alt="a" style="width: 100%">
<%--            <img src="${pageContext.request.contextPath}/resources/images/<%=productDto.getFilename()%>" alt="a" style="width: 100%">--%>
            <h3><%=rs.getString("p_name")%></h3>
            <p><%=rs.getString("p_description")%></p>
            <p><%=rs.getString("p_UnitPrice")%></p>
            <p><a href="product.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button">
                상세 정보 &raquo;
            </a></p>
        </div>
        <%
            }
            if (rs != null) {
                rs.close();
            }
            if(pstmt != null) {
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
</div>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>
