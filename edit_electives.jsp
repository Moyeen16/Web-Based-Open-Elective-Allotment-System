<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%
    if(session.getAttribute("id")!="111111111")
        response.sendRedirect("index.jsp");
%>

<!DOCTYPE <!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>IIEST Elective Allotment - Fill Choices</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
        <script src="main.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="view_electives.css">
    </head>
    
    <body>
        
        <jsp:include page = "includes/header.jsp"/>
        
        <div class="navbar navbar-inverse">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="https://www.iiests.ac.in" target="_blank">IIEST</a></li>
                    <li><a href="#">Page 2</a></li>
                    <li><a href="#">Page 3</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href = "logout_script.jsp"><span class = "glyphicon glyphicon-log-out"></span> Log out</a></li>
                </ul>
            </div>
        </div> 
        
        <%
            if(session.getAttribute("id")!="111111111")
                response.sendRedirect("index.jsp");

            String sub_code = request.getParameter("subject_code");

            String query = "SELECT * FROM electives where subject_code = '"+sub_code+"'";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
            Statement st = con.createStatement();

            ResultSet rs;
            rs = st.executeQuery(query);
            if(rs.next())
            {
                String sn = rs.getString("subject_name");
                String sc = rs.getString("subject_code");
        %>
            
            <div class="container content">
                <h3>Electives for B.Tech</h3>
                <h4>Editing Elective : <%= rs.getString("subject_name") %> (<%= rs.getString("subject_code") %>)</h4>
                
                <div class="inner">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="panel panel-primary panel-transparent">
                                    <div class="panel-heading panel-heading">
                                        <p>
                                            <h4>Edit Elective.</h4>
                                        </p>
                                    </div>
                                    <div class="panel-body form-text">
                                        <form method="post" action="edit_electives_submit.jsp">
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Subject Code" name=sub_code value="<%= (String)request.getParameter("subject_code") %>" readonly>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" name=sub_name placeholder="Subject Name" value="<%= rs.getString("subject_name") %>" readonly>
                                            </div>
                                            <div class="form-group" >
                                                <input type="text" class="form-control" name="offered_by" placeholder="Offered By" required>
                                            </div>
                                            <h4>Select 1 if Elective is open to a department else select 0.</h4>
                                            <div class="form-group">
                                                AE &nbsp;
                                                <input class="w3-radio" type="radio" name="AE" value="1">
                                                    <label>1</label>
                                                <input class="w3-radio" type="radio" name="AE" value="0" checked>
                                                    <label>0</label>
                                            </div>
                                            <div class="form-group">
                                                    CE &nbsp;
                                                <input class="w3-radio" type="radio" name="CE" value="1">
                                                    <label>1</label>
                                                <input class="w3-radio" type="radio" name="CE" value="0" checked>
                                                    <label>0</label>
                                            </div>
                                            <div class="form-group">
                                                    CST &nbsp;
                                                    <input class="w3-radio" type="radio" name="CST" value="1">
                                                        <label>1</label>
                                                    <input class="w3-radio" type="radio" name="CST" value="0" checked>
                                                        <label>0</label>
                                            </div>
                                            <div class="form-group">
                                                    EE &nbsp;
                                                <input class="w3-radio" type="radio" name="EE" value="1">
                                                    <label>1</label>
                                                <input class="w3-radio" type="radio" name="EE" value="0" checked>
                                                    <label>0</label>
                                            </div>
                                            <div class="form-group">
                                                    ETC &nbsp;
                                                <input class="w3-radio" type="radio" name="ETC" value="1">
                                                    <label>1</label>
                                                <input class="w3-radio" type="radio" name="ETC" value="0" checked>
                                                    <label>0</label>
                                            </div>
                                            <div class="form-group">
                                                    IT &nbsp;
                                                <input class="w3-radio" type="radio" name="IT" value="1">
                                                    <label>1</label>
                                                <input class="w3-radio" type="radio" name="IT" value="0" checked>
                                                    <label>0</label>
                                            </div>
                                            <div class="form-group">
                                                    ME &nbsp;
                                                <input class="w3-radio" type="radio" name="ME" value="1">
                                                    <label>1</label>
                                                <input class="w3-radio" type="radio" name="ME" value="0" checked>
                                                    <label>0</label>
                                            </div>
                                            <div class="form-group">
                                                    MET &nbsp;
                                                <input class="w3-radio" type="radio" name="MET" value="1">
                                                    <label>1</label>
                                                <input class="w3-radio" type="radio" name="MET" value="0" checked>
                                                    <label>0</label>
                                            </div>
                                            <div class="form-group">
                                                    MIN &nbsp;
                                                <input class="w3-radio" type="radio" name="MIN" value="1">
                                                    <label>1</label>
                                                <input class="w3-radio" type="radio" name="MIN" value="0" checked>
                                                    <label>0</label>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Total Seats" name="total_seats" required>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Semester" name="semester" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Save</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                <button class="btn btn-primary" onclick="location.href = 'view_electives.jsp'">
                    Back
                </button>
            </div>
        <%  }
            else
            {
        %>
                Error. No elective found with the entered Subject Code.<br>
                <a href="view_electives.jsp">Return</a>
        <%
            }
        %>
            

        
        <jsp:include page = "includes/footer.jsp"/>

    </body>

</html>