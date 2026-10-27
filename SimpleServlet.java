
package com.example;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SimpleServlet")
public class SimpleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<h2>Submit Your Details</h2>");
        out.println("<form method='POST' action='SimpleServlet'>");
        out.println("Name: <input name='name'><br><br>");
        out.println("Password: <input type='password' name='password'><br><br>");
        out.println("<input type='submit' value='Submit'></form>");
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<h2>Submitted Data</h2>");
        out.println("Name: " + request.getParameter("name") + "<br>");
        out.println("Password: " + request.getParameter("password"));
    }
}
