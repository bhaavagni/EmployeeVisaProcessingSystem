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
                <td height="20" width="100%"><a href="VisaProcessStatus.jsp">View 
                  Finished Visa Status</a></td>
              </tr>
					</table>
					
            <table width="100%" height="*" border="1">
              <tr bgcolor="#0000cc"> 
                <td width="69" height="20"><font color="#ffffff"><strong>EmpID</strong></font></td>
                <td width="110"><font color="#ffffff"><strong>Name</strong></font></td>
                <td width="113"><font color="#ffffff"><strong>Country</strong></font></td>
                <td width="76"><font color="#ffffff"><strong>Visa Type</strong></font></td>
                <td width="60"><font color="#ffffff"><strong>Enquiry</strong></font></td>
                <td width="68"><strong><font color="#ffffff"><strong>Interview</strong></font></strong></td>
                <td width="51" align="left"><font color="#ffffff"><strong>Results</strong></font></td>
                <td width="53" align="center"><font color="#ffffff"><strong>Depart</strong></font></td>
              </tr>
              <%
							Database con=new Database();
							ResultSet rs=con.getResultSet("select a.EmpID,a.EmpName,b.Country,b.Type,b.Enquiry,b.Interview,b.Results,b.OnsiteDeparture from EmpDetails a,ApplicationEntry b where a.EmpID=b.EmpID and b.OnsiteArrival='No'");
							int i=0;
							while(rs.next()){
								String EmpID=rs.getString("EmpID");
								String EmpName=rs.getString("EmpName");
								String Country=rs.getString("Country");
								String Type=rs.getString("Type");
								String Enquiry=rs.getString("Enquiry");
								String Interview=rs.getString("Interview");
								String Results=rs.getString("Results");
								String OnsiteDeparture=rs.getString("OnsiteDeparture");
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
                <td height="20"><%= EmpID %></a></td>
                <td><%= EmpName %></td>
                <td><%= Country %></td>
                <td><%= Type %></td>
                <td><%= Enquiry %></td>
                <td><%= Interview %></td>
                <td><%= Results %></td>
                <td><%= OnsiteDeparture %></td>
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
