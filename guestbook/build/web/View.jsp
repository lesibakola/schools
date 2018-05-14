<%-- 
    Document   : View
    Created on : Sep 30, 2017, 8:56:50 PM
    Author     : ROG
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comments</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <a href="index.jsp">Home Page</a>
    </head>
    <body>
         <center><h1>View All Comments</h1> </center>
         <center><table bgcolor="lightblue" border="2" cellpspacing="10" cellpadding="5">
            <tr>
                <th>No.</th>
                <th>Name</th>
                <th>Date</th>
                <th>Comment</th>
                <th>Category</th>
                <th>Email</th>
            </tr>
            <%
                Connection conn = null;
                Statement st = null;
                ResultSet rs = null;
                int i = 0 ;
                
                System.out.println("-------- MySQL JDBC Connection Testing ------------");

                    try {
                        Class.forName("org.gjt.mm.mysql.Driver").newInstance();
                    } catch (ClassNotFoundException e) {
                        System.out.println("Where is your MySQL JDBC Driver?");
                        e.printStackTrace();
                        return;
                    }

                    System.out.println("MySQL JDBC Driver Registered!");
                try {
                        conn = DriverManager
                                .getConnection("jdbc:mysql://localhost:3306/weddingdbase", "root", "password");

                    } catch (SQLException e) {
                        System.out.println("Connection Failed! Check output console");
                        e.printStackTrace();
                        return;
                    }

                    if (conn != null) {
                        System.out.println("You made it, take control your database now!");
                    } else {
                        System.out.println("Failed to make connection!");
                    }
                    
                    try{
                        st = conn.createStatement();
                        rs = st.executeQuery("SELECT * FROM weddingtable order by date desc");
                        while (rs.next()) {
             %>
                            <tr>
                                <td><%=(++i)%></td>
                               <td><%=rs.getString("fullname")%></td>
                               <td><%=rs.getString("date")%></td>
                               <td><%=rs.getString("comment")%></td>
                               <td><%=rs.getString("category")%></td>
                               <td><%=rs.getString("email")%></td>
                            </tr>
              <%
                        }
                        conn.close(); 
                        rs.close();
                        st.close();
                   }catch(Exception e){ 
                          System.out.println(e);
                   }
               %>
        </table> </center>
    </body>
</html>
