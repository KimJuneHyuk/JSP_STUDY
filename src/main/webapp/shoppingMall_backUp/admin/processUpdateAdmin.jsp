<%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/05
  Time: 12:11 PM
  To change this template use File | Settings | File Templates.
--%>

<%@include file="../fragments/basic.jsp" %>
<%@include file="../fragments/dbConn.jsp" %>

<%
    request.setCharacterEncoding("utf-8");

//    String id = request.getParameter("id");
    String sessionAdminId = (String) session.getAttribute("sessionAdminId");
    String password = request.getParameter("password");
    String newPassword = request.getParameter("newPassword");
    String name = request.getParameter("name");
%>



<%
    String sql = "update `WebMarketDB`.`admin` set `password`= ?, `name` = ? where `id` = ? and `password` = ?";
    pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, newPassword);
    pstmt.setString(2, name);
    pstmt.setString(3, sessionAdminId);
    pstmt.setString(4, password);

    int result = pstmt.executeUpdate();


%>
<%--<sql:update dataSource="${dataSource}" var="resultSet">--%>
<%--    update `WebMarketDB`.`admin` set `password`= ?, `name` = ? where `id` = ? and `password` = ?--%>
<%--    <sql:param value="<%=passwordCheck%>"/>--%>
<%--    <sql:param value="<%=name%>"/>--%>
<%--    <sql:param value="<%=sessionAdminId%>"/>--%>
<%--    <sql:param value="<%=password%>"/>--%>
<%--</sql:update>--%>

<%

    if (result == 1) {
        session.setAttribute("sessionAdminName", name);
        response.sendRedirect("index.jsp");
    } else {

        response.sendRedirect("updateAdmin.jsp");
    }
%>

<%--<c:if test="${resultSet >= 1}">--%>
<%--    <c:redirect url="resultAdmin.jsp?msg=0"/>--%>
<%--</c:if>--%>

