<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp_study.market.daos.CartDao" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/10
  Time: 11:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    http://localhost:8080/shoppingMall/shop_db/deleteCartSel.jsp?id= & chkdID=18,19,20 & chkAll=on & chkID=18 & chkID=19 & chkID=20



    request.setCharacterEncoding("utf-8");
    CartDao cdao = new CartDao();




    String orderNum = session.getId();
    String[] chkIDs = request.getParameterValues("chkID");

    if (chkIDs != null) {
        for (String cid : chkIDs) {

            int a = Integer.parseInt(cid);

            cdao.deleteProductByCartId(orderNum, a);
        }
    }

    response.sendRedirect("cart.jsp");
%>
