<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<div class="container">
<%
    String id2=session.getAttribute("id").toString();
    int id=Integer.parseInt(id2);
    String u=session.getAttribute("user").toString();
    session.setAttribute("id",id);
    session.setAttribute("username",u);
%>
<%
    try{
        String enteredTitle=request.getParameter("title");
        session.setAttribute("title",enteredTitle);
        boolean del=false;
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL="jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER="root";
        final String DB_PASSWORD="";
        Connection conn=DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
        String query="Select title from `diary` where user_id=?";
        PreparedStatement stmt=conn.prepareStatement(query);
        stmt.setInt(1,id);
        ResultSet rs=stmt.executeQuery();
        while(rs.next()) {
            String t=rs.getString("title");
            if(t.equals(enteredTitle)){
                del=true;
            }
        }
        if(del==false){
            request.setAttribute("errorMessage","Please Enter a different title. Entered Title does'nt exist");
            request.getRequestDispatcher("delete.jsp").forward(request,response);
        }else{
            String query2="Select * from `diary` where user_id=? and title=?";
            PreparedStatement stmt2=conn.prepareStatement(query2);
            stmt2.setInt(1,id);
            stmt2.setString(2,enteredTitle);
            ResultSet rs2=stmt2.executeQuery();%>
<table class="table">
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Date(YYYY-MM-DD)</th>
    </tr>
       <%     while(rs2.next()) {
                String ti = rs2.getString("title");
                String desc=rs2.getString("description");
                String date=rs2.getString("date");
%>
<tr>
    <td><%=ti%></td>
    <td><%=desc%></td>
    <td><%=date%></td>
</tr>
<%    }%>
</table>
    <br>
    <br>
    <form action="deleteInDb.jsp" method="post">
        <button class="btn btn-warning">CONFIRM DELETE</button>
    </form>
 <%
         }}catch(Exception e){
        System.out.println(e.getMessage());
    }
%>
</div>
</body>
</html>
