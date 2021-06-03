<%@ page import ="java.sql.*" %>
<%
    if((String)session.getAttribute("id")==null)
        response.sendRedirect("index.jsp");
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
        <link rel="stylesheet" href="post_st_login.css">
    </head>
    
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
        <%
            
            String enrol_id = (String)session.getAttribute("id");
            String query = "SELECT * FROM students where id = "+enrol_id;

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
            Statement st = con.createStatement();
            String semester, department, name;

            ResultSet rs;
            rs = st.executeQuery(query);
            
            rs.next();
            semester = rs.getString("semester");
            department = rs.getString("department");
            name = rs.getString("name");
        %>
        <div class="banner_image">
            <div class="container content">
                <div class="row">
                    <div class="inner">
                        <h3>Welcome <%= name %></h3>
                        <h5>Enrollment Id : <%= enrol_id %></h5>
                        <h5>Department : <%= department %> &nbsp Semester : <%= semester %></h5>
                        
                        <button class="btn btn-dark" onclick="location.href = 'view_submission.jsp'">
                            View Submission
                        </button><br><br>
                        <button class="btn btn-dark" onclick="location.href = 'fill_choices.jsp'">
                            Fill Choices
                        </button><br><br>
                        <button class="btn btn-success" onclick="location.href = 'view_result.jsp'">
                            View Result
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page = "includes/footer.jsp" />

    </body>

</html>