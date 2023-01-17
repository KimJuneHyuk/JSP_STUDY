<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/02
  Time: 11:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h4>아이디 , 비밀번호 , 인증을 이용한 데이터 삭제하기.</h4>
<form action="Ex02_delete_process.jsp" method="post">
    <p>기존 아이디 : <input type="text" name="id"></p>
    <p>기존 비밀번호 : <input type="password" name="password"></p>
    <p><input type="submit" value="전송."></p>
</form>

</body>
</html>
