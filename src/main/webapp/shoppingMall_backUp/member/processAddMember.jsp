<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/05
  Time: 9:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="dataSource" url="jdbc:mariadb://localhost:3306/WebMarketDB" driver="org.mariadb.jdbc.Driver" user="kjh" password="9172"/>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String year = request.getParameter("birthyy");
    String month = request.getParameterValues("birthmm")[0];
    String day = request.getParameter("birthdd");
    String birth = year + "/" + month + "/" + day;
    String mail1 = request.getParameter("mail1");
    String mail2 = request.getParameterValues("mail2")[0];
    String mail = mail1 + "@" + mail2;
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");


%>

<sql:update dataSource="${dataSource}" var="resultSet">
    insert into `WebMarketDB`.`members` values (?,?,?,?,?,?,?,?,NOW())
    <sql:param value="<%=id%>"/>
    <sql:param value="<%=password%>"/>
    <sql:param value="<%=name%>"/>
    <sql:param value="<%=gender%>"/>
    <sql:param value="<%=birth%>"/>
    <sql:param value="<%=mail%>"/>
    <sql:param value="<%=phone%>"/>
    <sql:param value="<%=address%>"/>
</sql:update>

<c:if test="${resultSet == 1}">
    <c:redirect url="resultMember.jsp?msg=1"/>
</c:if>


