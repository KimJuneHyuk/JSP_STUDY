<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp_study.market.dtos.ProductDto" %>
<%@ page import="com.example.jsp_study.bookmarket.dtos.BookDto" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 12:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String cartId = session.getId();
    %>
    <title>도서 바구니</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>
<jsp:include page="fragments/menu.jsp"/>

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
                    <a href="./bookInfo.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기.</a>
                </td>
            </tr>
        </table>
    </div>

    <div style="padding-top: 50px">
        <table class="table table-hover">
            <tr>
                <th>도서</th>
                <th>가격</th>
                <th>수량</th>
                <th>소계</th>
                <th>비고</th>
            </tr>
            <%
                int sum = 0;
                ArrayList<BookDto> cartList = (ArrayList<BookDto>) session.getAttribute("cartList");
                if (cartList == null) {
                    cartList = new ArrayList<>();
                    session.setAttribute("cartList", cartList);
                }
                for (BookDto CL : cartList) {
                    int total = CL.getUnitPrice() * CL.getQuantity();
                    sum = sum + total;
            %>
            <tr>
                <td><%=CL.getBookId()%> - <%=CL.getName()%></td>
                <td><%=CL.getUnitPrice()%></td>
                <td><%=CL.getQuantity()%></td>
                <td><%=total%></td>
                <td>
                    <%--                    <a href="./removeCart.jsp?id=<%=CL.getProductId()%>" class="badge badge-danger">삭제</a>--%>
                    <span class="badge badge-danger btn" onclick="removeCartByID('<%=CL.getBookId()%>')">삭제</span>
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
        <a href="./bookProducts.jsp" class="btn btn-secondary"> &laquo; 계속 쇼핑하기.</a>
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
        if (confirm('전체 삭제 하시겠습니까 ?')) {
            frm.action = "deleteCart.jsp";
            frm.submit();
        }
    }
</script>

</body>
</html>
