<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
<table class="table">
    <tr>
        <th>Title</th>
    </tr>
<%
    String id2=(String)session.getAttribute("id");
    session.setAttribute("user",session.getAttribute("user"));
    int id=Integer.parseInt(id2);
    try{
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL="jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER="root";
        final String DB_PASSWORD="";
        Connection conn=DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
        String query="Select * from `diary` where user_id=?";
        PreparedStatement stmt=conn.prepareStatement(query);
        stmt.setInt(1,id);
        ResultSet rs=stmt.executeQuery();
        while(rs.next()) {
            String t = rs.getString("title");
            %>
    <tr>
        <td><%=t%></td>
    </tr>
    <%    }%>
</table>
<br>
<br>

<form action="details.jsp" method="post">
<div class="form-group row">
    <label class="col-sm-2 col-form-label">Title</label>
    <div class="col-sm-10">
        <input required class="form-control" type="text" placeholder="Enter title for detail" name="title"><br>
    </div>
    <button class="btn btn-success">Display Detail</button>
</div>
</form>

<%
    }catch(Exception e){
        System.out.println(e.getMessage());
    }
%>
</div>
</body>
</html>
