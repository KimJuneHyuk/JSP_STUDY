<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp_study.jstl_bean.BookBean" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/04
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    ArrayList<BookBean> bookList = new ArrayList<>();
    bookList.add(new BookBean("The secret", "Byrne, Rhonda", "Atria Books"));
    bookList.add(new BookBean("The Last lecture", "Randy Pausch", "hyperion"));

    String[] bookCode = {"소설", "역사", "인문", "정치", "미술", "종교", "여행", "과학", "만화", "건강"};
%>

<%--<c:set var="bookList" value="<%=bookList%>"/>--%>
<c:forEach items="${bookList}" var="item">
    ${item.title} / ${item.author} / ${item.publisher} <br>
</c:forEach>
<hr>
<br>

<c:set var="code" value="<%=bookCode%>"/>
<c:forEach var="item" items="${code}">
    <c:out value="${item}"/>
    <br>
</c:forEach>
<hr>
<br>

<c:forEach var="i" begin="2" end="9">
    <c:forEach var="j" begin="1" end="9">
        ${i} * ${j} = ${i * j}<br>
    </c:forEach>
        ======================= <br>
</c:forEach>
<hr>
<br>
<c:forEach var="k" begin="1" end="10" step="2">
    ${k}
</c:forEach>
</body>
</html>
