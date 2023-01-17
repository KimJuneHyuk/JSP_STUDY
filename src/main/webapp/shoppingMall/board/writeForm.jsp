<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/12
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    String sessionId = (String) session.getAttribute("sessionId");
//    String name = (String) request.getAttribute("name");
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script type="text/javascript">
        function checkForm() {
            if (!document.newWrite.name.value) {
                alert("성명을 입력하세요.")
                return false;
            }
            if (!document.newWrite.subject.value) {
                alert("제목을 입력하세요.");
                return false;
            }
            if (!document.newWrite.content.value) {
                alert("내용을 입력하세요.");
                return false;
            }
        }
    </script>
</head>
<body>
<jsp:include page="../fragments/menu.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">게시판</h1>
    </div>
</div>
<div class="container">
    <form name="newWrite" action="./BoardWriteAction.do" class="form-horizontal" method="post"
          onsubmit="return checkForm()">
        <input type="hidden" name="id" class="form-control" value="${sessionId}">
        <div class="form-group row">
            <label class="col-sm-2 control-label">성명</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="name" value="${name}" placeholder="name">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 control-label">제목</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" name="subject" placeholder="subject">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 control-label">내용</label>
            <div class="col-sm-8">
                <textarea cols="50" rows="5" class="form-control" name="content" placeholder="content"></textarea>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10 ">
                <input type="submit" class="btn btn-primary" value="등록">
                <input type="reset" class="btn btn-danger" onclick="window.location.href='../board/BoardListAction.do?pageNum=1' " value="취소">
            </div>
        </div>

    </form>
    <hr>
</div>
<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>
