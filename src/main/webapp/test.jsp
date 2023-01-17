<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/29
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String realPath = request.getServletContext().getRealPath("resources/images");
  out.println(realPath+ " <br>");

//    String realpath2nd = request.getServletContext().getRealPath("");
    int firstIndex = realPath.lastIndexOf("exploded"); // 해당 문자열이 시작되는 인덱스 찾기
    int lastIndex = realPath.lastIndexOf("-1.0-SNAPSHOT.war");
    String projectName = realPath.substring(firstIndex, lastIndex).replace("exploded", "");
    String targetPath = realPath.replace("build/libs/exploded" + projectName + "-1.0-SNAPSHOT.war", "src/main/webapp/shoppingMall");
    out.println(targetPath);
%>

</body>
</html>

