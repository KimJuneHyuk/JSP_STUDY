package com.example.jsp_study.market.mvc.controllers;

import com.example.jsp_study.market.daos.CartDao;
import com.example.jsp_study.market.daos.ProductDao;
import com.example.jsp_study.market.dtos.CartDto;
import com.example.jsp_study.market.dtos.ProductDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(urlPatterns = {"/shoppingMall/shop_db/addCart.jsp", "/shoppingMall/shop_db/cart.jsp"})
public class CartController extends HttpServlet {

    ProductDao productDao = new ProductDao();
    ProductDto productDto = new ProductDto();
    CartDao cartDao = new CartDao();
    CartDto cartDto = new CartDto();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String RequestURI = req.getRequestURI();
        String contextPath = req.getContextPath();
        String command = RequestURI.substring(contextPath.length());

        resp.setContentType("text/html; charset=utf-8");
        req.setCharacterEncoding("utf-8");

        System.out.println("cart command :" + command);

        if (command.contains("addCart.jsp")) {  //장바구니 담기.
            // 파라미터로 넘어온 아이디 값을 확인하기.
            String id = req.getParameter("id");
            if (id == null || id.trim().equals("")) {
                resp.sendRedirect("products.jsp");
                return;
            }

            try {
                productDto = productDao.selectProductById(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if (productDto == null) {
                resp.sendRedirect("exceptionNoProductId.jsp");
            }

            String orderNum = req.getSession().getId();
            String sessionId = (String) req.getSession().getAttribute("sessionId");

            try {
                boolean flag = cartDao.updateCart(productDto, orderNum, sessionId);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            resp.sendRedirect("product.jsp?id=" + id);
        } else if (command.contains("cart.jsp")) {

            HttpSession session = req.getSession(); // 세션 생성.
            String orderNum = session.getId();
            req.setAttribute("cartId", orderNum);

            try {
                ArrayList<CartDto> carts = cartDao.getCartList(orderNum);
                req.setAttribute("carts", carts);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            RequestDispatcher rd = req.getRequestDispatcher("/shoppingMall/shop_db/@cart.jsp");
            rd.forward(req,resp);
        }
    }


}
