<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand navbar-dark bg-dark">
    <div class="container">
        <div class="navbar-header">
            <a href="./welcome.jsp" class="navbar-brand">Home</a>
        </div>
        <div>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a href="./bookProducts.jsp" class="nav-link">도서 목록</a>
                </li>
                <li class="nav-item">
                    <a href="./addBook.jsp" class="nav-link">도서 등록</a>
                </li>
                <li class="nav-item">
                    <a href="./editBook.jsp?edit=update" class="nav-link">도서 수정</a>
                </li>
                <li class="nav-item">
                    <a href="./editBook.jsp?edit=delete" class="nav-link">도서 삭제</a>
                </li>
            </ul>
        </div>
    </div>
</nav>