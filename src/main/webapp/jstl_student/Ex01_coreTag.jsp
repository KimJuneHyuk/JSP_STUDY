<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/04
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.example.jsp_study.jstl_bean.BookBean" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:set var="name" value="Amy"/>
    <c:out value="${name}"/> <br>

    <c:remove var="name"/>
    <c:out value="${name}"/> <br>

    <hr>
    <br>
<%
    BookBean bookBean = new BookBean("The secret", "Byrne, Rhonda", "Atria Books");
    request.setAttribute("bookOne", bookBean);
%>
    <c:set var="title" value="${bookOne.title}"/>
    <c:out value="${title}"/> <br>

    <c:set var="author" value="<%=bookBean.getAuthor()%>"/>
    <c:out value="${author}"/> <br>

    <c:set var="publisher"><%=bookBean.getPublisher()%></c:set>
    <c:out value="${publisher}"/>

    <hr>
    <br>

    <c:set var="name">Tobey</c:set>
    <c:out value="${name}"/> <br>

<%
    BookBean bookBean1 = new BookBean("The Last Lecture", "Randay Pausch", "hyperion");
    request.setAttribute("bookTwo", bookBean1);
%>
    <c:set var="title">${bookTwo.title}</c:set>
    <c:out value="${title}"/> <br>

    <c:set var="author" value="<%=bookBean1.getAuthor()%>"/>
    <c:out value="${author}"/> <br>

    <c:set var="publisher" value="${bookTwo.publisher}"/>
    <c:out value="${publisher}"/> <br>

</body>
</html>
