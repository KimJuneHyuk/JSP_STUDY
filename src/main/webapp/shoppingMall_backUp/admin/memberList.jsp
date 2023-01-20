<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2023/01/06
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../fragments/dbConn.jsp" %>

<html>
<head>
    <%@include file="../fragments/basic.jsp" %>
    <title>리스트</title>
</head>
<body>

<%@include file="./menu.jsp" %>


<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">회원 목록</h1>
    </div>
</div>

<table class="table table-hover text-center">
    <thead>
    <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>이메일</th>
        <th>연락처</th>
        <th>주소</th>
        <th>가입 일시</th>
        <th>상세보기</th>
    </tr>
    </thead>
    <tbody>
    <%
        // 1. 페이지당 게시물을 가져오기 위해 필요한 값 : 페이지당 게시물 수, 페이지 번호
        int cntListPerPage = 10; // 페이지당 게시물 수
        int pageNum = 1; // 페이지 번호가 전달이 안되면 1페이지.
        if (request.getParameter("pageNum") != null) { // 페이지 번호가 전달이 된경우
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }

        // 2. 페이지번호 당 게시물을 들고 오기 위해 필요한 값 : 시작 게시물 번호와, 페이지당 게시물 수.
        int startNum = (pageNum - 1) * cntListPerPage;

//        String sql = "select * from `WebMarketDB`.`members` limit ? offset ?";
        String sql = "select * from `WebMarketDB`.`members` order by `id` desc limit ? , ?";
        pstmt = conn.prepareStatement(sql);

        pstmt.setInt(1, startNum);
        pstmt.setInt(2, cntListPerPage);

//        pstmt.setInt(1, cntListPerPage);
//        pstmt.setInt(2, startNum);

        rs = pstmt.executeQuery();

//        List<ResultSet> sqlRowList = new ArrayList<>();

        while (rs.next()) {


    %>
    <tr>
        <td><%=  rs.getString("id")%>
        </td>
        <td><%= rs.getString("name")%>
        </td>

        <td><%= rs.getString("mail")%>
        </td>
        <td><%= rs.getString("phone")%>
        </td>
        <td><%= rs.getString("address")%>
        </td>
        <td><%= rs.getString("regist_day")%>
        </td>
        <td>
            <button class="btn btn-success">
                <a href="detailMember.jsp?id=<%=rs.getString("id")%>" style="color: white">
                    상세보기 &raquo;
                </a>
            </button>
        </td>

    </tr>
    <%
        }
    %>
    </tbody>
</table>

<div class="col-sm-5">
    <%
        sql = "select count(*) from `WebMarketDB`.`members`";
        pstmt = conn.prepareStatement(sql);

        rs = pstmt.executeQuery();

        rs.next();
        int totalRecord = rs.getInt(1); // 여기서 카운트로 전체 게시물 숫자를 알 수 있다.
//        전체 페이지 수
//        1) 전체 게시물 수가 페이지당 게시물 수의 배수일 경우 :: 전체 게시물 수 / 페이지당 게시물 수
//        2) 전체 게시물 수가 페이지당 게시물 수의 배수가 아닐 경우 :: (전체 게시물 수 / 페이지당 게시물 수) +1 이다.!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        int totalPage = (totalRecord % cntListPerPage == 0)
                ? totalRecord / cntListPerPage : (totalRecord / cntListPerPage) + 1;
        int minPage = 1;


//        페이징 처리 하기.!!!!!!!!!!!!
        int block = 5;  // 페이지당 유저에게 보여질 페이지의 개수.  토탈 페이지가 100페이지 까지 있을때,
//        나의 현재 페이지가 5(현재는 2로 설정 하였지만...) 이더라도 block  개수가 10 이면  1 ~ 10 페이지 까지 유저에게 보여지게 한다.
        int blockTotal = totalPage % block == 0 ? totalPage / block : totalPage / block + 1; // 총 블럭의 수
        int blockThis = ((pageNum - 1) / block) + 1; // 현재 페이지의 블럭
        int blockThisFirstPage = ((blockThis - 1) * block) + 1; // 현재 블럭의 첫번째 페이지.
        int blockThisLastPage = blockThis * block; // 현재 블럭의 마지막 페이지
        blockThisLastPage = (blockThisLastPage > totalPage) ? totalPage : blockThisLastPage; // 마지막 블럭의 경우 전체 페이지 번호가 블럭의 마지막 페이지 가 되어야 한다.

        out.println("totalPage : " + totalPage + "<br>");
        out.println("blockTotal : " + blockTotal + "<br>");
        out.println("blockThis : " + blockThis + "<br>");
        out.println("blockThisFirstPage : " + blockThisFirstPage + "<br>");
        out.println("blockThisLastPage : " + blockThisLastPage + "<br>");

//        페이징 출력 하기.
    %>

    <%
        if (blockThis > minPage) {
    %>
    <a href="memberList.jsp?pageNum=<%=minPage%>"> &ltri;&ltri; </a>
    <%
        }
    %>


    <%
        if (blockThis > minPage) { //2 번 블럭 부터 이전 페이지 까지 출력 하기: 이번 블럭의 첫페이지 -1
    %>
    <a href="memberList.jsp?pageNum=<%=blockThisFirstPage - 1%>"> &ltri; </a>
    <%
        }
    %>


    <%
        for (int i = blockThisFirstPage; i <= blockThisLastPage; i++) {
//            현재 블럭의 첫 페이지 부터 현재 블럭의 마지막 페이지 까지 번호를 반복 출력 해주기.
    %>
    <a href="memberList.jsp?pageNum<%=i%>"><%=i%></a>
    <%
        }
    %>


    <%
        if (blockThis < blockTotal) {
    %>
        <a href="memberList.jsp?pageNum=<%=blockThisLastPage + 1%>"> &rtri; </a>
    <%
        }
    %>

    <%
        if (blockThis < blockTotal) {
    %>
        <a href="memberList.jsp?pageNum=<%=totalPage%>"> &rtri;&rtri; </a>
    <%
        }
    %>
</div>

<jsp:include page="../fragments/footer.jsp"/>
</body>
</html>
