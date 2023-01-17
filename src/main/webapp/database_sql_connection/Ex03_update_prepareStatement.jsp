<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h4>아이디 , 비밀번호 , 이름 수정하기.</h4>
<form action="Ex03_update_process.jsp" method="post">
    <p>아이디 : <input type="text" name="id"></p>
    <p>비밀번호 : <input type="password" name="password"></p>
    <p>이름 : <input type="text" name="name"></p>
    <p><input type="submit" value="등록"></p>
</form>

</body>
</html>
