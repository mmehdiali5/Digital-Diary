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
    String u=session.getAttribute("username").toString();
    session.setAttribute("id",id);
    session.setAttribute("username",u);
    try{
        String enteredTitle=request.getParameter("title");
        session.setAttribute("oldTitle",enteredTitle);
        boolean update=false;
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
                update=true;
            }
        }
        if(update==false){
            request.setAttribute("errorMessage","Please Enter a different title. Entered Title does'nt exist");
            request.getRequestDispatcher("update.jsp").forward(request,response);
        }else{
%>
<form action="updateInDB.jsp" method="post">
<div class="form-group row">
    <label class="col-sm-2 col-form-label">Updated Title</label>
    <div class="col-sm-10">
        <input class="form-control" type="text" placeholder="Enter Title if you want to update it otherwise keep this field empty" name="title"><br>
    </div>
</div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Updated Description</label>
        <div class="col-sm-10">
            <input class="form-control" type="text" placeholder="Enter Description if you want to update it otherwise keep this field empty" name="desc"><br>
        </div>
    </div>
    <button class="btn btn-warning">UPDATE</button>
</form>
<% if(request.getAttribute("errMessage")!=null){%>
<h6 style="color:red"><%=request.getAttribute("errMessage")%></h6><%}%>
<%}}catch(Exception e){
    System.out.println(e.getMessage());
}%>

<form action="home.jsp" method="post">
    <button class="btn btn-success">Home</button>
</form>

</div>
</body>
</html>
