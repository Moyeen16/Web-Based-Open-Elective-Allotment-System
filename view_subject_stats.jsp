<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import = "java.util.ArrayList" %>
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

                String subject_code = request.getParameter("subject_code");
                String table_name = subject_code.replaceAll("[^a-zA-Z0-9]+","");
                String query = "SELECT * FROM electives WHERE subject_code = '"+subject_code+"'";
                String query1 = "SELECT * FROM "+table_name;

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
                Statement st = con.createStatement();

                ResultSet rs, rs1;
                rs = st.executeQuery(query);
                if(rs.next())
                {
                    String subject_name = rs.getString("subject_name");
                

            %>

                    <div class="inner">
                        <h4>Allotment Results for</h4>
                        <h5><%= subject_name %> (<%= subject_code %>)</h5>
                        
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
                                    rs1 = st.executeQuery(query1);
                    
                                    while(rs1.next())
                                    {
                                %>
                                        <tr>
                                            <th>
                                                <%= rs1.getString("enrolment_id")%> 
                                            </th>
                                            <th>
                                                <%= rs1.getString("department")%> 
                                            </th>
                                            <th>
                                                <%= rs1.getString("semester")%> 
                                            </th>
                                        </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <button class="btn btn-primary" onclick="location.href = 'post_admin_login.jsp'">
                        Back
                    </button>
            <%
                }
                else
                {
            %>
                    No result found for the Entered Subject Code.
                    <a href="view_stats.jsp">Return</a>
            <%    
                }
            %>
        </div>
        
        <jsp:include page = "includes/footer.jsp"/>

    </body>

</html>