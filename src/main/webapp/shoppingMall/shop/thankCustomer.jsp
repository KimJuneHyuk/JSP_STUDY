<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/30
  Time: 12:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String cartId = session.getId();

    String shipping_cartId = "Shipping_cartId";
    String shipping_name = "Shipping_name";
    String shipping_shippingDate = "Shipping_shippingDate";
    String shipping_country = "Shipping_country";
    String shipping_zipCode = "Shipping_zipCode";
    String shipping_addressName = "Shipping_addressName";


    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie c : cookies) {

            String n = c.getName();
            String v = c.getValue();
            Charset ch = StandardCharsets.UTF_8;

            if (n.equals(shipping_cartId)) {
                shipping_cartId = URLDecoder.decode(v, ch);
            }

            if (n.equals(shipping_shippingDate)) {
                shipping_shippingDate = URLDecoder.decode(v, ch);
            }
        }
    }
%>

<jsp:include page="../fragments/menu.jsp"/>

<div class="jumbotron" >
    <div class="container">
        <h1 class="display-3" align="center">주문 완료</h1>
    </div>
</div>

<div class="container">
    <h2 class="alert alert-danger">주문해주셔서 감사합니다</h2>
    <p> 주 문 : <% out.println(shipping_shippingDate); %> 에 배송 시작 될 예정 입니다.</p>
    <p> 주 문 번 호 : <%out.println(shipping_cartId); %></p>
</div>

<div class="container">
    <p>
        <a href="./products.jsp" class="btn btn-secondary"> &raquo; 상품 목록 </a>
    </p>
</div>

</body>
</html>
<%
    session.invalidate();

    for (Cookie c : cookies) {
        String n = c.getName();
        if (n.equals(shipping_cartId)) {
            c.setMaxAge(0);
        }
        if (n.equals(shipping_name)) {
            c.setMaxAge(0);
        }
        if (n.equals(shipping_shippingDate)) {
            c.setMaxAge(0);
        }
        if (n.equals(shipping_country)) {
            c.setMaxAge(0);
        }
        if (n.equals(shipping_zipCode)) {
            c.setMaxAge(0);
        }
        if (n.equals(shipping_addressName)) {
            c.setMaxAge(0);
        }
    }
%>