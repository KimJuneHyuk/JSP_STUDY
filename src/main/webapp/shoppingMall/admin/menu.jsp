<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/06
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../fragments/basic.jsp"%>
<%
    String sessionAdminId = (String) session.getAttribute("sessionAdminId");
    String sessionAdminName = (String) session.getAttribute("sessionAdminName");
    if (sessionAdminId == null) {
        response.sendRedirect("./loginAdmin.jsp");
    }
%>

<nav class="navbar navbar-expand navbar-dark bg-dark">
    <div class="container">
        <div class="navbar-header">
            <a href="../main/welcome.jsp" class="navbar-brand">Home</a>
        </div>
        <div>
            <ul class="navbar-nav mr-auto">
                <li style="padding-top: 7px; color: white" > [<%=sessionAdminName%>]</li>
                <li class="nav-item">
                    <a href="<c:url value="./logoutAdmin.jsp"/> " class="nav-link">로그아웃</a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="./updateAdmin.jsp"/> " class="nav-link">정보 수정</a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="./memberList.jsp"/> " class="nav-link">회원 목록</a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="./addProduct.jsp"/> " class="nav-link">상품 추가</a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="./editProduct.jsp?edit=update"/> " class="nav-link">상품 수정</a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value="./editProduct.jsp?edit=delete"/> " class="nav-link">상품 삭제</a>
                </li>
            </ul>
        </div>
    </div>
</nav>