<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.*,joseph.Database"%>


<%@ page import="java.util.Vector"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="validate.js"></script>



	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">

</HEAD>

<BODY class=SC>

<table width="900" height="100%" align="center">
	<tr><td height="100" width="100%"><jsp:include page="../General/header.jsp" flush="true" /></td></tr>
	<tr><td width="100%" height="*" align="center">
		<table width="100%" height="100%" border="0">
			<tr>
				<td width="175" height="100%" valign="top">
				<jsp:include page="EmployMenu.jsp" flush="true" />
				</td><td width="100%" height="100%" align="center" valign="top"><br><br>
					<table width="100%" border="0">
						<tr><td width="200" align="left"><font color="#001967"><strong>View Employees</strong></font></td>
                <td align="left" width="*"></td></tr>
						<tr>



<%

	
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
                        Database con=new Database();
			
                        
			String Query = "Select * from empdetails order by `EmpId`";
			rs = con.getResultSet(Query);
			%>
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">EmpID</th><th align="left">EmpName</th><th align="left">Designation</th><th align="left">PassportNo</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= '<%=(rCount%2!=0)? "row_even" : "row_odd"%>'>
						<td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td>
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><tr class= "row_even"><td colspan=5>Sorry No records Found</td></tr><% }
			
			
			
		}catch(Exception e){
			
			
			
			throw new Exception(e);
		}
	
%>
</BODY>
</table>

 </td>
			</table>
				
				</td>
			</tr>
		
	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr>
</table>
</BODY>
