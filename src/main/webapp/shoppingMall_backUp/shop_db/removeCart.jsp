<%@ page import="com.example.jsp_study.market.daos.ProductRepository" %>
<%@ page import="com.example.jsp_study.market.dtos.ProductDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp_study.market.daos.CartDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int cartId = Integer.parseInt(request.getParameter("id"));

    String orderNo = session.getId();

    CartDao cartDao = new CartDao();
    cartDao.deleteProductByCartId(orderNo, cartId);

    response.sendRedirect("cart.jsp");


// 장바구니에서 상품을 개별 삭제 하기.
//    String id = request.getParameter("id");
//    if (id == null || id.trim().equals("")) {
//        response.sendRedirect("products.jsp");
//        return;
//    }
//
//    ProductRepository dao = ProductRepository.getInstance();
//    ProductDto product = dao.getProductById(id);
//
//    if (product == null) {
//        response.sendRedirect("exceptionNoProductId.jsp");
//    }
//
//    ArrayList<ProductDto> cartList = (ArrayList<ProductDto>) session.getAttribute("cartList");
//
//    cartList.remove(product);
//    for (ProductDto p : cartList) {
//        if (p.getProductId().equals(id)) {
//            cartList.remove(p);
//        }
//    }

//    response.sendRedirect("cart.jsp");
%>
