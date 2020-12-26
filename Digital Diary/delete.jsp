<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<%
    String id=session.getAttribute("id").toString();
    String u=session.getAttribute("user").toString();
    session.setAttribute("id",id);
    session.setAttribute("username",u);
%>
<form action="confirmDelete.jsp" method="post">

    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Title</label>
        <div class="col-sm-10">
            <input class="form-control" required type="text" placeholder="Enter Title to delete" name="title"><br>
        </div>
    </div>
    <button class="btn btn-danger">Delete Entry</button>
    <% if(request.getAttribute("errorMessage")!=null){%>
    <h6 style="color:red"><%=request.getAttribute("errorMessage")%></h6><%}%>

    <% if(request.getAttribute("successMessage")!=null){%>
    <h6 style="color:green"><%=request.getAttribute("successMessage")%></h6><%}%>
</form>

<form action="home.jsp" method="post">
    <button class="btn btn-success">Home</button>
</form>

</body>
</html>