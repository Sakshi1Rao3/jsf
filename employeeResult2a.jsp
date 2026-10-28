<% @ page ContentType="text/html;charset='UTF-8'" language="java"%>
<%@ page import="java.util.Calendar">
<!DOCTYPE html>
<html>
    <head>
        <title>Emplyee Result</title>
    </head>
    <body>
        <%
        String employeeId= request.getParameter("employeeId");
        String name= request.getParameter("name");
        String age= request.getParameter("age");
        String dept= request.getParameter("department");
        String email= request.getParameter("email");
        <%
        int age = Integer.parseInt(ageStr);
        Calendar calendar= Calendar.getInstance();
        int currentYear = calendar.get(Calendar.YEAR);
        int birthYear= currentYear- age;
        String nameandept= name + " "+ dept;
        String formattedemail= email.toLowerCase();
        %>
        <table border="1">
            <tr>
                <td> Employee id</td>
                <td><%= employeeId%></td>
            </tr>
            <tr>
                <td> Age </td>
                <td><%= age</td>
            </tr>
            <tr>
                <td> name and dept</td>
                <td><%= nameandept</td>
            </tr>
            <tr>
                <td> formatted email</td>
                <td><%= formattedemail</td>
            </tr>
        </table>
    </body>
    </html>
