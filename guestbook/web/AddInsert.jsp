<%-- 
    Document   : AddInsert
    Created on : Sep 30, 2017, 11:22:51 PM
    Author     : ROG
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <title>Add New Comment</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    <a href="index.jsp">Home Page</a></br>
        <a href="Add.jsp">Go Back To Add Page</a>
    </head>
    <body>
        <center><h1>New Comment Insertion . . . </h1></center>
        <%
                
                String name = request.getParameter("fname");
                Date cdate = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).parse(request.getParameter("cdate"));
                String comment = request.getParameter("comment");
                String category = request.getParameter("DropDown");
                String email = request.getParameter("email");
                
                Connection conn = null;
                Statement st = null;
                ResultSet rs = null;
                
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
                                .getConnection("jdbc:mysql://localhost:3306/weddingdbase", "root", "root");

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
                        PreparedStatement prest = conn.prepareStatement("INSERT into weddingtable VALUES (?,?,?,?,?)");
                        prest.setString(1, name);
                        prest.setDate(2, new java.sql.Date(cdate.getTime()));
                        prest.setString(3, comment);
                        prest.setString(4, category);
                        prest.setString(5, email);
                        int row = prest.executeUpdate();
                        if(row > 0){ %>
                            </br><h3><center>Successful :)</center></h3>
                       <% } else { %>
                            </br><h3><center>Failed :(</center></h3>
                       <% }
                        conn.close(); 
                        rs.close();
                        st.close();
                   }catch(Exception e){ 
                          System.out.println(e);
                   }
               %>
    </body>
</html>
