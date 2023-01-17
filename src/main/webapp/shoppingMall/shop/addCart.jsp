<%@ page import="com.example.jsp_study.market.daos.ProductRepository" %>
<%@ page import="com.example.jsp_study.market.dtos.ProductDto" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 12:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String id = request.getParameter("id");
//    요청 된 id :: 값을 request.getParameter("id") 값으로 받음
    if (id == null || id.trim().equals("")) {
        response.sendRedirect("products.jsp");
        return;
    }

    ProductRepository dao = ProductRepository.getInstance();
//    객체 싱글턴으로 생성.

    ProductDto product = dao.getProductById(id);
//    객체 생성.
    if (product == null) {
//        해당 아이디로 검색을 했을 때, 상품으 존재하지 않을 경우 오류 페이지로 이동.
        response.sendRedirect("exceptionNoProductId.jsp");
    }

//    요청 파라미터 아이디의 상품을 담은 장바구니를 초기화 하도록 작성.
    ArrayList<ProductDto> list = (ArrayList<ProductDto>) session.getAttribute("cartList");
    if (list == null) {
        // 세션 값이 존재하지 않는다면, 추가하기.
        list = new ArrayList<>();
        session.setAttribute("cartList", list); // key(cartList) : value(list 해당 상품).
    }

    boolean status = false;
    for (ProductDto p : list) {
        if (p.getProductId().equals(id)) {
            p.setQuantity(p.getQuantity() + 1);
            status = true;
            break;
        }
    }
    if (!status) {
        product.setQuantity(1);
        list.add(product);
    }
    response.sendRedirect("product.jsp?id="+id);
%>
