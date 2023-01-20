<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp_study.market.dtos.ProductDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <%
        String cartId = session.getId();
    %>
    <title>장바구니</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="">

</head>
<body>
<jsp:include page="../fragments/menu.jsp"/>

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">장바구니</h1>
    </div>
</div>

<div class="container">
    <div class="row">
        <table width="100%">
            <tr>
                <td align="left">
<%--                    <a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn btn-danger">삭제하기</a>--%>
                    <span class="btn btn-danger" onclick="deleteCart();">전체 삭제</span>

                </td>
                <td align="right">
                    <a href="shippingInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기.</a>
                </td>
            </tr>
        </table>
    </div>

    <div style="padding-top: 50px">
        <table class="table table-hover">
            <tr>
                <th>상품</th>
                <th>가격</th>
                <th>수량</th>
                <th>소계</th>
                <th>비고</th>
            </tr>
            <%
                int sum = 0;
                ArrayList<ProductDto> cartList = (ArrayList<ProductDto>) session.getAttribute("cartList");
                if (cartList == null) {
                    cartList = new ArrayList<>();
                    session.setAttribute("cartList", cartList);
                }
                for (ProductDto CL : cartList) {
                    int total = CL.getUnitPrice() * CL.getQuantity();
                    sum = sum + total;
            %>
            <tr>
                <td><%=CL.getProductId()%> - <%=CL.getPname()%></td>
                <td><%=CL.getUnitPrice()%></td>
                <td><%=CL.getQuantity()%></td>
                <td><%=total%></td>
                <td>
<%--                    <a href="./removeCart.jsp?id=<%=CL.getProductId()%>" class="badge badge-danger">삭제</a>--%>
                    <span class="badge badge-danger btn" onclick="removeCartByID('<%=CL.getProductId()%>')">삭제</span>
                </td>
            </tr>
            <%
                }
            %>
            <tr>
                <th></th>
                <th></th>
                <th>총액</th>
                <th><%=sum%></th>
                <th></th>
            </tr>
        </table>
        <a href="products.jsp" class="btn btn-secondary"> &laquo; 계속 쇼핑하기.</a>
    </div>
</div>


<form name="removeForm" method="post">
    <input type="hidden" name="id">
</form>
<script type="text/javascript">
    const frm = document.removeForm;
    let removeCartByID = function (ID) {
        if (confirm('삭제 하시겠습니까?')) {
            frm.id.value = ID;
            frm.action = "removeCart.jsp";
            frm.submit();
        }
    }
    let deleteCart = function() {
        if (confirm('삭제 하시겠습니까 ?')) {
            frm.action = "deleteCart.jsp";
            frm.submit();
        }
    }
</script>

</body>
</html>
