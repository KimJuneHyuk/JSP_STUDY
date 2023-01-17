<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/04
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="dataSource" url="jdbc:mariadb://localhost:3306/sample" driver="org.mariadb.jdbc.Driver" user="kjh" password="9172"/>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%--
    sql:query :: 태그로 select 쿼리문 실행하기.
--%>
<%--member 테이블의 모든 필드 값 가져오기.--%>
<sql:query var="resultSet" dataSource="${dataSource}">
    select * from `sample`.`member`
</sql:query>

<table border="1">
    <tr>
<%--        select 문으로 가져온 필드 이름이 있을때 까지 반복 출력
            c:forEach 태그를 작성 하고, c:out 태그로 필드 이름 출력하기.
--%>
        <c:forEach var="columnName" items="${resultSet.columnNames}">
            <th width="100"><c:out value="${columnName}"/> </th>
        </c:forEach>
    </tr>

<%--    select 문으로 가져온 레코드가 있을때 까지  id, passwd, name 필드 값을 가져와 출력하도록 <c:forEach> 태그로 반복 실행하기.--%>
    <c:forEach var="row" items="${resultSet.rowsByIndex}">
        <tr>
            <c:forEach var="column" items="${row}" varStatus="i">
                <td>
                    <c:if test="${column != null}">
                        <c:out value="${column}"/>
                    </c:if>
                    <c:if test="${column == null}">
                        &nbsp;
                    </c:if>
                </td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>


</body>
</html>
