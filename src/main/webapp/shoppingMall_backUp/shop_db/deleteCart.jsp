<%@ page import="com.example.jsp_study.market.daos.CartDao" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/30
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%


    String orderNo = session.getId();
    String sessionId = (String) session.getAttribute("sessionId");
    CartDao cartDao = new CartDao();

    cartDao.deleteAllCart(orderNo, sessionId);


//    session.invalidate();
    response.sendRedirect("cart.jsp");

%>
