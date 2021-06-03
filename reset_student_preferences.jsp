<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import = "java.util.ArrayList" %>
<%
    if(session.getAttribute("id")!="111111111")
        response.sendRedirect("index.jsp");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
    Statement st = con.createStatement();

    int rs1 = st.executeUpdate("DELETE FROM preferences");
    if (rs1>0) 
    {
        out.println("Students preferences have been Reset.");
        out.println("<a href='post_admin_login.jsp'>Return</a>");
    } 
    else 
    {
        out.println("Preferences have already been Reset.");
        out.println("<a href='post_admin_login.jsp'>Return</a>");
    }
%>