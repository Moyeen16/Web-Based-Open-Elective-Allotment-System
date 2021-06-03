<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import = "java.util.ArrayList" %> 
<%
    if(session.getAttribute("id")==null)
        response.sendRedirect("index.jsp");
%>
<!DOCTYPE <!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>IIEST Elective Allotment - View Result</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
        <script src="main.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="view_result.css">
    </head>
    
    <body>
    	
        <jsp:include page = "includes/header.jsp"/>
        
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
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
            Statement st = con.createStatement();

            ResultSet rs, rs1, rs2;

            String query = "SELECT * FROM students where id = "+enrol_id;
            String query1 = "SELECT * FROM allotment where id = "+enrol_id+";";

            rs = st.executeQuery(query);
            rs.next();
            String name = rs.getString("name");
            String department = rs.getString("department");
            int semester = rs.getInt("semester");   

            rs1 = st.executeQuery(query1);
            if(rs1.next())
            {
                String sub_code = rs1.getString("subject_code");
                String query2 = "SELECT subject_name from electives where subject_code = '"+sub_code+"';";
                rs2 = st.executeQuery(query2);
                rs2.next();
                String sub_name = rs2.getString("subject_name");

        %>
                <div class="container content">
                    <h3><%= name%></h3>
                    <h5>Enrollment ID : <%= enrol_id%></h5>
                    <h5>Department : <%= department %> &nbsp Semester : <%= semester %></h5>
                    <div class="inner"></div>
                        <h1>Allotment Result</h1>
                        <p>
                            Congratulations.<br>
                            You have been alloted " <%= sub_code %> : <%= sub_name %>. "<br>
                        </p>
                    </div>
                    <div class="inner">
                        <button class="btn btn-primary" onclick="location.href = 'post_st_login.jsp'">
                            Back
                        </button>
                    </div>
                </div>
        <%
            }
            else
            {
        %>
                <h5>Results have not been published yet.</h5>
                <a href="post_st_login.jsp">Return</a>
        <%
            }
        %>
        
        <jsp:include page = "includes/footer.jsp"/>

    </body>

</html>