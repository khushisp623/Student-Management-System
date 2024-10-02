<%@ page import="java.sql.*,java.util.*" %>
<html>
<head>
    <title>Search Record</title>
    <link rel="stylesheet" href="pagestyle.css" type="text/css">
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 8px;
        }
    </style>
</head>
<body>
    <h2>Search Student Record</h2>
    <form method="post">
        <table>
            <tr>
                <td>Enter Roll No to Search:</td>
                <td><input type="text" name="rollno"></td>
            </tr>
        </table>
        <input type="submit" value="Search">
    </form>

    <%-- Search Logic --%>
    <%
        if(request.getMethod().equalsIgnoreCase("post")) {
            String rollno = request.getParameter("rollno");
            
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "username", "password");
                
                String sql = "SELECT * FROM student WHERE rollno=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, rollno);
                
                rs = ps.executeQuery();
                
                out.println("<table>");
                out.println("<tr><th>Roll No</th><th>Name</th><th>Course</th><th>Branch</th><th>Semester</th></tr>");
                int r = 0;
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString(1) + "</td>");
                    out.println("<td>" + rs.getString(2) + "</td>");
                    out.println("<td>" + rs.getString(3) + "</td>");
                    out.println("<td>" + rs.getString(4) + "</td>");
                    out.println("<td>" + rs.getString(5) + "</td>");
                    out.println("</tr>");
                    r++;
                }
                out.println("</table>");
                
                if (r == 0) {
                    out.println("No Record Found");
                }
                con.close();
            }
            catch(Exception e)
            {
                out.println(e.toString());    
            }
        }
    %>
</body>
</html>
