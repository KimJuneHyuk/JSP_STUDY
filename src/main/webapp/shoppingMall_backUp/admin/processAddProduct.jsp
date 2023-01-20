<%@ page import="java.awt.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.example.jsp_study.market.daos.ProductRepository" %>
<%@ page import="com.example.jsp_study.market.dtos.ProductDto" %>
<%@ page import="java.io.*" %><%--
  Created by IntelliJ IDEA.
  User: dog
  Date: 2022/12/27
  Time: 10:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@include file="../fragments/dbConn.jsp"%>

<%
    request.setCharacterEncoding("utf-8");

    String realPath = request.getServletContext().getRealPath("resources/images");
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
    int maxSize = 5 * 1024 * 1024;

    MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encType, new DefaultFileRenamePolicy());

    String productId = multi.getParameter("productId");
    String pname = multi.getParameter("pname");
    String unitPrice = multi.getParameter("unitPrice");
    String description = multi.getParameter("description");
    String manufacturer = multi.getParameter("manufacturer");
    String category = multi.getParameter("category");
    String unitsInStock = multi.getParameter("unitsInStock");
    String condition = multi.getParameter("condition");

    int price;
    if (unitPrice.isEmpty()) {
        price = 0;
    } else {
        price = Integer.valueOf(unitPrice);
    }

    long stock;
    if (unitsInStock.isEmpty()) {
        stock = 0;
    } else {
        stock = Long.valueOf(unitsInStock);
    }

    Enumeration files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    String sql = "insert into `WebMarketDB`.`products` values (?,?,?,?,?,?,?,?,?)";

    pstmt = conn.prepareStatement(sql);

    pstmt.setString(1,productId);
    pstmt.setString(2,pname);
    pstmt.setInt(3,price);
    pstmt.setString(4,description);
    pstmt.setString(5,category);
    pstmt.setString(6,manufacturer);
    pstmt.setLong(7,stock);
    pstmt.setString(8, condition);
    pstmt.setString(9,fileName);

    pstmt.executeUpdate();

    if (pstmt != null) {
        pstmt.close();
    }
    if (conn != null) {
        conn.close();
    }



//    ProductRepository dao = ProductRepository.getInstance();
//    ProductDto newProduct = new ProductDto();
//
//    newProduct.setProductId(productId);
//    newProduct.setPname(pname);
//    newProduct.setUnitPrice(price);
//    newProduct.setDescription(description);
//    newProduct.setManufacturer(manufacturer);
//    newProduct.setCategory(category);
//    newProduct.setUnitsInStock(stock);
//    newProduct.setCondition(condition);
//    newProduct.setFilename(fileName);
//
//    dao.addProduct(newProduct);


//  작업 디렉터리 구하기.
//    String realpath2nd = request.getServletContext().getRealPath("");
    int firstIndex = realPath.lastIndexOf("exploded"); // 해당 문자열이 시작되는 인덱스 찾기
    int lastIndex = realPath.lastIndexOf("-1.0-SNAPSHOT.war");
    String projectName = realPath.substring(firstIndex, lastIndex).replace("exploded", "");
    String targetPath = realPath.replace("build/libs/exploded" + projectName + "-1.0-SNAPSHOT.war", "src/main/webapp/shoppingMall");


//          /Users/dog/IdeaProjects/JSP_STUDY/build/libs/exploded/JSP_STUDY-1.0-SNAPSHOT.war/resources/images

//    /Users/dog/IdeaProjects/JSP_STUDY/build/libs/exploded/JSP_STUDY-1.0-SNAPSHOT.war

//    /Users/dog/IdeaProjects/JSP_STUDY/build/libs/exploded/JSP_STUDY-1.0-SNAPSHOT.war/bookMarket/resources/images

//    /Users/dog/IdeaProjects/JSP_STUDY/src/main/webapp/bookMarket/resources/images

//          /Users/dog/IdeaProjects/JSP_STUDY/src/main
//          /Users/dog/IdeaProjects/JSP_STUDY/src/main/webapp/shoppingMall/resources/images

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
    response.sendRedirect("../shop/products.jsp");
%>