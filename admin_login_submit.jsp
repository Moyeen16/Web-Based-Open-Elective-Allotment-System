<%@ page import ="java.sql.*" %>
<%
    int enrol_id = 111111111;   
    String password = request.getParameter("admin_password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where id='" + enrol_id + "' and password='" + password + "'");
    if (rs.next()) 
    {
        session.setAttribute("id", "111111111");
        response.sendRedirect("post_admin_login.jsp");
    } 
    else 
    {
        out.println("Invalid password <a href='index.jsp'>Try again</a>");
    }
%>