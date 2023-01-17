<%@ page import="com.example.jsp_study.market.daos.ProductRepository" %>
<%@ page import="com.example.jsp_study.market.dtos.ProductDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp_study.bookmarket.daos.BookRepository" %>
<%@ page import="com.example.jsp_study.bookmarket.dtos.BookDto" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 장바구니에서 상품을 개별 삭제 하기.
    String id = request.getParameter("id");
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("bookProducts.jsp");
        return;
    }

    BookRepository dao = BookRepository.getInstance();
    BookDto product = dao.getBookById(id);

    if (product == null) {
        response.sendRedirect("exceptionNoBookId.jsp");
    }

    ArrayList<BookDto> cartList = (ArrayList<BookDto>) session.getAttribute("cartList");

    cartList.remove(product);
//    for (ProductDto p : cartList) {
//        if (p.getProductId().equals(id)) {
//            cartList.remove(p);
//        }
//    }

    response.sendRedirect("cart.jsp");
%>
