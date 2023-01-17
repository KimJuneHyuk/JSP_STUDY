<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp_study.market.dtos.ProductDto" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/30
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
            if (n.equals(shipping_name)) {
                shipping_name = URLDecoder.decode(v, ch);
            }
            if (n.equals(shipping_shippingDate)) {
                shipping_shippingDate = URLDecoder.decode(v, ch);
            }
            if (n.equals(shipping_country)) {
                shipping_country = URLDecoder.decode(v, ch);
            }
            if (n.equals(shipping_zipCode)) {
                shipping_zipCode = URLDecoder.decode(v, ch);
            }
            if (n.equals(shipping_addressName)) {
                shipping_addressName = URLDecoder.decode(v, ch);
            }
        }
    }
%>
<html>
<head>

    <title>주문 정보</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../fragments/menu.jsp"/>

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">주문 정보</h1>
    </div>
</div>

<div class="container col-8 alert alert-info">
    <div class="text-center">
        <h1>영수증</h1>
    </div>

    <div class="row justify-content-between">
        <div class="col-4" align="left">
            <strong>베송 주소</strong>
            <p> 성 명 : <% out.println(shipping_name); %></p>
            <p> 우편번호 : <% out.println(shipping_zipCode); %></p>
            <p> 주 소 : <% out.println(shipping_addressName); %></p>
        </div>

        <div class="col-4" align="right">
            <p><em>배송일 : <% out.println(shipping_shippingDate); %></em></p>
        </div>
    </div>

    <div>
        <table class="table table-hover">
            <tr>
                <th class="text-center">상품</th>
                <th class="text-center">수량</th>
                <th class="text-center">가격</th>
                <th class="text-center">소계</th>
            </tr>
            <%
                int sum = 0;
                ArrayList<ProductDto> cartList = (ArrayList<ProductDto>) session.getAttribute("cartList");
                if (cartList == null) {
                    cartList = new ArrayList<>();
                }
                for (ProductDto productDto : cartList) {
                    int total = productDto.getUnitPrice() * productDto.getQuantity();

                    sum = sum + total;
            %>
            <tr>
                <td class="text-center"><em><%=productDto.getPname()%></em></td>
                <td class="text-center"><%=productDto.getQuantity()%></td>
                <td class="text-center"><%=productDto.getUnitPrice()%></td>
                <td class="text-center"><%=total%></td>
            </tr>
            <%
                }
            %>

            <tr>
                <td></td>
                <td></td>
                <td class="text-right">
                    <strong>총 액 : </strong>
                </td>
                <td class="text-center text-danger">
                    <strong><%=sum%></strong>
                </td>
            </tr>
        </table>

        <a href="shippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" role="button">이전</a>
        <a href="thankCustomer.jsp" class="btn btn-success" role="button" > 주문 완료</a>
        <a href="checkOutCancelled.jsp" class="btn btn-secondary" role="button" >취 소</a>
    </div>
</div>

</body>
</html>
