package com.mybank.controller;

import com.google.gson.Gson;
import com.mybank.exception.NoClientConnectedException;
import com.mybank.model.Client;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalTime;

@WebServlet(name = "DashboardServlet", value = "/dashboard")
public class DashboardServlet extends HttpServlet implements ServletUtils {
  @Override
  protected void doGet(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {

    try {
      Client client = assertThereIsClientConnected(request);
      int hour = LocalTime.now().getHour();
      request.setAttribute("hour", hour);
      request.setAttribute("client", client);
      request.setAttribute("data", client.getAllSavingAccount().values());

      Gson gson = new Gson();

      String svaJsonStr = gson.toJson(client.getAllSavingAccount().values());
      String craJsonStr = gson.toJson(client.getAllCurrentAccount().values());
      request.setAttribute("sva", svaJsonStr);
      request.setAttribute("cra", craJsonStr);

      ShowDashboardPage(request, response);
    } catch (IllegalStateException
               | NullPointerException
               | NoClientConnectedException e) {
      request.setAttribute("error", "You need to connect in order to continue");
      sendUserToLoginPage(request, response);
    }
  }

  private void ShowDashboardPage(HttpServletRequest request,
                                 HttpServletResponse response) throws ServletException, IOException {
    this.getServletContext()
        .getRequestDispatcher("/WEB-INF/users/dashboard.jsp")
        .forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}
