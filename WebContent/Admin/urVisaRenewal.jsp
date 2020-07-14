<%@ page language="java" import="java.sql.*,joseph.Database" errorPage="" %>
<html>
<head>
<title>Visa Processing</title>
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
				<td width="*" height="100%">
					<table width="100%" height="20">
						<tr>
                <td width="100%" height="20"><font color="#0000FF"><strong><a href="VisaRenewal.jsp">View 
                  Unread VisaRenewal</a></strong></font></td>
              </tr>
					</table>
					<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr bgcolor="#0000ff"> 
                <td width="80" height="20" align="center" bgcolor="#0000CC"><strong><font color="#ffffff">EmpID</font></strong></td>
                <td width="120" align="left" bgcolor="#0000CC"><strong><font color="#ffffff">Name</font></strong></td>
                <td width="100" align="center" bgcolor="#0000CC"><strong><font color="#ffffff">Designation</font></strong></td>
                <td bgcolor="#0000CC"><strong><font color="#ffffff">Details</font></strong></td>
                <td width="100" align="center" bgcolor="#0000CC"><strong><font color="#ffffff">Date</font></strong></td>
                <td width="50" align="center" bgcolor="#0000CC"><strong><font color="#ffffff">Mark 
                  as </font></strong></td>
              </tr>
			  <%
			  	Database con=new Database();
				ResultSet rs=con.getResultSet("select c.RenID,b.ApplnID,a.EmpID,a.EmpName,a.Designation,c.Details,c.Date from EmpDetails a,ApplicationEntry b,Renewal c where b.ApplnID=c.ApplnID and a.EmpID=b.EmpID and c.Status='Read' order by c.Date desc");
				int i=0;
				while(rs.next()){
					String RenID=rs.getString("RenID");
					String ApplnID=rs.getString("ApplnID");
					String EmpID=rs.getString("EmpID");
					String EmpName=rs.getString("EmpName");
					String Design=rs.getString("Designation");
					String Detail=rs.getString("Details");
					String date=rs.getString("Date").substring(0,10);
					String bgColor="";
					if(i==0){
						bgColor="#ffffff";
						i=1;
					}else{
						bgColor="#E7EDFF";
						i=0;
					}
			  %>
              <tr bgcolor="<%= bgColor %>"> 
                <td width="80" align="center" valign="top"><%= EmpID %></td>
                <td height="25" valign="top"><%= EmpName %></td>
                <td align="center" valign="top"><%= Design %></td>
                <td valign="top"> &nbsp; <%= Detail %></td>
                <td align="center" valign="top"><%= date %></td>
                <td align="center" valign="top"><a href="../staRead?RenID=<%= RenID %>"><font color="#0000FF">Unread</font></a></td>
              </tr>
			  <%
			  	}
			  %>
              <tr> 
                <td width="60" align="center" valign="top">&nbsp;</td>
                <td height="100%" valign="top">&nbsp;</td>
                <td align="center" valign="top">&nbsp;</td>
                <td valign="top">&nbsp;</td>
                <td align="center" valign="top">&nbsp;</td>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
            </table>
				</td>
			</tr>
		</table>

	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr>
</table>
</body>
</html>
