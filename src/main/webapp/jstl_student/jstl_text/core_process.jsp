<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="dataSource" url="jdbc:mariadb://localhost:3306/sample" driver="org.mariadb.jdbc.Driver" user="kjh" password="9172"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    String score = request.getParameter("score");
//    out.println(score);
%>
<c:set var="score1" value="<%=score%>"/>
<c:out value="${score1}"/> 점입니다.



<c:if test="${score1 >= 60}"> 합격입니다.</c:if>
<c:if test="${score1 < 60}"> 불합격입니다.</c:if>
<br>

점수 <c:out value="${score1}"/>은
<c:choose>
    <c:when test="${score1 >= 90}"> A+</c:when>
    <c:when test="${score1 >= 80}"> B+</c:when>
    <c:when test="${score1 >= 70}"> C+</c:when>
    <c:when test="${score1 >= 60}"> D+</c:when>
    <c:otherwise>F 학점 입니다.</c:otherwise>
</c:choose>

</body>
</html>
