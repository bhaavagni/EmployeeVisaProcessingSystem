<%@ page language="java" import="java.lang.*,java.sql.*,joseph.Database" %>
<html>
<head>
<title>Visa Processing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<table width="900" height="100%" align="center">
	<tr><td height="100" width="100%"><jsp:include page="../General/header.jsp" flush="true" /></td></tr>
	<tr><td width="100%" height="*" align="center">
		<table width="100%" height="100%" border="0">
			<tr>
				<td width="175" height="100%" valign="top">
					<jsp:include page="EmployMenu.jsp" flush="true" />
				</td>
				
				<td width="*" height="100%" align="center" valign="top"><br><br>
					<script language="JavaScript">
						function Validate(){
							var docF=document.f1;
							if(docF.ExeID.value==""){
								alert("Plz Select Employee to Delete.");
								docF.ExeID.focus();
								return false;
							}
							else if(confirm("Conform delete Execute : "+docF.ExeID.value)){
								return true;
							}
							return false;
						}
					</script>
					<form name="f1" action="../delEmploy" onSubmit="return Validate();" method="post">
             
			  <font color="#001967">Select Employ To Delete : </font>
              <%  
							Database con=new Database();
							ResultSet rs=con.getResultSet("select EmpID,EmpName from empdetails");
						%>
              <select name="ExeID">
							<option value="">..Select..</option>
							<% 
								while(rs.next()){
								String ID=rs.getString("EmpID");
								String Name=rs.getString("EmpName");
							%>
							<option value="<%= ID %>"><%= ID %>&nbsp;<%= Name %></option>
							<% 
								}
							%>
						</select><br><br><br>
						<input type="submit" value="   Delete   ">
						</form>
				</td>
			</tr>
		</table>

	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr>
</table>


</body>
</html>
