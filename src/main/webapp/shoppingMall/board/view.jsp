<%@ page import="com.example.jsp_study.market.mvc.models.dtos.BoardDto" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.jsp_study.market.mvc.models.dtos.RippleDto" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/13
  Time: 9:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    BoardDto notice = (BoardDto) request.getAttribute("board");
    int num = ((Integer) request.getAttribute("num")).intValue();
    int nowPage = ((Integer) request.getAttribute("page")).intValue();

//    List<RippleDto> rippleList = (ArrayList<RippleDto>) request.getAttribute("rippleList");

%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>
<jsp:include page="../fragments/menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">게시판</h1>
    </div>
</div>

<div class="container">


        <div class="form-group row">
            <label class="col-sm-2 control-label">성명</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="name" value="<%=notice.getName()%>" readonly placeholder="name">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 control-label">제목</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="subject" value="<%=notice.getSubject()%>" readonly placeholder="subject">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 control-label">내용</label>
            <div class="col-sm-8" style="word-break: break-all">
<%--                <input type="text" class="form-control" name="name" value="<%=notice.getContent()%>" placeholder="name">--%>
                <textarea cols="50" rows="5" class="form-control" name="content" placeholder="content" readonly><%=notice.getContent()%></textarea>
            </div>
        </div>

    <form action="BoardSelectAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowPage%>" name="newUpdate" class="form-horizontal" method="post">
        <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10 ">
                <c:set var="userId" value="<%=notice.getId()%>"/>
                <c:if test="${sessionId == userId}">
                    <p>
                        <a href="#" onclick="deleteConfirm()" class="btn btn-danger">삭제</a>
                        <input type="submit" class="btn btn-success" value="글 수정">
                    </p>
                </c:if>
                <a href="./BoardListAction.do?pageNum=<%=nowPage%>" class="btn btn-primary">목록</a>
            </div>
        </div>
    </form>
    <hr>

    <c:forEach var="ripple" items="${rippleList}">
        <p>${ripple.content} | ${ripple.name}
            <c:if test="${sessionId == ripple.memberId}">
                <span class="btn btn-danger" onclick="goRippleDelete(`${ripple.rippleId}`);">
                    삭제
                </span>
            </c:if>
        </p>
    </c:forEach>
    <form name="frmRippleDelete" method="post" class="form-horizontal">
        <input type="hidden" name="num" value="<%=notice.getNum()%>">
        <input type="hidden" name="pageNum" value="${page}">
        <input type="hidden" name="rippleId">
    </form>
    <script>
        function goRippleDelete(ID) {
            const frm = document.frmRippleDelete;
            frm.rippleId.value = ID;
            frm.action = "BoardRippleDeleteAction.do";
            frm.submit();
        }
    </script>

    <hr>
<%--    리플 목록--%>
    <c:if test="${sessionId != null}">
        <form name="frmRipple" class="form-horizontal" method="post">
            <input type="hidden" name="num" value="<%=notice.getNum()%>">
            <input type="hidden" name="pageNum" value="${page}">
            <div class="form-group row">
                <label class="col-sm-2 control-label">성명</label>
                <div class="col-sm-3">
                    <input type="text" name="name" class="form-control" value="${sessionName}" placeholder="name">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 control-label">내용</label>
                <div class="col-sm-8">
                    <textarea name="content" id="content" cols="50" rows="3"></textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-3">
                    <span class="btn btn-primary" onclick="goRippleSubmit();">등록</span>
                </div>
            </div>
        </form>
        <script>
            function goRippleSubmit() {
                let frm = document.frmRipple;
                frm.action  = "BoardRippleWriteAction.do";
                frm.submit();
            }
        </script>

    </c:if>
</div>
</body>
<script>
    function deleteConfirm() {
        if (confirm("정말로 해당 게시글을 삭제 하시겠습니까?") === true) {
            window.location.href = "./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowPage%>";
        } else {
            return false;
        }
    }
</script>
</html>
