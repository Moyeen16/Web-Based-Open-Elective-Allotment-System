<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%
    int enrol_id = Integer.parseInt(request.getParameter("enrol_id"));
    String email = request.getParameter("email");    
    String password = request.getParameter("password");
    String password_re = request.getParameter("password_re");
    long contact = Long.parseLong(request.getParameter("contact"));
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("select * from users where id='" + enrol_id +"'");
        if (rs.next()) 
        {
            out.println("ID already exists");
            response.sendRedirect("index.jsp");
        } 
        else 
        {
            if(password.equals(password_re))
            {
                try
                {
                    String query = "insert into users (id, email, contact, password) values ('" + enrol_id + "' , " + "'" +email + "' , " + contact + " , '" + password + "')";
                    int rs1 = st.executeUpdate(query);
                    session.setAttribute("id",Integer.toString(enrol_id));
                    response.sendRedirect("post_st_login.jsp");
                }
                catch(Exception e1)
                {
                    out.println(e1.getMessage());
                }
            }
            else
            {
                response.sendRedirect("signup.jsp");
            }
        }
    }
    catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
%>