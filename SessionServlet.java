
package com.example;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServletDemo/SessionServlet")
public class SessionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = request.getContextPath() + "/ServletDemo/SessionServlet";

        if ("logout".equals(request.getParameter("action"))) {
            HttpSession s = request.getSession(false);
            if (s != null) s.invalidate();
            response.sendRedirect(url);
            return;
        }

        HttpSession s = request.getSession(false);

        if (s != null && s.getAttribute("username") != null) {
            out.println("<h2>Welcome, " + s.getAttribute("username") + "!</h2>");
            out.println("<a href='" + url + "?action=logout'>Logout</a>");
            out.println("<h3>Session Information:</h3>");
            out.println("Session ID: " + s.getId() + "<br>");
            out.println("Creation Time: " + new java.util.Date(s.getCreationTime()) + "<br>");
            out.println("Last Accessed Time: " + new java.util.Date(s.getLastAccessedTime()));
        } else {
            out.println("<h2>Login</h2>");
            out.println("<form method='post' action='" + url + "'>");
            out.println("Username: <input name='username'><br><br>");
            out.println("Password: <input type='password' name='password'><br><br>");
            out.println("<input type='submit' value='Login'></form>");
        }
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("admin".equals(username) && "password".equals(password)) {
            HttpSession s = request.getSession(true);
            s.setAttribute("username", username);
        }

        response.sendRedirect(request.getContextPath() + "/ServletDemo/SessionServlet");
    }

    protected void doDelete(HttpServletRequest request,
                            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession s = request.getSession(false);
        if (s != null) s.invalidate();

        response.sendRedirect(request.getContextPath() + "/ServletDemo/SessionServlet");
    }
}
