package com.example.jsp_study.controllers;

import com.example.jsp_study.model.LoginBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=utf-8");
        String id = req.getParameter("id");
        String password = req.getParameter("passwd");

        LoginBean bean = new LoginBean();
        bean.setId(id);
        bean.setPassword(password);
        req.setAttribute("bean", bean);

        boolean status = bean.validate();

        RequestDispatcher rd;
        if (status) {
            rd = req.getRequestDispatcher("Ex01_mvc_login_success.jsp");
        } else {
            rd = req.getRequestDispatcher("Ex01_mvc_error.jsp");
        }
        rd.forward(req, resp);

    }
}
