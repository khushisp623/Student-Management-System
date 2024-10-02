<%@ page import="java.sql.*,java.util.*" %>
<html>
<head>
    <title>Update Record</title>
    <link rel="stylesheet" href="style1.css">
</head>
<body>
    <form method="post">
        <table>
            <tr>
                <td>Roll No:</td>
                <td><input type="text" name="rollno"></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Course:</td>
                <td><input type="text" name="course"></td>
            </tr>
            <tr>
                <td>Branch:</td>
                <td><input type="text" name="branch"></td>
            </tr>
            <tr>
                <td>Semester:</td>
                <td><input type="text" name="sem"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update"></td>
            </tr>
        </table>
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("post")) {
            String rollno = request.getParameter("rollno");
            String name = request.getParameter("name");
            String course = request.getParameter("course");
            String branch = request.getParameter("branch");
            String sem = request.getParameter("sem");
            if (rollno == null || rollno.isEmpty()) {
                out.println("Roll No is required");
            } else {
                Connection con = null;
                PreparedStatement pstmt = null;

                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "khushi23");
                    
                    String sql = "UPDATE student SET rollno=?,name=?,course=?, branch=?, sem=? WHERE rollno="+rollno;
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, name);
                    pstmt.setString(2, course);
                    pstmt.setString(3, branch);
                    pstmt.setString(4, sem);
                    pstmt.setString(5, rollno);

                    int rowsAffected = pstmt.executeUpdate();
                    if(rowsAffected > 0) {
                        out.println("Record updated successfully");
                    } else {
                        out.println("No record found with Roll No: " + rollno);
                    }
                } catch(Exception e) {
                    out.println(e.toString());    
                } finally {
                    // Close resources
                    try {
                        if (pstmt != null) pstmt.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        out.println(e.toString());
                    }
                }
            }
        }
    %>
</body>
</html>
