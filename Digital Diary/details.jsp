<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Title</title>
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
        String id2=(String)session.getAttribute("id");
        String u=(String)session.getAttribute("user");
        String t=(String)request.getParameter("title");
        int id=Integer.parseInt(id2);
        session.setAttribute("id",id);
        session.setAttribute("username",u);

        try{
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL="jdbc:mysql://localhost:3306/personal_diary?";
            final String DB_USER="root";
            final String DB_PASSWORD="";
            Connection conn=DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
            String query="Select * from `diary` where user_id=? and title=? order by title";
            PreparedStatement stmt=conn.prepareStatement(query);
            stmt.setInt(1,id);
            stmt.setString(2,t);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()) {
                String ti = rs.getString("title");
                String desc=rs.getString("description");
                String date=rs.getString("date");
    %>
    <tr>
        <td><%=ti%></td>
        <td><%=desc%></td>
        <td><%=date%></td>
    </tr>
    <%    }%>
</table>

<form action="home.jsp" method="post">
    <button class="btn btn-success">Home</button>
</form>

<%
    }catch(Exception e){
        System.out.println(e.getMessage());
    }
%>
</div>
</body>
</html>
