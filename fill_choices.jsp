<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import = "java.util.ArrayList" %> 
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
                    <li><a href="reset_password.jsp">Reset Password</a></li>>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href = "logout_script.jsp"><span class = "glyphicon glyphicon-log-out"></span> Log out</a></li>
                </ul>
            </div>
        </div> 
        
        <%
            String enrol_id = (String)session.getAttribute("id");
            String query = "SELECT * FROM students where id = "+enrol_id;
            String query1 = "SELECT * FROM preferences where id = "+enrol_id;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
            Statement st = con.createStatement();

            ResultSet rs, rs1;
            rs1 = st.executeQuery(query1);
            String name = "";
            ArrayList al  = new ArrayList();
            ArrayList al2 = new ArrayList();

            if(rs1.next())
            {
                out.println("You have already Frozen your choice.");
        %>
                <a href="view_submission.jsp">View Submission</a>
        <%        
            }
            else
            {
                rs = st.executeQuery(query);
                if(rs.next())
                {
                    String semester = rs.getString("semester");
                    String department = rs.getString("department");
                    name = rs.getString("name");

                    query = "SELECT * FROM electives where semester = "+semester;
                    ResultSet rs2;
                    rs2 = st.executeQuery(query);

                    int i=0;
                    
                    while(rs2.next())
                    {
                        if(rs2.getString(department).equals("1"))
                        {
                            al.add(rs2.getString("subject_code"));
                            al2.add(rs2.getString("subject_name"));
                        }
                    }
                }
                else
                {
                    response.sendRedirect("post_st_login.jsp");
                }

        %>
                <div class="container content">
                    <h3><% out.println(name); %></h3>
                    <h5>Enrollment ID : <%= session.getAttribute("id")%></h5>
                    
                    <h5>Top 8 Choices will be considered only.</h5>
                    <table id = "table_1" class="table table-striped table-bordered">
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
                                <th>

                                </th>
                            </tr>
                            <%
                                for(int j=0; j<al.size(); j+=1)
                                {
                            %>
                                    <tr>
                                        <th>
                                            <%= j+1%> 
                                        </th>
                                        <th>
                                            <%= al.get(j)%>
                                        </th>
                                        <th>
                                            <%= al2.get(j)%>
                                        </th>
                                        <th>
                                            <button class="btn btn-primary" onclick="swap(<%=j+1%>)" ><span class = "glyphicon glyphicon-arrow-up"></span>Move Up</button>
                                        </th>

                                    
                                    </tr>
                                    <script>
                                        function swap(j)
                                        {
                                            if(j!=1)
                                            {
                                                var x = document.getElementById("table_1").rows[j].cells;
                                                var y = document.getElementById("table_1").rows[j-1].cells;
                                                var z = x[1].innerHTML
                                                var z2 = x[2].innerHTML;
                                                x[1].innerHTML = y[1].innerText;
                                                y[1].innerHTML = z;
                                                x[2].innerHTML = y[2].innerText;
                                                y[2].innerHTML = z2
                                            }
                                        }
                                    </script>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <form action="freeze_script.jsp" method="get">
                        <button type="submit" id="freeze" class="btn btn-danger" onclick="convert('table_1')" name="x">Freeze</button>
                    </form>
                    <button class="btn btn-dark" onclick="location.href = 'post_st_login.jsp'">
                        Back
                    </button>
                    
                    <script>
                        function convert(tab)
                        {
                            //alert(tab);
                            var tabLength = document.getElementById(tab).rows.length;
                            var i=0;
                            var tabData = '';
                            var tabArr=new Array();
                            for(i=1; i<tabLength; i+=1)
                                tabData+=document.getElementById(tab).rows[i].cells[1].innerText+',';
                            tabArr = tabData.split(',')
                            document.getElementById("freeze").value = tabArr; 
                            //alert(tabArr[1]);
                        }
                    </script>
                    
                </div>
        <%
            }
        %>
        
        <jsp:include page = "includes/footer.jsp"/>

    </body>

</html>