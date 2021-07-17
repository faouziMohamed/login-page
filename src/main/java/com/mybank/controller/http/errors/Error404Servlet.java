package com.mybank.controller.http.errors;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Error404Servlet", value = "/404")
public class Error404Servlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
    this.getServletContext()
        .getRequestDispatcher("/WEB-INF/errors/404.jsp")
        .forward(request, response);
  }
}
