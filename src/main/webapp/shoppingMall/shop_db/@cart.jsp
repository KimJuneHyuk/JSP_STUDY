<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp_study.market.dtos.ProductDto" %>
<%@ page import="com.example.jsp_study.market.daos.CartDao" %>
<%@ page import="com.example.jsp_study.market.dtos.CartDto" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 12:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <%--%>
<%--        String cartId = session.getId();--%>

<%--    %>--%>
    <%--    <div><%=sessionID%></div>--%>
    <title>장바구니</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <script src="./cart.js"></script>
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
                    <span class="btn btn-danger" onclick="deleteCartSel();">선택 상품 삭제</span>
                </td>
                <td align="right">
                    <a href="../shop/shippingInfo.jsp?cartId=${cartId}" class="btn btn-success">주문하기.</a>
                </td>
            </tr>
        </table>
    </div>

    <div style="padding-top: 50px">
        <form name="frmCart" method="get">
            <input type="hidden" name="id">
            <input type="text" name="chkdID">

            <table class="table table-hover">
                <tr>
                    <th>
                        <input type="checkbox" name="chkAll" onclick="setChkAll();"> 상품
                    </th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>소계</th>
                    <th>비고</th>
                </tr>
<%--                <%--%>
<%--                    int sum = 0;--%>
<%--                    CartDao cartDao = new CartDao();--%>

<%--                    String orderNo = session.getId();--%>
<%--                    ArrayList<CartDto> cartDtoArrayList = null;--%>
<%--                    try {--%>
<%--                        cartDtoArrayList = cartDao.getCartList(orderNo);--%>

<%--                    } catch (SQLException e) {--%>
<%--                        throw new RuntimeException(e);--%>
<%--                    }--%>

<%--                    for (CartDto cart : cartDtoArrayList) {--%>
<%--                        int total = cart.getpUnitPrice() * cart.getpQuantity();--%>
<%--                        sum += total;--%>

<%--//                ArrayList<ProductDto> cartList = (ArrayList<ProductDto>) session.getAttribute("cartList");--%>
<%--//                if (cartList == null) {--%>
<%--//                    cartList = new ArrayList<>();--%>
<%--//                    session.setAttribute("cartList", cartList);--%>
<%--//                }--%>
<%--//                for (ProductDto CL : cartList) {--%>
<%--//                    int total = CL.getUnitPrice() * CL.getQuantity();--%>
<%--//                    sum = sum + total;--%>
<%--                %>--%>
                <%
                    int sum = 0;

                    ArrayList<CartDto> cartList = (ArrayList<CartDto>) request.getAttribute("carts");
                    for (CartDto cart : cartList) {
                        int total = cart.getpUnitPrice() * cart.getpQuantity();

                %>
                <tr>
                    <td>
                        <input type="checkbox" name="chkID" value="<%=cart.getCartId()%>"
                               onclick="setChkAlone(this);"> <%=cart.getpId()%> - <%=cart.getpName()%>
                    </td>
                    <td><%=cart.getpUnitPrice()%>
                    </td>
                    <td><%=cart.getpQuantity()%>
                    </td>
                    <td><%=total%>
                    </td>
                    <td>
                        <%--                    <a href="./removeCart.jsp?id=<%=CL.getProductId()%>" class="badge badge-danger">삭제</a>--%>
                        <span class="badge badge-danger btn" onclick="removeCartByID('<%=cart.getCartId()%>')">삭제</span>
                    </td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <th></th>
                    <th></th>
                    <th>총액</th>
                    <th><%=sum%>
                    </th>
                    <th></th>
                </tr>
            </table>
            <a href="products.jsp" class="btn btn-secondary"> &laquo; 계속 쇼핑하기.</a>
        </form>
    </div>
</div>


<script>
    window.onload = function () {
        document.frmCart.chkAll.checked = true; //전체 선택 체크 박스 체크
        setChkAll(); // 목록 체크 박스 체크
    }

    function frmName() {
        return document.frmCart;
    }
</script>

<script type="text/javascript">
    const frm = document.frmCart;
    let removeCartByID = function (ID) {
        if (confirm('해당 상품을 삭제 하시겠습니까?')) {
            // frm.id.value = ID;
            // frm.action = "removeCart.jsp";
            // frm.submit();
            location.href = 'removeCart.jsp?id=' + ID;
        }
    }

    let deleteCartSel = function () {
        if (confirm('선택한 상품을 삭제하시겠습니까?')) {
            frm.action = "deleteCartSel.jsp";
            frm.submit();
        }
    }


    let deleteCart = function () {
        if (confirm('전체 삭제 하시겠습니까 ?')) {
            frm.action = "deleteCart.jsp";
            frm.submit();
        }
    }
</script>

</body>
</html>
