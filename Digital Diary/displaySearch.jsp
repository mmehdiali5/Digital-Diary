<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<div class="container">
    <table class="table">
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Date(YYYY-MM-DD)</th>
        </tr>
        <%
            String id2 = session.getAttribute("id").toString();
            int id = Integer.parseInt(id2);
            String u = session.getAttribute("user").toString();
            session.setAttribute("id", id);
            session.setAttribute("username", u);
            String start = request.getParameter("start");
            String end = request.getParameter("end");
            Date sDate = new SimpleDateFormat("yyyy-MM-dd").parse(start);
            Date eDate = new SimpleDateFormat("yyyy-MM-dd").parse(end);
            java.sql.Date startDate = new java.sql.Date(sDate.getTime());
            java.sql.Date endDate = new java.sql.Date(eDate.getTime());

            try {
                boolean display = false;
                Class.forName("com.mysql.jdbc.Driver");
                final String DB_URL = "jdbc:mysql://localhost:3306/personal_diary?";
                final String DB_USER = "root";
                final String DB_PASSWORD = "";
                Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                String query = "Select * from `diary` where user_id=? and date>=? and date<=?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setInt(1, id);
                stmt.setDate(2, startDate);
                stmt.setDate(3, endDate);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    display = true;
                    String ti = rs.getString("title");
                    String desc = rs.getString("description");
                    String date = rs.getString("date");
        %>
        <tr>
            <td><%=ti%>
            </td>
            <td><%=desc%>
            </td>
            <td><%=date%>
            </td>
        </tr>

        <% }
            if (display == false) {
                request.setAttribute("displayErrorMessage", "No records against entered dates");
                request.getRequestDispatcher("search.jsp").forward(request, response);
            }
        %>
        <%
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        %>
    </table>
    <form action="home.jsp" method="post">
        <button class="btn btn-success">Home</button>
    </form>
</div>
</body>
</html>
