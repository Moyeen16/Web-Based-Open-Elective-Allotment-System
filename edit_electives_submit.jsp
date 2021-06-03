<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%
    if(session.getAttribute("id")!="111111111")
        response.sendRedirect("index.jsp");

    String sub_code = request.getParameter("sub_code");    
    String sub_name = request.getParameter("sub_name");
    String offered_by = request.getParameter("offered_by");
    int AE = Integer.parseInt(request.getParameter("AE"));    
    int CE = Integer.parseInt(request.getParameter("CE"));
    int CST = Integer.parseInt(request.getParameter("CST"));
    int EE = Integer.parseInt(request.getParameter("EE"));    
    int ETC = Integer.parseInt(request.getParameter("ETC"));
    int IT = Integer.parseInt(request.getParameter("IT"));
    int ME = Integer.parseInt(request.getParameter("ME"));    
    int MET = Integer.parseInt(request.getParameter("MET"));
    int MIN = Integer.parseInt(request.getParameter("MIN"));
    int total_seats = Integer.parseInt(request.getParameter("total_seats"));    
    int semester = Integer.parseInt(request.getParameter("semester"));

    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
    Statement st = con.createStatement();
    
    String query = "SELECT * FROM electives WHERE subject_code = '"+sub_code+"'";
    ResultSet rs;
    rs = st.executeQuery(query);

    PreparedStatement ps = null;

    if(rs.next())
    {
        query = "UPDATE electives SET subject_name = '" + sub_name + "' ,  offered_by = '" + offered_by + "' ,  AE = '" + AE + "' , CE = '" + CE + "' , CST = '" + CST + "' , EE = '" + EE + "' , ETC = '" + ETC + "' , IT = '" + IT + "' , ME = '" + ME + "' , MET = '" + MET + "' , MIN = '" + MIN + "' , total_seats = '" + total_seats + "' , semester = '" + semester + "' WHERE subject_code = '"+sub_code+"'";
        int i = st.executeUpdate(query);

        if(i>0)
        {
            out.println("Update Successful.");
            
%>  
            <a href="post_admin_login.jsp">Return.</a>
<%
        }
        else
        {
            out.println("Update Unsuccessful.");
%>
            <a href="post_admin_login.jsp">Return.</a>
<%
        }
    }
    else
    {
        String table_name = sub_code.replaceAll("[^a-zA-Z0-9]+","");
        String query2 = "CREATE TABLE "+table_name+" (enrolment_id INT , department varchar(100), semester INT, primary key(enrolment_id));";
        int rs2 = st.executeUpdate(query2);

        query = "INSERT INTO electives (subject_code, subject_name, offered_by, AE, CE, CST, EE, ETC, IT, ME, MET, MIN, total_seats, semester) VALUES ('" + sub_code + "' , '" + sub_name + "' , '" + offered_by + "' , '" + AE + "' , '" + CE + "' , '" + CST + "' , '" + EE + "' , '" + ETC + "' , '" + IT + "' , '" + ME + "' , '" + MET + "' , '" + MIN + "' , '" + total_seats + "' , '" + semester + "')";
        int rs1 = st.executeUpdate(query);

        if(rs1>0)
        {
            out.println("Successfully Saved.");
%>  
            <a href="post_admin_login.jsp">Return.</a>
<%
        }
        else
        {
            out.println("Save Unsuccessful.");
%>
            <a href="post_admin_login.jsp">Return.</a>
<%
        }
    }
%>