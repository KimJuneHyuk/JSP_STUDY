<%@ page import="com.example.jsp_study.bookmarket.daos.BookRepository" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.jsp_study.bookmarket.dtos.BookDto" %>
<%@ page import="java.awt.print.Book" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/30
  Time: 8:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>도서 목록 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script type="text/javascript">
        function deleteConfirm(id) {
            if (confirm(id) === true) {
                location.href = "./deleteBook.jsp/id=" + id;
            } else {
                return false;
            }
        }
    </script>
</head>
<%
    String edit = request.getParameter("edit");
%>
<body>
<jsp:include page="fragments/menu.jsp"/>
<%--<%@include file="fragments/menu.jsp"%>--%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">도서 편집</h1>
    </div>
</div>

<div class="container">
    <div class="row">
        <%@include file="dbConn.jsp" %>

        <%
            String sql = "select * from `bookMarket`.`books`";

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {


        %>

        <div class="col-md-12">
            <img src="/bookMarket/resources/images/<%=rs.getString("fileName")%>" alt="a"
                 style="width: 200px; float: right;">
            <%--           <img src="${pageContext.request.contextPah}/resources/images/<%=book.getFilename()%>" alt="" style="width: 100%">--%>
            <h3><%=rs.getString("name")%>
            </h3>
            <p><%=rs.getString("description")%>
            </p>
            <p><%=rs.getString("author")%>
            </p>
            <p><%=rs.getString("category")%>
            </p>
            <p><%=rs.getString("releaseDate")%>
            </p>
            <p><%=rs.getString("totalPages")%>
            </p>
            <p>
                    <%
                    if (edit.equals("update")) {
                %>
                <a href="./updateBook.jsp?id=<%=rs.getString("bookId")%>" class="btn btn-success" role="button">수정
                    &raquo;</a>
                    <%
                    } else if (edit.equals("delete")) {
                %>
                <a href="#" onclick="deleteConfirm('<%=rs.getString("bookId")%>')" class="btn btn-danger" role="button">삭제
                    &raquo;</a>
                    <%
                        }
            %>
            <hr>
        </div>
        <%
            }
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        %>
    </div>
</div>

<jsp:include page="fragments/footer.jsp"/>
</body>
</html>
