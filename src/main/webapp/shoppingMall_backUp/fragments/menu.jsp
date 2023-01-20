<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="dataSource" url="jdbc:mariadb://localhost:3306/sample" driver="org.mariadb.jdbc.Driver" user="kjh" password="9172"/>
<%
    String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
    <div class="container">
        <div class="navbar-header">
            <a href="../main/welcome.jsp" class="navbar-brand">Home</a>
        </div>
        <div>
            <ul class="navbar-nav mr-auto">
                <c:choose>
                    <c:when test="${empty sessionId}">
                        <li class="nav-item">
                            <a href="<c:url value="../member/loginMember.jsp"/>" class="nav-link">로그인</a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="../member/addMember.jsp"/>" class="nav-link">회원 가입</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li style="padding-top: 7px; color: white">[<%=sessionId%> 님]</li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="../member/logoutMember.jsp"/>">로그아웃</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="../member/updateMember.jsp"/>">회원 수정</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <li class="nav-item">
                    <a href="<c:url value="../shop/products.jsp"/>" class="nav-link">상품 목록</a>
                </li>

                <li class="nav-item">
                    <a href="<c:url value="../shop_db/cart.jsp"/>" class="nav-link">장바구니</a>
                </li>

                <li class="nav-item">
                    <a href="<c:url value="../board/BoardListAction.do?pageNum=1"/>" class="nav-link">게시판</a>
                </li>

            </ul>
        </div>
    </div>
</nav>