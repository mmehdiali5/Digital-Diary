<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String id2=session.getAttribute("id").toString();
    int id=Integer.parseInt(id2);
    String u=session.getAttribute("username").toString();
    session.setAttribute("id",id);
    session.setAttribute("username",u);
    String enteredTitle=session.getAttribute("title").toString();

    Class.forName("com.mysql.jdbc.Driver");
    final String DB_URL="jdbc:mysql://localhost:3306/personal_diary?";
    final String DB_USER="root";
    final String DB_PASSWORD="";
    Connection conn=DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
    String query="DELETE FROM `diary` WHERE user_id=? and title=?";
    PreparedStatement stmt=conn.prepareStatement(query);
    stmt.setInt(1,id);
    stmt.setString(2,enteredTitle);
    int rs=stmt.executeUpdate();
    request.setAttribute("successMessage","ENTRY DELETED");
    request.getRequestDispatcher("delete.jsp").forward(request,response);
%>

</body>
</html>
