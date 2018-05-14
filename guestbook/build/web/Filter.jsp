<%-- 
    Document   : Filter
    Created on : Sep 30, 2017, 8:57:04 PM
    Author     : ROG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comments Filter</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <a href="index.jsp">Home Page</a>
    </head>
    <body>
        <center><h1>Filter Comments Based On Categories</h1></center>
        <form action="FilterResult.jsp" method="POST">
            <center><table border="0" cellpadding="1">
                <tr>
                    <th colspan="2"><center>List Of Categories</center></th>
                </tr>
                <tr>
                    <td style="text-align: right"><input type="radio" name="search" value="Childhood"></td>
                    <td>Childhood Friends</td>
                </tr>
                <tr>
                    <td style="text-align: right"><input type="radio" name="search" value="Schoolmate"></td>
                    <td>School Mates</td>
                </tr>
                <tr>
                    <td style="text-align: right"><input type="radio" name="search" value="Collegemate"></td>
                    <td>College Mates</td>
                </tr>
                <tr>
                    <td colspan="2"><center><input type="submit" value="Submit"></center></td>
                </tr>
            </table></center>
        </form>
    </body>
</html>
