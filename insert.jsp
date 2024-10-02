<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Insert Record</title>
    <link rel="stylesheet" href="style1.css">
</head>
<body>
    <h2>Insert Student Record</h2>
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
        </table>
        <input type="submit" value="Submit">
    </form>

    <%
        if(request.getMethod().equalsIgnoreCase("post")) {
            String rollno = request.getParameter("rollno");
            String name = request.getParameter("name");
            String course = request.getParameter("course");
            String branch = request.getParameter("branch");
            String sem = request.getParameter("sem");
            
            Connection con = null;
            PreparedStatement ps = null;
            
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "khushi23");
                
                String sql = "INSERT INTO student (rollno, name, course, branch, sem) VALUES (?, ?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, rollno);
                ps.setString(2, name);
                ps.setString(3, course);
                ps.setString(4, branch);
                ps.setString(5, sem);
                
                int rowsAffected = ps.executeUpdate();
                
                if(rowsAffected > 0) {
                    out.println("Record inserted successfully");
                } else {
                    out.println("Failed to insert record");
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
