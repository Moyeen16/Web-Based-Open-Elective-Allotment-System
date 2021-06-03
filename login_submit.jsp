<%@ page import ="java.sql.*" %>
<%
    int enrol_id = Integer.parseInt(request.getParameter("enrol_id"));   
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where id='" + enrol_id + "' and password='" + password + "'");
    if (rs.next()) 
    {
        session.setAttribute("id", rs.getString("id"));
        response.sendRedirect("post_st_login.jsp");
    } 
    else 
    {
        out.println("Invalid password <a href='index.jsp'>Try again</a>");
    }
%>