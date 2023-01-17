
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../fragments/basic.jsp"%>
<%@include file="../fragments/dbConn.jsp"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <%
        String sessionAdminId = (String) session.getAttribute("sessionAdminId");
        out.print(sessionAdminId);

        String sql = "select * from `WebMarketDB`.`admin` where `id` = ?";
    %>
    <title>회원 정보 수정</title>
    <sql:query dataSource="${dataSource}" var="resultSet">
        select * from `WebMarketDB`.`admin` where `id` = ?
        <sql:param value="<%=sessionAdminId%>"/>
    </sql:query>
</head>
<body onload="init()">

<jsp:include page="./menu.jsp"/>

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">회원 정보 수정</h1>
    </div>
</div>

<c:forEach var="row" items="${resultSet.rows}">
    <c:set var="id" value="${row.id}"/>
    <c:set var="password" value="${row.password}"/>
    <c:set var="name" value="${row.name}"/>
    <c:set var="day" value="${row.lately_login_day}"/>



    <div class="container">
        <form name="newMember" class="form-horizontal" action="processUpdateAdmin.jsp" method="post"
              onsubmit="return checkForm()">
            <div class="form-group  row">
                <label class="col-sm-2 ">아이디</label>
                <div class="col-sm-3">
                    <input name="id" type="text" class="form-control" placeholder="id"
                           value="<c:out value="${row.id}"/>" readonly>
                </div>
            </div>
            <div class="form-group  row">
                <label class="col-sm-2">비밀번호</label>
                <div class="col-sm-3">
                    <input name="password" type="password" class="form-control" placeholder="password"
                           value="<c:out value="${row.password}"/>">
                </div>
            </div>

            <div class="form-group  row">
                <label class="col-sm-2">비밀번호확인</label>
                <div class="col-sm-3">
                    <input name="password_confirm" type="text" class="form-control" placeholder="password confirm">
                </div>
            </div>

            <div class="form-group  row">
                <label class="col-sm-2">변경할 비밀번호</label>
                <div class="col-sm-3">
                    <input name="newPassword" id="newPassword" type="password" class="form-control" placeholder="password">
                </div>
            </div>

            <div class="form-group  row">
                <label class="col-sm-2">이름</label>
                <div class="col-sm-3">
                    <input name="name" type="text" class="form-control" placeholder="name" value="<c:out value="${row.name}"/>" >
                </div>
            </div>
            <div class="form-group  row">
                <label class="col-sm-2">접속 시간</label>
                <div class="col-sm-3">
                    <input name="time" type="text" class="form-control" placeholder="time" readonly
                           value="<c:out value="${row.lately_login_day}"/>">
                </div>
            </div>

            <div class="form-group  row">
                <div class="col-sm-offset-2 col-sm-10 ">
                    <input type="submit" class="btn btn-primary " value="회원 정보 수정 ">
                    <input type="reset" class="btn btn-primary " value="돌아가기." onclick="reset()">
                </div>
            </div>

        </form>
    </div>
</c:forEach>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>
<script type="text/javascript">

    function reset() {
        window.history.back();
    }
<%--    function init() {--%>
<%--        setComboMailValue("${mail2}");--%>
<%--        setComboBirthValue("${month}");--%>
<%--    }--%>

<%--    function setComboMailValue(val) {--%>
<%--        var selectMail = document.newMember.mail2;--%>
<%--        for (i = 0, j = selectMail.length; i < j; i++) {--%>
<%--            if (selectMail.options[i].value === val) {--%>
<%--                selectMail.options[i].selected = true;--%>
<%--                break;--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>
<%--    function setComboBirthValue(val) {--%>
<%--        var selectBirth = document.newMember.birthmm;--%>
<%--        for ( i = 0, j = selectBirth.length; i < j; i++) {--%>
<%--            if (selectBirth.options[i].value === val) {--%>
<%--                selectBirth.options[i].selected = true;--%>
<%--                break;--%>
<%--            }--%>
<%--        }--%>
<%--    }--%>
    function checkForm() {
        if (!document.newMember.password.value) {
            alert("비밀번호를 입력해주세요.");
            return false;
        }
        if (document.newMember.password.value !== document.newMember.password_confirm.value) {
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }
    }
</script>