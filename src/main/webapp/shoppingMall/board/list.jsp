<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%@ page import="com.example.jsp_study.market.mvc.models.dtos.BoardDto" %>
<%
    String sessionId = (String) session.getAttribute("sessionId");
    List boardList = (List) request.getAttribute("boardList");
    int total_record = ((Integer) request.getAttribute("total_record")).intValue();
    int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
    int total_page = ((Integer) request.getAttribute("total_page")).intValue();
    int limit = ((Integer) request.getAttribute("limit")).intValue();

//    out.print(boardList);
%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>Board</title>
    <script type="text/javascript">
        function checkForm() {
            if (${sessionId==null}) {
                alert("로그인 해주세요.");
                return false;
            }

            location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
            // /shoppingMall/board/BoardWriteForm.do?id=test1
        }
    </script>
</head>
<body>
<jsp:include page="../fragments/menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">게시판</h1>
    </div>
</div>
<div class="container">
    <form action="<c:url value="./BoardListAction.do"/>" method="post">
        <div>
            <div class="text-right">
                <span class="badge badge-success">전체 <%=total_record%>건	</span>
            </div>
        </div>
        <div style="padding-top: 50px">
            <table class="table table-hover">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회</th>
                    <th>글쓴이</th>
                </tr>
                <%
                    // 목록에 노출되는 게시물 번호를 전체 게시물의 수 기준으로.
                    int serialNumber = total_record - ((pageNum - 1) * limit); // 게시물 일변 번호.
                    //                  98         - 1 -1 =0 * 5 = 0

                    for (int j = 0; j < boardList.size(); j++) {
                        BoardDto notice = (BoardDto) boardList.get(j);
                %>
                <tr>
                    <td><%=serialNumber%></td>
<%--                    <td><%=notice.getNum()%></td>--%>
                    <td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
                    <td><%=notice.getRegistDay()%></td>
                    <td><%=notice.getHit()%></td>
                    <td><%=notice.getName()%></td>
                </tr>
                <%
                        serialNumber --;
                    }
                %>
            </table>
        </div>


        <div align="center">
            <%

//    req.setAttribute("pageNum", pageNum);
//        req.setAttribute("total_page", total_page);
//        req.setAttribute("total_record", total_record);
//        req.setAttribute("boardList", boardList);
//        req.setAttribute("limit", limit);
                int pagePerBlock = 5; // 페이지 출력시 나올 범위를 설정.
                int totalBlock = total_page % pagePerBlock == 0
                        ? total_page/pagePerBlock
                        : total_page/pagePerBlock +1; // 전체 블럭의 수
                int thisBlock = ((pageNum -1) / pagePerBlock) +1; // 현재 블럭
                int firstPage = ((thisBlock - 1) * pagePerBlock) +1;// 블럭의 첫 페이지.
                int lastPage = thisBlock * pagePerBlock; //블럭의 마지막 페이지.
                lastPage = (lastPage > total_page) ? total_page : lastPage;

                out.println("totalPage :" + total_page);
                out.println("totalBlock :" + totalBlock);
                out.println("thisBlock :" + thisBlock);
                out.println("firstPage :" + firstPage);
                out.println("lastPage :" + lastPage);
            %>

            <br>
            <c:set var="pagePerBlock" value="<%=pagePerBlock%>" />
            <c:set var="totalBlock" value="<%=totalBlock%>" />
            <c:set var="thisBlock" value="<%=thisBlock%>" />
            <c:set var="firstPage" value="<%=firstPage%>" />
            <c:set var="lastPage" value="<%=lastPage%>" />

            <c:set var="pageNum" value="<%=pageNum%>"/>

            <c:if test="${pageNum != 1}">
                <a href="<c:url value="./BoardListAction.do?pageNum=${1}"/>">
                    <span>[첫 페이지]</span>
                </a>
            </c:if>

            <c:if test="${thisBlock > 1}">
                <a href="<c:url value="./BoardListAction.do?pageNum=${firstPage - 1}"/>">이전</a>
            </c:if>
            <c:forEach var="i" begin="<%=firstPage%>" end="${lastPage}">
                <c:choose>
                    <c:when test="${pageNum == i}">
                        <a href="<c:url value="./BoardListAction.do?pageNum=${i}"/>">
                            <span style="color: #4C5317; font-weight: bold">[${i}]</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value="./BoardListAction.do?pageNum=${i}"/>">
                            <span style="color: #4C5317;">[${i}]</span>
                        </a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:if test="${thisBlock < totalBlock}">
                <a href="<c:url value="./BoardListAction.do?pageNum=${lastPage +1}"/>">다음</a>
                <a href="<c:url value="./BoardListAction.do?pageNum=${total_page}"/>">
                    <span>[끝 페이지]</span>
                </a>
            </c:if>



<%--            <c:set var="pageNum" value="<%=pageNum%>" />--%>
<%--            <c:forEach var="i" begin="1" end="<%=total_page%>">--%>
<%--                <a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${pageNum==i}">--%>
<%--                            <font color='4C5317'><b> [${i}]</b></font>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <font color='4C5317'> [${i}]</font>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                </a>--%>
<%--            </c:forEach>--%>
        </div>



        <div align="left">
            <table>
                <tr>
                    <td width="100%" align="left">&nbsp;&nbsp;
                        <select name="items" class="txt">
                            <option value="subject">제목에서</option>
                            <option value="content">본문에서</option>
                            <option value="name">글쓴이에서</option>
                        </select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />
                    </td>
                    <td width="100%" align="right">
                        <a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <hr>
</div>
<jsp:include page="../fragments/footer.jsp" />
</body>
</html>





