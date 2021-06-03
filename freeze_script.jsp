<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%

    String p = request.getParameter("x");
    String enrol_id = (String)session.getAttribute("id");
    String choices[] = new String[8];
    int count=1, start=0;

    for(int i=0; i<p.length() && count<=8; i++)
    {
        if(p.charAt(i)==',')
        {
            choices[count-1] = p.substring(start, i);
            start = i+1;
            count++;
        }
    }

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
    Statement st = con.createStatement();
    
    String query = "";
    if(count==2)
    query = "insert into preferences (id, C1) values ('" + enrol_id + "' , " + "'" + choices[0] + "')";
    else if (count == 3)
    query = "insert into preferences (id, C1, C2) values ('" + enrol_id + "' , " + "'" + choices[0] + "' , '" + choices[1] + "')";
    else if (count == 4)
    query = "insert into preferences (id, C1, C2, C3) values ('" + enrol_id + "' , " + "'" + choices[0] + "' , '" + choices[1] + "' , '" + choices[2] + "')";
    else if (count == 5)
    query = "insert into preferences (id, C1, C2, C3, C4) values ('" + enrol_id + "' , " + "'" + choices[0] + "' , '" + choices[1] + "' , '" + choices[2] + "' , '" + choices[3] + "')";
    else if (count == 6)
    query = "insert into preferences (id, C1, C2, C3, C4, C5) values ('" + enrol_id + "' , " + "'" + choices[0] + "' , '" + choices[1] + "' , '" + choices[2] + "' , '" + choices[3] + "' , '" + choices[4] + "')";
    else if (count == 7)
    query = "insert into preferences (id, C1, C2, C3, C4, C5, C6) values ('" + enrol_id + "' , " + "'" + choices[0] + "' , '" + choices[1] + "' , '" + choices[2] + "' , '" + choices[3] + "' , '" + choices[4] + "' , '" + choices[5] + "')";
    else if (count == 8)
        query = "insert into preferences (id, C1, C2, C3, C4, C5, C6, C7) values ('" + enrol_id + "' , " + "'" + choices[0] + "' , '" + choices[1] + "' , '" + choices[2] + "' , '" + choices[3] + "' , '" + choices[4] + "' , '" + choices[5] + "' , '" + choices[6] + "')";
    else if (count == 9)
        query = "insert into preferences (id, C1, C2, C3, C4, C5, C6, C7, C8) values ('" + enrol_id + "' , " + "'" + choices[0] + "' , '" + choices[1] + "' , '" + choices[2] + "' , '" + choices[3] + "' , '" + choices[4] + "' , '" + choices[5] + "' , '" + choices[6] + "' , '" + choices[7] + "')";

    int rs = st.executeUpdate(query);
    
    if (rs!=0) 
    {
        response.sendRedirect("post_st_login.jsp");
    } 
    else 
    {
        out.println("Invalid Entry <a href='fill_choices.jsp'>Try again</a>");
    }
%>