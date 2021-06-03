<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<!DOCTYPE <!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>IIEST Elective Allotment - View Submission</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
        <script src="main.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="fill_choices.css">
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
            String query = "SELECT * FROM students where id = "+enrol_id;

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
            Statement st = con.createStatement();

            ResultSet rs, rs2, rs3;
            rs = st.executeQuery(query);
            
            rs.next();
            String semester = rs.getString("semester");
            String department = rs.getString("department");
            String name = rs.getString("name");

            String query2 = "SELECT * FROM preferences where id = "+enrol_id;
            rs2 = st.executeQuery(query2);
            String ch;

            if (rs2.next()) 
            {
        %>
                <div class="container content">
                    <h3><%= name%></h3>
                    <h5>Enrollment ID : <%= enrol_id%></h5>
                    <h5>Department : <%= department %> &nbsp Semester : <%= semester %></h5>
                    <h2>Choice Submission</h2>
                    <table class="table table-striped table-bordered">
                        <tbody>
                            <tr>
                                <th>
                                    Choice Number
                                </th>
                                <th>
                                    Subject Code
                                </th>
                                <th>
                                    Subject Name
                                </th>
                            </tr>
                            <%
                                for(int i=0; i<8; i+=1)
                                {
                            %>
                                    <tr>
                                        <th>
                                            <%= i+1%> 
                                        </th>
                                        <th>
                                            
                                            <%
                                                rs2 = st.executeQuery(query2);
                                                rs2.next();
                                                ch = rs2.getString("C"+Integer.toString(i+1));
                                                if(ch!= null)
                                                    out.println(ch);
                                                else
                                                    out.println("-");
                                            %>
                                        </th>
                                        <th>
                                            <%
                                                if(ch!= null)
                                                {
                                                    String query3 = "SELECT * FROM electives where subject_code = '"+ch+"'";
                                                    rs3 = st.executeQuery(query3); 
                                                    rs3.next();
                                                    out.println(rs3.getString("subject_name"));
                                                }
                                                else
                                                    out.println("-");
                                            %>
                                        </th>
                                    </tr>
                            <%        
                                }
                            %>
                        </tbody>
                    </table>
                    <button class="btn btn-dark">
                        <a href="post_st_login.jsp">Back</a>
                    </button>
                </div>
        <%    
            } 
            else
            {
                out.println("You have not filled any choices. Please fill your choices first");
        %>
                <a href="post_st_login.jsp">Return</a>
        <%              
            }
        %>
        
        <jsp:include page = "includes/footer.jsp"/>

    </body>

</html>