<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<html>
   <body>
        <%
		Connection con=null;
		Statement st;
		ResultSet rs;
		try
		{
		    Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","khushi23");
			st=con.createStatement();
			String sql="select * from student";
			rs=st.executeQuery(sql);
			%>
			<table width="600px" align="center"border="2">
		      <tr>
			    <td colspan="5" style="background-color:black;color:white"><center>Student Records</center></td>
			  </tr>
			  <tr style="background-color:maroon ;color:white">
			    <th>Roll_no</th><th>Name</th><th>Course</th><th>Branch</th><th>Semester</th>
			  </tr>
			<%
			while(rs.next())
			{
				%>
				<tr>
				   <td><%=rs.getInt(1)%></td>
				   <td><%=rs.getString(2)%></td>
				   <td><%=rs.getString(3)%></td>
				   <td><%=rs.getString(4)%></td>
				   <td><%=rs.getInt(5)%></td>
				</tr>
				<%
			}
		}catch(Exception e)
		{
		    out.print(e.toString());
		}
		con.close();
		%>
		</table>
   </body>
</html>
