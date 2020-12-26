<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String updatedTitle=request.getParameter("title").toString();
    String oldTitle=session.getAttribute("oldTitle").toString();
    String id2=session.getAttribute("id").toString();
    int id=Integer.parseInt(id2);
    String updatedDesc=request.getParameter("desc");
    String u=session.getAttribute("username").toString();
    session.setAttribute("id",id);
    session.setAttribute("username",u);
    try{
        boolean update=true;
        Class.forName("com.mysql.jdbc.Driver");
        final String DB_URL="jdbc:mysql://localhost:3306/personal_diary?";
        final String DB_USER="root";
        final String DB_PASSWORD="";
        Connection conn=DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
        if(updatedTitle!="") {
            String query = "Select title from `diary` where user_id=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String t = rs.getString("title");
                if (t.equals(updatedTitle)) {
                    update = false;
                }
            }
            if (update == false) {
                request.setAttribute("errMessage", "Please Enter a different title. Entered Title already exists");
                request.getRequestDispatcher("updateForm.jsp").forward(request, response);
            }
        }
    if(update==true){

        if(updatedDesc!=""||updatedTitle!="") {
            String query = "UPDATE `diary` SET `date`=CURRENT_DATE WHERE `title`=? and user_id=? ";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, oldTitle);
            stmt.setInt(2, id);
            stmt.executeUpdate();
        }else{
            request.setAttribute("warningMessage", "DATA NOT UPDATED BECAUSE NOTHING GIVEN");
            request.getRequestDispatcher("update.jsp").forward(request, response);
        }

        if(updatedDesc!=""){
            String query = "UPDATE `diary` SET `description`=? WHERE `title`=? and user_id=? ";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1,updatedDesc);
            stmt.setString(2,oldTitle);
            stmt.setInt(3, id);
            stmt.executeUpdate();
        }
        if(updatedTitle!=""){
            String query = "UPDATE `diary` SET `title`=? WHERE `title`=? and user_id=? ";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1,updatedTitle);
            stmt.setString(2,oldTitle);
            stmt.setInt(3, id);
            stmt.executeUpdate();
        }
        request.setAttribute("successMessage", "DATA UPDATED ACCORDING TO GIVEN DATA");
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }
    }catch(Exception e){
            System.out.println(e.getMessage());
        }

%>



</body>
</html>
