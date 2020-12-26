<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <%
        String id = session.getAttribute("id").toString();
        String u = session.getAttribute("username").toString();
    %>
    <h1 style="text-align: center">WELCOME TO DIGITAL DIARY <%=u%>
    </h1>

    <form action="openDiary.jsp" method="post">
        <button class="btn btn-primary">OPEN DIARY</button>
    </form>

    <br>
    <form action="add.jsp" method="post">
        <button class="btn btn-success">ADD AN ENTRY</button>
    </form>

    <br>
    <form action="delete.jsp" method="post">
        <button class="btn btn-danger">DELETE ENTRY</button>
    </form>


    <br>
    <form action="update.jsp" method="post">
        <button class="btn btn-warning">UPDATE ENTRY</button>
    </form>

    <br>
    <form action="search.jsp" method="post">
        <button class="btn btn-info">SEARCH ENTRY</button>
    </form>

    <br>
    <form action="index.jsp" method="post">
        <button class="btn btn-secondary">LOGOUT</button>
    </form>

    <%
        session.setAttribute("id", id);
        session.setAttribute("user", u);
    %>
</div>
</body>
</html>
