<%
    if(session.getAttribute("id")==null)
        response.sendRedirect("index.jsp");
%>

<!DOCTYPE <!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>IIEST Elective Allotment - Reset Password</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
        <script src="main.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="signup.css">
    </head>
    
    <body>
        
        <jsp:include page = "includes/header.jsp"/>
        
        <nav class="navbar navbar-inverse">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="https://www.iiests.ac.in" target="_blank">IIEST</a></li>
                    <li><a href="#">Page 2</a></li>
                    <li><a href="#">Page 3</a></li>
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
                                    <h4>Reset Password.</h4>
                                </p>
                            </div>
                            <div class="panel-body">
                                <form method="post" action="reset_password_script.jsp">
                                    <div class="form-group">
                                        <input type="password" class="form-control" placeholder="Old Password" name="old_password" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" placeholder="New Password" name="new_password" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" placeholder="Retype New Password" name="new_password_re" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Reset Password</button>
                                </form>
                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page = "includes/footer.jsp" />

    </body>

</html>