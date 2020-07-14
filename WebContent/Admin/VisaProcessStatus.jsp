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
				<td width="*" height="100%" valign="top">
					<table width="100%" height="20">
						<tr>
                <td height="20" width="100%"><a href="cVisaProcessStatus.jsp">View 
                  Current Visa Status</a></td>
              </tr>
					</table>
					
            <table width="100%" height="*" border="1">
              <tr bgcolor="#0000cc"> 
                <td width="100" height="20"><font color="#ffffff"><strong>EmpID</strong></font></td>
                <td><font color="#ffffff"><strong>Name</strong></font></td>
                <td><font color="#ffffff"><strong>Country</strong></font></td>
                <td><font color="#ffffff"><strong>Visa Type</strong></font></td>
                <td width="100"><font color="#ffffff"><strong>From</strong></font></td>
                <td width="100"><strong><font color="#ffffff">To</font></strong></td>
              </tr>
              <%
	Database con=new Database();
	ResultSet rs=con.getResultSet("select a.EmpID,a.EmpName,a.Designation,b.ApplnID,b.Country,b.Type,e.F_Date f_date,f.F_Date t_date from EmpDetails a,ApplicationEntry b,OnsiteDeparture e,OnsiteArrival f where a.EmpID=b.EmpID and e.ApplnID=b.ApplnID and f.ApplnID=b.ApplnID order by t_date desc");
	int i=0;
	while(rs.next()){
		String EmpID=rs.getString("EmpID");
		String EmpName=rs.getString("EmpName");
		String Designation=rs.getString("Designation");
		String ApplnID=rs.getString("ApplnID");
		String Country=rs.getString("Country");
		String Type=rs.getString("Type");
		String Date_f=rs.getString("f_date");
		String Date_t=rs.getString("t_date");
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
                <td height="20"><a href="fVisaProcessStatus.jsp?ApplnID=<%= ApplnID %>" target="_blank"><%= EmpID %></a></td>
                <td><%= EmpName %></td>
                <td><%= Country %></td>
                <td><%= Type %></td>
                <td><%= Date_f %></td>
                <td><%= Date_t %></td>
              </tr>
              <%
							}
							con.closeResultSet();
						%>
              <tr>
                <td height="*"></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
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
