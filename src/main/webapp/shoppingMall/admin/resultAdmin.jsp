<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/05
  Time: 10:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 정보</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="./menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">회원 정보</h1>
    </div>
</div>

<div class="container" align="center">
    <%
        String msg = request.getParameter("msg");

        if (msg != null) {
            if (msg.equals("0")) {
                out.println("<h2 class='alert alert-danger'>회원정보가 수정 되었습니다.</h2>");
            } else if (msg.equals("1")) {
                out.println("<h2 class='alert alert-success'>회원 가입을 축하드립니다.</h2>");
            } else if (msg.equals("2")) {
                String loginId = (String) session.getAttribute("sessionId");
                out.println("<h2 class='alert alert-success'>"+ loginId +" 님 환영합니다.</h2>");
            }
        } else {
            out.println("<h2 class='alert alert-danger'>회원정보가 삭제 되었습니다..</h2>");
        }
    %>
</div>

<jsp:include page="../fragments/footer.jsp"/>

</body>
</html>
