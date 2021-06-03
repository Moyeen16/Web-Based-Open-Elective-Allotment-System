<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import = "java.util.ArrayList" %>
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
        
        <div class="container content">
        <%
            if(session.getAttribute("id")!="111111111")
                response.sendRedirect("index.jsp");

            
            String query = "SELECT * FROM electives";

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
            Statement st = con.createStatement();

            ArrayList al  = new ArrayList();
            ArrayList al2  = new ArrayList();

            ResultSet rs, rs2, rs3;
            rs = st.executeQuery(query);
            while(rs.next())
            {
                String sub_code = rs.getString("subject_code");
                al2.add(sub_code);
                al.add(sub_code.replaceAll("[^a-zA-Z0-9]+",""));
            }
            
            for(int i=0; i<al.size(); i++)
            {

                String query1 = "SELECT * FROM "+al.get(i);
        %>

                <div class="inner">
                    <h4>Subject Code : <%= al2.get(i)%></h4>
                    
                    <table id = "table_1" class="table table-striped table-bordered table-condensed">
                        <tbody>
                            <tr>
                                <th>
                                    Enrolment ID
                                </th>
                                <th>
                                    Department
                                </th>
                                <th>
                                    Semester
                                </th>
                            </tr>
                            <%
                                rs2 = st.executeQuery(query1);
                
                                while(rs2.next())
                                {
                            %>
                                    <tr>
                                        <td>
                                            <%= rs2.getString("enrolment_id")%> 
                                        </td>
                                        <td>
                                            <%= rs2.getString("department")%> 
                                        </td>
                                        <td>
                                            <%= rs2.getString("semester")%> 
                                        </td>
                                    </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <br><br>
        <%    
            }
        %>
            <button class="btn btn-primary" onclick="location.href = 'post_admin_login.jsp'">
                Back
            </button>
            <button class="btn btn-primary" id="myBtn">
                View Result for a Subject
            </button>

            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <form method="post" action="view_subject_stats.jsp">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Subject Code" name="subject_code" required>
                        </div>
                        <button type="submit" class="btn btn-primary">View Result</button>
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
        
        
        <jsp:include page = "includes/footer.jsp"/>

    </body>

</html>