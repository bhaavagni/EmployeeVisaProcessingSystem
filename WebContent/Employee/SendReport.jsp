<%@ page language="java" import="java.sql.*,joseph.Database" errorPage="" %>
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
					<jsp:include page="menu.jsp" flush="true" />
				</td>
				<td width="*" height="100%" valign="top"><br><br>
					<script language="JavaScript">
						function Validate(){
							var docF=document.f1;
							if(docF.txtReport.value==""){
								alert("Plz Enter Report Details.");
								docF.txtReport.focus();
								return false;
							}
							if(docF.txtReport.value.length>299){
								alert("Report Details cannot exceed 300 Character.");
								docF.txtReport.focus();
								return false;
							}
							return true;
						}
					</script>
					<form name="f1" method="post" action="../Reports" onSubmit="return Validate();">
					<table width="100%">
						<tr>
                  <td width="200"><font color="#001967"><strong>Send Reports</strong></font></td>
                  <td width="*"></td></tr>
						<tr>

						<% 
							HttpSession Usession=request.getSession(false);
							String EmpID=Usession.getAttribute("Ses_ID").toString();
							String ApplnID=null;
							Database con=new Database();
							ResultSet rs=con.getResultSet("select ApplnID from ApplicationEntry where EmpID='"+EmpID+"' and OnsiteDeparture='yes' and OnsiteArrival='no'");	
							if(rs.next()){ 
								ApplnID=rs.getString("ApplnID");
						%>					
                  <td align="right" valign="top"><font color="#001967">Report 
                    Message : </font></td>
                  <td><textarea name="txtReport" cols="40" rows="4" id="txtReport"></textarea></td></tr>
						<tr><td height="20"></td><td></td></tr>
						<tr><td height="*"></td><td><input type="submit" value="   Submit   "> <input type="hidden" name="ApplnID" value="<%= ApplnID %>" ></td></tr>
						<%
							}else{
						%>
						<tr><td height="*"></td><td>You Can't Send Report, Sorry</td></tr>
						<%
							}							
						%>
					</table>
					</form>
				</td>
			</tr>
		</table>

	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr>
</table>


</body>
</html>
