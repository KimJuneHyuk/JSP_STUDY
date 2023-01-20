<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/18
  Time: 9:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디 중복 확인</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
%>

<%@include file="../fragments/basic.jsp"%>

<sql:query dataSource="${dataSource}" var="resultSet">
    SELECT COUNT(0) AS `cnt` FROM `WebMarketDB`.`members` WHERE `id` = ?
    <sql:param value="<%=id%>"/>
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
    <c:choose>
        <c:when test="${row.cnt == 1}">
            동일한 아이디가 존재합니다.
        </c:when>
        <c:otherwise>
            사용가능한 아이디 입니다.
        </c:otherwise>
    </c:choose>
</c:forEach>
</body>
</html>
