<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/05
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="dataSource"
                   url="jdbc:mariadb://localhost:3306/WebMarketDB"
                   driver="org.mariadb.jdbc.Driver"
                   user="kjh" password="9172"/>
<%
    String sessionId = (String) session.getAttribute("sessionId");
%>

<sql:update dataSource="${dataSource}" var="resultSet">
    delete from `WebMarketDB`.`members` where `id`= ?
    <sql:param value="<%=sessionId%>"/>
</sql:update>

<c:if test="${resultSet >= 1}">
    <c:import var="url" url="logoutMember.jsp" />
    <c:redirect url="resultMember.jsp"/>
</c:if>

