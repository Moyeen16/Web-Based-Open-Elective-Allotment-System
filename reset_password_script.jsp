<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%
    if(session.getAttribute("id")==null)
        response.sendRedirect("index.jsp");
%>
<%
    String enrol_id = (String)session.getAttribute("id");
    String old_password = request.getParameter("old_password");
    String new_password = request.getParameter("new_password");
    String new_password_re = request.getParameter("new_password_re");
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("select * from users where id='" + enrol_id +"'");
        if (rs.next()) 
        {
            if(new_password.equals(new_password_re) && rs.getString("password").equals(old_password))
            {
                try
                {
                    String query = "UPDATE users SET password = '" + new_password + "' WHERE id = '"+ enrol_id +"'";
                    int rs1 = st.executeUpdate(query);
                    
                    out.println("Password Successfully Updated. Login Again.");
                    out.println("<a href='logout_script.jsp'>Login</a>");;
                }
                catch(Exception e1)
                {
                    out.println(e1);
                    out.println("Error. Incorrect Credentials. You have been logged out.");
                    out.println("<a href='logout_script.jsp'>Return</a>");;
                }
            }
            else
            {
                out.println("Cant reset. Error. You have been logged out.");
                out.println("<a href='logout_script.jsp'>Return</a>");
            }
        } 
        else 
        {
            out.println("Cant reset. Error. You have been logged out.");
            out.println("<a href='logout_script.jsp'>Return</a>");
        }
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
%>