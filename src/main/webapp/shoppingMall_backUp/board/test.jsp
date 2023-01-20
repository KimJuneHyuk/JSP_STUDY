<%@ page import="com.example.jsp_study.market.mvc.models.daos.BoardDao" %>
<%@ page import="com.example.jsp_study.market.mvc.models.dtos.BoardDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/18
  Time: 11:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("utf-8");

  for (int i = 100; i < 150; i++) {
    BoardDao dao = BoardDao.getInstance();

    BoardDto board = new BoardDto();
    board.setId("test1");
    board.setName(i +"번쨰 test1");
    board.setSubject(i + "번째 제목");
    board.setContent("ㅁㅇㄴ라ㅗㅓ몬ㅇ라ㅓㅗㅁㅇㄴ라ㅓㅗㅁㄴㅇ라ㅗㄴㅇ리ㅗ");

    SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
    String regist_day = formatter.format(new Date());

    board.setHit(0);
    board.setRegistDay(regist_day);
    board.setIp(request.getRemoteAddr());

    dao.insertBoard(board);
  }
  out.print("완료");
%>
</body>
</html>
