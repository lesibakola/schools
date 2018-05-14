<%-- 
    Document   : Add
    Created on : Sep 30, 2017, 8:56:56 PM
    Author     : ROG
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Comments</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <a href="index.jsp">Home Page</a>
        <script type="text/javascript">
            function validateForm()
            {
                var a=document.forms["Form"]["fname"].value;
                var b=document.forms["Form"]["cdate"].value;
                var c=document.forms["Form"]["comment"].value;
                var d=document.forms["Form"]["DropDown"].value;
                var e=document.forms["Form"]["email"].value;
                if (a==null || a=="",b==null || b=="",c==null || c=="",d==null || d=="",e==null || e=="")
                {
                    alert("Please Fill All Required Field");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <center><h1>Add User Comments</h1></center>
        <form onsubmit="return validateForm()" name="Form" action="AddInsert.jsp" method="POST">
            <center><table cellpadding="5" border="1">
                <tr>
                    <th style="text-align: right">Name:</th>
                    <td><input type="text" name="fname" size="40"></td>
                </tr>
                <tr>
                    <th style="text-align: right">Date:</th>
                    <td><input type="date" name="cdate" value="<%= new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH).format(new Date())%>" size="40"></td>
                </tr>
                <tr>
                    <th style="text-align: right">Comments:</th>
                    <td><textarea name="comment" rows="3" cols="38"></textarea></td>
                </tr>
                <tr>
                    <th style="text-align: right">Category:</th>
                    <td>
                        <select name="DropDown">
                            <option value="Childhood">Childhood Friend</option>
                            <option value="Schoolmate">School Mate</option>
                            <option value="Collegemate">College Mate</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th style="text-align: right">Email:</th>
                    <td><input type="text" name="email" size="40"></td>
                </tr>
                <tr>
                    <td colspan="2"><center><input type="submit" value="Submit"></center></td>
                </tr>
            </table></center>
    </body>
</html>
