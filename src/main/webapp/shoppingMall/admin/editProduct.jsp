<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/03
  Time: 9:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품 편집</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script type="text/javascript">
        function deleteConfirm(id) {
            if (confirm(id) === true) {
                location.href = "./deleteProduct.jsp?id=" + id;
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
<jsp:include page="../fragments/menu.jsp"/>
<%--<%@include file="fragments/menu.jsp"%>--%>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">상품 편집</h1>
    </div>
</div>

<div class="container">
    <div class="row" align="center">
        <%@include file="../fragments/dbConn.jsp" %>
        <%
            String sql = "select * from `WebMarketDB`.`products`";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
        %>
        <div class="col-md-4">
            <img src="/shoppingMall/resources/images/<%=rs.getString("p_fileName")%>" alt="a" style="width: 100%">
            <h3><%=rs.getString("p_name")%>
            </h3>
            <p><%=rs.getString("p_description")%>
            </p>
            <p><%=rs.getString("p_UnitPrice")%> 원</p>
            <p>
                <%
                    if (edit.equals("update")) {
                %>
                <a href="updateProduct.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-success" role="button"> 수정
                    &raquo; </a>
                <%
                } else if (edit.equals("delete")) {
                %>
                <a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-danger" role="button">
                    삭제 &raquo; </a>
                <%
                    }
                %>
            </p>
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

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>
