<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<div class="container">
<%
    String id = session.getAttribute("id").toString();
    String u = session.getAttribute("username").toString();
    session.setAttribute("id", id);
    session.setAttribute("user", u);
%>

<form action="displaySearch.jsp" method="post">

    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Enter Start Date</label>
        <div class="col-sm-10">
            <input class="form-control" required type="date" placeholder="Enter Start Date(YYYY-MM-DD)" name="start"><br>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Enter End Date</label>
        <div class="col-sm-10">
            <input class="form-control" required type="date" placeholder="Enter End Date(YYYY-MM-DD)" name="end"><br>
        </div>
    </div>
    <button class="btn btn-info">SEARCH</button>
    <% if(request.getAttribute("displayErrorMessage")!=null){%>
    <h6 style="color:red"><%=request.getAttribute("displayErrorMessage")%></h6><%}%>
</form>
    <form action="home.jsp" method="post">
        <button class="btn btn-success">Home</button>
    </form>
</div>
</body>
</html>
