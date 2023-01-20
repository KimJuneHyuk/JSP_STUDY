
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
%>

<%--<%@include file="../fragments/basic.jsp"%>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="dataSource"
                   url="jdbc:mariadb://localhost:3306/WebMarketDB"
                   driver="org.mariadb.jdbc.Driver"
                   user="kjh"
                   password="9172"/>

<sql:query dataSource="${dataSource}" var="resultSet">
    SELECT COUNT(0) AS `cnt` FROM `WebMarketDB`.`members` WHERE `id` = ?
    <sql:param value="<%=id%>"/>
</sql:query>
{"result" :
<c:forEach var="row" items="${resultSet.rows}">
    <c:choose>
        <c:when test="${row.cnt == 1}">
            "true"
        </c:when>
        <c:otherwise>
            "false"
        </c:otherwise>
    </c:choose>
</c:forEach>
}
