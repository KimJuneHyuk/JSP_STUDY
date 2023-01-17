<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/04
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="num" value="${95}"/>
<c:out value="${num}"/>점 입니다.

<c:if test="${num > 60}"> 합격입니다.</c:if>
<br>

점수 <c:out value="${num}"/>은
<c:choose>
    <c:when test="${num >= 90}"> A+</c:when>
    <c:when test="${num >= 80}"> B+</c:when>
    <c:when test="${num >= 70}"> C+</c:when>
    <c:when test="${num >= 60}"> D+</c:when>
    <c:otherwise>F 학점 입니다.</c:otherwise>
</c:choose>




</body>
</html>
