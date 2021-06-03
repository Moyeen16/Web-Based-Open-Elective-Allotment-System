<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%
    if(session.getAttribute("id")!="111111111")
        response.sendRedirect("index.jsp");
%>

<!DOCTYPE <!DOCTYPE html>
<html>

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

            
            String query = "SELECT * FROM electives";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
            Statement st = con.createStatement();

            ResultSet rs, rs2, rs3;
        %>
            
        <div class="container content">
            <h3>Electives for B.Tech</h3>
            <h5>(1 - open to department, 0 - not open to department)</h5>
            
            <table id = "table_1" class="table table-striped table-bordered">
                <tbody>
                    <tr>
                        <th>
                            Subject Code
                        </th>
                        <th>
                            Subject Name
                        </th>
                        <th>
                            Offered By
                        </th>
                        <th>
                            AE    
                        </th>
                        <th>
                            CE
                        </th>
                        <th>
                            CST
                        </th>
                        <th>
                            EE
                        </th>
                        <th>
                            ETC
                        </th>
                        <th>
                            IT
                        </th>
                        <th>
                            ME
                        </th>
                        <th>
                            MET
                        </th>
                        <th>
                            MIN
                        </th>
                        <th>
                            Total Seats
                        </th>
                        <th>
                            Semester
                        </th>
                    </tr>
                    <%
                        rs = st.executeQuery(query);
        
                        while(rs.next())
                        {
                    %>
                            <tr>
                                <th>
                                    <%= rs.getString("subject_code")%> 
                                </th>
                                <th>
                                    <%= rs.getString("subject_name")%> 
                                </th>
                                <th>
                                    <%= rs.getString("offered_by")%> 
                                </th>
                                <th>
                                    <%= rs.getString("AE")%> 
                                </th>
                                <th>
                                    <%= rs.getString("CE")%> 
                                </th>
                                <th>
                                    <%= rs.getString("CST")%> 
                                </th>
                                <th>
                                    <%= rs.getString("EE")%> 
                                </th>
                                <th>
                                    <%= rs.getString("ETC")%> 
                                </th>
                                <th>
                                    <%= rs.getString("IT")%> 
                                </th>
                                <th>
                                    <%= rs.getString("ME")%> 
                                </th>
                                <th>
                                    <%= rs.getString("MET")%> 
                                </th>
                                <th>
                                    <%= rs.getString("MIN")%> 
                                </th>
                                <th>
                                    <%= rs.getString("total_seats")%> 
                                </th>
                                <th>
                                    <%= rs.getString("semester")%> 
                                </th>
                            </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <form method="post" action="edit_electives.jsp">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Subject Code" name="subject_code" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Edit Elective</button>
                    </form>
                </div>
            </div>
            <button class="btn btn-primary" onclick="location.href = 'post_admin_login.jsp'">
                Back
            </button>
            <button class="btn btn-primary" id="myBtn">
                Edit
            </button>
            <button class="btn btn-primary" onclick="location.href = 'insert_new_electives.jsp'">
                Insert New Electives
            </button>
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
        
        <jsp:include page = "includes/footer.jsp"/>

    </body>

</html>
