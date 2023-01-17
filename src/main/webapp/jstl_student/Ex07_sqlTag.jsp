<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/04
  Time: 12:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ㅏㅐ">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form action="Ex07_sqlTag_update.jsp" method="post">
    <h4>기존 아이디, 비밀번호를 이용하여 이름 바꾸기.</h4>
    <p>기존 아이디 : <input type="text" name="id"> </p>
    <p>기존 password : <input type="password" name="passwd"> </p>
    <p>기존 name : <input type="text" name="name"> </p>
    <p><input type="submit" value="전송"> </p>
</form>
</body>
</html>
