<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/06
  Time: 10:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="dataSource"
                   url="jdbc:mariadb://localhost:3306/WebMarketDB"
                   driver="org.mariadb.jdbc.Driver"
                   user="kjh"
                   password="9172"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">