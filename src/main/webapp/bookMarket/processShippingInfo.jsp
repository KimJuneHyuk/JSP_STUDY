<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.nio.charset.Charset" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/30
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    // 한글이 깨지는 걸 방지하기 위해 URLEncoder.encode() 사용한다.
    Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
    Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), StandardCharsets.UTF_8));
    Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), StandardCharsets.UTF_8));
    Cookie country = new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"), StandardCharsets.UTF_8));
    Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), StandardCharsets.UTF_8));
    Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), StandardCharsets.UTF_8));


    // 쿠키의 유효기간은 24시간으로 변경하여 설정한다.
    cartId.setMaxAge(24 * 60 * 60);
    name.setMaxAge(24 * 60 * 60);
    zipCode.setMaxAge(24 * 60 * 60);
    country.setMaxAge(24 * 60 * 60);
    addressName.setMaxAge(24 * 60 * 60);


    // 쿠키를 등록하도록 response 내장 객체릐 addCookie() 메서드를 작성하여 쿠키를 전달
    response.addCookie(cartId);
    response.addCookie(name);
    response.addCookie(shippingDate);
    response.addCookie(country);
    response.addCookie(zipCode);
    response.addCookie(addressName);

    // 쿠키 생성 전달 까지 완성되면 전달 페이로 넘겨준다.
    response.sendRedirect("orderConfirmation.jsp");
%>
