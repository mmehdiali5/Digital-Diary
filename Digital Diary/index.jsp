<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<h1 style="text-align: center">PLEASE LOGIN TO ACCESS YOUR DIGITAL DIARY</h1>
<div class="container" style="background-color:rgb(255, 204, 102);padding-top:20px;padding-bottom:20px">
    <form method="get" action="verify.jsp">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-10">
                <input required class="form-control" type="text" placeholder="Username" name="user"><br>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-10">
                <input class="form-control" required type="password" placeholder="Password" name="passwd"><br>
            </div>
        </div>

        <br><br>
        <button class="btn btn-info" type="submit">Login</button>
        <% if(request.getAttribute("errorMessage")!=null){%>
        <h6 style="color:red"><%=request.getAttribute("errorMessage")%></h6><%}%>

    </form>
</div>


</body>
</html>
