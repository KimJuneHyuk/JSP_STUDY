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
%>

<sql:update dataSource="${dataSource}" var="resultset">
  delete from `sample`.`member` where `id` = ? and `passwd` = ?
  <sql:param value="<%=id%>"/>
  <sql:param value="<%=passwd%>"/>
</sql:update>

<c:import var="url" url="Ex05_coreTag_sqlTag.jsp"/>
${url}


</body>
</html>
