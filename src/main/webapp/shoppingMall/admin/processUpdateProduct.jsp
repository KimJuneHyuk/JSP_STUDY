<%@ page import="java.awt.*" %>
<%--<%@ page import="com.oreilly.servlet.MultipartRequest" %>--%>
<%--<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>--%>
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
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

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

    String sql = "select * from `WebMarketDB`.`products` where `p_id` = ?";
//    out.print(sql + productId);
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, productId);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        if (fileName != null) {
            sql = "update `WebMarketDB`.`products` set `p_name` = ? , `p_unitPrice` = ?, `p_description`= ?, `p_manufacturer`= ?, `p_category`= ?, `p_unitsInStock`= ?, `p_condition`= ?, `p_fileName`= ? where `p_id` = ?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1,pname);
            pstmt.setInt(2,price);
            pstmt.setString(3,description);
            pstmt.setString(4,manufacturer);
            pstmt.setString(5,category);
            pstmt.setLong(6,stock);
            pstmt.setString(7, condition);
            pstmt.setString(8,fileName);
            pstmt.setString(9,productId);

            pstmt.executeUpdate();
        } else {
            sql = "update `WebMarketDB`.`products` set `p_name` = ? , `p_unitPrice` = ?, `p_description`= ?, `p_manufacturer`= ?, `p_category`= ?, `p_unitsInStock`= ?, `p_condition`= ? where `p_id` = ?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1,pname);
            pstmt.setInt(2,price);
            pstmt.setString(3,description);
            pstmt.setString(4,manufacturer);
            pstmt.setString(5,category);
            pstmt.setLong(6,stock);
            pstmt.setString(7, condition);
            pstmt.setString(8,productId);

            pstmt.executeUpdate();
        }
    }

    if (pstmt != null) {
        pstmt.close();
    }
    if (conn != null) {
        conn.close();
    }





//  ?????? ???????????? ?????????.
//    String realpath2nd = request.getServletContext().getRealPath("");
    int firstIndex = realPath.lastIndexOf("exploded"); // ?????? ???????????? ???????????? ????????? ??????
    int lastIndex = realPath.lastIndexOf("-1.0-SNAPSHOT.war");
    String projectName = realPath.substring(firstIndex, lastIndex).replace("exploded", "");
    String targetPath = realPath.replace("build/libs/exploded" + projectName + "-1.0-SNAPSHOT.war", "src/main/webapp/shoppingMall");



//  ????????? ??? SNAPSHOT.war ??? ????????? ?????? ?????? ????????? ???????????????
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
    response.sendRedirect("editProduct.jsp?edit=update");
%>