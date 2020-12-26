<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id2=(String)session.getAttribute("id");
    int id=Integer.parseInt(id2);
    try{
        String enteredTitle=request.getParameter("title");
        String enteredDesc=request.getParameter("desc");
        boolean add=true;
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
                add=false;
            }
        }
        if(add==false){
            request.setAttribute("errorMessage","Please Enter a different title. Entered Title already exists");
            request.getRequestDispatcher("add.jsp").forward(request,response);
        }else{
        String query2="Insert into `diary`(title,description,date,user_id) Values(?,?,CURRENT_DATE,?)";
        PreparedStatement stmt2=conn.prepareStatement(query2);
        stmt2.setString(1,enteredTitle);
        stmt2.setString(2,enteredDesc);
        stmt2.setInt(3,id);
        stmt2.executeUpdate();
        request.setAttribute("successMessage","Entry added successfully");
        request.getRequestDispatcher("add.jsp").forward(request,response);
        }
    }catch(Exception e){
        System.out.println(e.getMessage());
    }
%>

</body>
</html>
