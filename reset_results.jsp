<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import = "java.util.ArrayList" %>
<%
    if(session.getAttribute("id")!="111111111")
        response.sendRedirect("index.jsp");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
    Statement st = con.createStatement();
    
    ArrayList al  = new ArrayList();
    String query = "SELECT * FROM electives";
    ResultSet rs;
    rs = st.executeQuery(query);

    int rs1 = 0;
    int count = 0;
    while(rs.next())
    {
        String sub_code = rs.getString("subject_code");
        sub_code = sub_code.replaceAll("[^a-zA-Z0-9]+","");
        al.add(sub_code);
        count = count+1;
    }
    
    for(int i=0; i<count; i++)
    {
        rs1 = st.executeUpdate("DELETE FROM "+al.get(i));
    }

    rs1 = st.executeUpdate("DELETE FROM allotment");
    if (rs1>0) 
    {
        out.println("Results have been Reset.");
        out.println("<a href='post_admin_login.jsp'>Return</a>");
    } 
    else 
    {
        out.println("Results have already been Reset.");
        out.println("<a href='post_admin_login.jsp'>Return</a>");
    }
%>