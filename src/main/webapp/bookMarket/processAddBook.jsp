<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.example.jsp_study.bookmarket.daos.BookRepository" %>
<%@ page import="com.example.jsp_study.bookmarket.dtos.BookDto" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/30
  Time: 10:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.awt.*" %>
<%@include file="dbConn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");

    String realPath = request.getServletContext().getRealPath("resources/images");//파일 저장될 경로
    File dir = new File(realPath);
    if (!dir.exists()) {
        dir.mkdirs();
    }
    if (!Desktop.isDesktopSupported()) {
        return;
    }
    Desktop desktop = Desktop.getDesktop();
    if (dir.exists()) {
        desktop.open(dir);
    }

    String filename = "";
    String encType = "utf-8";
    int maxSize = 5 * 1024 *1024;

    MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encType, new DefaultFileRenamePolicy());

    String bookId = multi.getParameter("bookId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String author = multi.getParameter("author");
    String description = multi.getParameter("description");
    String publisher = multi.getParameter("publisher");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");
    String totalPages = multi.getParameter("totalPages");
    String releaseDate = multi.getParameter("releaseDate");
    String condition = multi.getParameter("condition");

    int price;
    if (unitPrice.isEmpty()) {
        price = 0;
    } else {
        price = Integer.valueOf(unitPrice);
    }

    int stock;
    if (unitsInStock.isEmpty()) {
        stock = 0;
    } else {
        stock = Integer.valueOf(unitsInStock);
    }

    int pages;
    if (totalPages.isEmpty()) {
        pages = 0;
    } else {
        pages = Integer.valueOf(totalPages);
    }

    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    String sql = "insert into `bookMarket`.`books` values" +
            "(?,?,?,?,?,?,?,?,?,?,?,?)";
    pstmt = conn.prepareStatement(sql);

    pstmt.setString(1,bookId);
    pstmt.setString(2,name);
    pstmt.setInt(3,price);
    pstmt.setString(4,author);
    pstmt.setString(5,description);
    pstmt.setString(6,publisher);
    pstmt.setString(7,category);
    pstmt.setLong(8,stock);
    pstmt.setLong(9,pages);
    pstmt.setString(10,releaseDate);
    pstmt.setString(11,condition);
    pstmt.setString(12,fileName);

    pstmt.executeUpdate();

    if (pstmt != null) {
        pstmt.close();
    }
    if (conn != null) {
        conn.close();
    }
//    BookRepository dao = BookRepository.getInstance();
//
//    BookDto newBook = new BookDto();
//    newBook.setBookId(bookId);
//    newBook.setName(name);
//    newBook.setUnitPrice(price);
//    newBook.setDescription(description);
//    newBook.setPublisher(publisher);
//    newBook.setCategory(category);
//    newBook.setUnitsInStock(stock);
//    newBook.setCondition(condition);
//    newBook.setAuthor(author);
//    newBook.setTotalPages(pages);
//    newBook.setReleaseDate(releaseDate);
//    newBook.setFilename(fileName);
//
//    dao.addBook(newBook);

    int firstIndex = realPath.lastIndexOf("exploded"); // 해당 문자열이 시작되는 인덱스 찾기
    int lastIndex = realPath.lastIndexOf("-1.0-SNAPSHOT.war");
    String projectName = realPath.substring(firstIndex, lastIndex).replace("exploded", "");
    String targetPath = realPath.replace("build/libs/exploded" + projectName + "-1.0-SNAPSHOT.war", "src/main/webapp/bookMarket");

    //  업로드 된 SNAPSHOT.war 의 파일을 현재 작업 폴더로 복사해오기
    try (FileInputStream fis = new FileInputStream(realPath + "/" + fileName);
         FileOutputStream fos = new FileOutputStream(targetPath + "/" + fileName);
         BufferedInputStream bis = new BufferedInputStream(fis);
         BufferedOutputStream bos = new BufferedOutputStream(fos)) {
        int i;
        while ( (i = bis.read()) != -1 ) {
            bos.write(i);
        }
    } catch (IOException e) {
        e.printStackTrace();
    }


    response.sendRedirect("bookProducts.jsp");

%>
