<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/04
  Time: 12:10 PM
  To change this template use File | Settings | File Templates.
--%>
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

    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    String name = request.getParameter("name");
%>

<sql:update dataSource="${dataSource}" var="resultset">
    insert into `sample`.`member` ( `id`, `name`, `passwd`) values ( ?,?,? )
    <sql:param value="<%=id%>"/>
    <sql:param value="<%=name%>"/>
    <sql:param value="<%=passwd%>"/>
</sql:update>

<c:import var="url" url="Ex06_sqlTag.jsp"/>
${url}


</body>
</html>
