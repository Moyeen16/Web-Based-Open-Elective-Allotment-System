<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import="java.util.Map" %>
<%@ page import ="java.util.Hashtable" %>
<%@ page import ="java.util.HashMap" %>

<%
    if(session.getAttribute("id")!="111111111")
        response.sendRedirect("index.jsp");

    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Mini_Project", "root", "root");
        Statement st1 = con.createStatement();
        Statement st2 = con.createStatement();
        Statement st3 = con.createStatement();

        ResultSet rs, rs1, rs2, rs3;
        int rs4;


        HashMap<String, Integer> hmap = new HashMap<String, Integer>();
        String query = "SELECT * FROM electives WHERE semester=5;";
        rs = st1.executeQuery(query);
        while(rs.next())
        {
            String name = rs.getString("subject_code");
            name = name.replaceAll("[^a-zA-Z0-9]+","");
            int seats = rs.getInt("total_seats");
            hmap.put(name, seats);
        }
        
        String query1 = "SELECT * FROM students WHERE semester=5 ORDER BY cgpa DESC;";
        rs1 = st1.executeQuery(query1);

        int enrol_id=0;
        String department="";
        
        while (rs1.next()) 
        {
            enrol_id = rs1.getInt("id");
            department = rs1.getString("department");
            String query2 = "SELECT * FROM preferences WHERE id = '"+enrol_id+"'";
            rs2 = st2.executeQuery(query2);
            //out.println(enrol_id);
            if(rs2.next())
            {
                for(int i=1; i<=8; i++)
                {
                    String ch = rs2.getString("C"+Integer.toString(i));
                    String table_name = ch.replaceAll("[^a-zA-Z0-9]+","");
                    
                    String query3 = "SELECT * FROM electives where subject_code = '"+ch+"';";
                    rs3 = st3.executeQuery(query3);
                    rs3.next();
                    String sub_name = rs3.getString("subject_name");
                    //out.println(filled+" "+hmap.get(table_name)+"<br>");
                    
                    int seat_available = hmap.get(table_name);
                    if(seat_available>0)
                    {
                        String query4 = "INSERT INTO "+table_name+" VALUES ("+enrol_id+", '"+department+"', 5);";
                        rs4 = st3.executeUpdate(query4);
                        out.println(ch+" "+enrol_id+"<br>");
                        String query5 = "INSERT INTO allotment VALUES ("+enrol_id+", '"+ch+"');";
                        rs4 = st3.executeUpdate(query5);
                        hmap.put(table_name, seat_available-1);
                        out.println("Success. <br>");
                        break;
                    }

                }
            }
            else
                continue;
        } 
    }
    catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
    finally
    {
        out.println("<a href='post_admin_login.jsp'>Return</a>");
    }
%>