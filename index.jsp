<%
    if(session.getAttribute("id")=="111111111")
        response.sendRedirect("post_admin_login.jsp");
    else if(session.getAttribute("id")!=null)
        response.sendRedirect("post_st_login.jsp");
%>

<!DOCTYPE <!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>IIEST Elective Allotment - Welcome</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
        <script src="main.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="index.css">
    </head>

    <style>
        .modal 
        {
            display: none; 
            position: fixed; 
            z-index: 1; 
            padding-top: 100px; 
            left: 0;
            top: 0;
            width: 100%;
            height: 100%; 
            overflow: auto; 
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4); 
        }
        .modal-content 
        {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            margin-top: 20%;
        }
        .close 
        {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover, .close:focus 
        {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
    </style>

    <body>
    	
    	<jsp:include page = "includes/header.jsp" />
    	
        <nav class="navbar navbar-inverse">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="https://www.iiests.ac.in" target="_blank">IIEST</a></li>
                    <li><a href="#">Page 2</a></li>
                </ul>
            </div>
        </nav> 
        
        <div class="banner_image">
            <div class="container content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel panel-primary panel-transparent">
                            <div class="panel-heading panel-heading">
                                <p>
                                    <h4>Elective Allotment Portal.</h4>
                                </p>
                            </div>
                            <div class="panel-body">
                                <form method="post" action="login_submit.jsp">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="Enrollment ID" name="enrol_id" required>
                                    </div>
                                    <div class="form-group">
                                       <input type="password" class="form-control" placeholder="Password" name="password" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Student login</button>
                                </form>
                            </div>
                            <div class="panel-footer">
                                Don't have an account? <a href="signup.jsp">Register</a><br>

                                <a href="#" id="myBtn">Login as administrator.</a> 
                                <div id="myModal" class="modal">
                                    <div class="modal-content">
                                        <span class="close">&times;</span>
                                        <form method="post" action="admin_login_submit.jsp">
                                            <div class="form-group">
                                                <input type="password" class="form-control" placeholder="Admin Password" name="admin_password" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Admin login</button>
                                        </form>
                                    </div>
                                </div>

                                <script>
                                    var modal = document.getElementById("myModal");
                                    var btn = document.getElementById("myBtn");
                                    var span = document.getElementsByClassName("close")[0];
                                    btn.onclick = function() 
                                    {
                                        modal.style.display = "block";
                                    }
                                    span.onclick = function() 
                                    {
                                        modal.style.display = "none";
                                    }
                                    window.onclick = function(event) 
                                    {
                                        if (event.target == modal)
                                            modal.style.display = "none";
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page = "includes/footer.jsp" /> 

    </body>

</html>