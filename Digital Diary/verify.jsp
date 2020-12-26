<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL="jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER="root";
        final String DB_PASSWORD="";
        Connection conn=DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
        String query="Select * from `users`";
        Statement stmt=conn.prepareStatement(query);
        ResultSet rs=stmt.executeQuery(query);
        String u=request.getParameter("user");
        String p=request.getParameter("passwd");
        while(rs.next()) {
            int id = rs.getInt("id");
            String user = rs.getString("username");
            String passwd = rs.getString("password");
            if(u.equals(user) && p.equals(passwd)){
                session.setAttribute("username",u);
                session.setAttribute("password",p);
                session.setAttribute("id",id);
                response.sendRedirect("home.jsp");
            }
        }
        request.setAttribute("errorMessage","Login Failed Invalid Username or Password!");
        request.getRequestDispatcher("index.jsp").forward(request,response);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }

%>

</body>
</html>
