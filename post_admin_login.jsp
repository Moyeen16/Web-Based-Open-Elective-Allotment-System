<%@ page import ="java.io.*" %>
<%
    if(session.getAttribute("id")!="111111111")
        response.sendRedirect("index.jsp");
%>

<!DOCTYPE <!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>IIEST Elective Allotment - Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
        <script src="main.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="post_admin_login.css">
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
            background-color: #9b87f5;
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
    	
        <div class="navbar navbar-inverse">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="https://www.iiests.ac.in" target="_blank">IIEST</a></li>
                    <li><a href="#">Page 2</a></li>
                    <li><a href="reset_password.jsp">Reset Password</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href = "logout_script.jsp"><span class = "glyphicon glyphicon-log-out"></span> Log out</a></li>
                </ul>
            </div>
        </div> 
        
        <div class="banner_image">
            <div class="container content">
                <div class="row">
                    <div class="inner">
                        <h1>Welcome Admin</h1>
                        <button class="btn btn-primary" onclick="location.href = 'upload_student_data.jsp'">
                            Upload Student Data
                        </button><br><br>
                        <button class="btn btn-primary" onclick="location.href = 'view_electives.jsp'">
                            View Electives
                        </button><br><br>
                        <button class="btn btn-primary" onclick="location.href = 'view_stats.jsp'">
                            View Subject Wise Stat
                        </button><br><br>
                        <button class="btn btn-primary" onclick="location.href = 'generate_result.jsp'">
                            Generate Result
                        </button><br><br>
                        <button class="btn btn-danger" id="myBtn">
                            Reset Student Preferences
                        </button><br><br>
                        <button class="btn btn-danger" onclick="location.href = 'reset_results.jsp'">
                            Reset Results
                        </button>

                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                Are you sure you want to Reset Student Preferences. This action is irreversible.<br> 
                                <button class="btn btn-danger" onclick="location.href = 'reset_student_preferences.jsp'">Yes</button>
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
        
        <jsp:include page = "includes/footer.jsp" />

    </body>

</html>