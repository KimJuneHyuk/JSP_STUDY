<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 12:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<form action="test02_insert_process.jsp" method="post">
    <p>학번 : <input type="text" name="num"></p>
    <p>학과 : <input type="text" name="depart"></p>
    <p>이름 : <input type="text" name="name"></p>
    <p>주소 : <input type="text" name="address"></p>
    <p>연락처 : <input type="text" name="phone"></p>
    <p><input type="submit" value="등록"></p>
</form>

</body>
</html>
