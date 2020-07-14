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
				<% 			HttpSession Usession=request.getSession(true);
							String EmpID=Usession.getAttribute("Ses_ID").toString(); 
				%>
				<table width="100%">
					<tr>
                <td height="20" width="100%"><font color="#001697"><strong>Current 
                  Visa Status</strong></font></td>
              </tr>
					<tr><td width="100%">
					
					
					
					<%	try{ %>


            <table width="100%" height="*" border="1">
              <tr bgcolor="#0000cc"> 
                <td width="113"><font color="#ffffff"><strong>Country</strong></font></td>
                <td width="76"><font color="#ffffff"><strong>Visa Type</strong></font></td>
                <td width="60"><font color="#ffffff"><strong>Enquiry</strong></font></td>
                <td width="68"><strong><font color="#ffffff"><strong>Interview</strong></font></strong></td>
                <td width="51" align="left"><font color="#ffffff"><strong>Results</strong></font></td>
                <td width="53" align="center"><font color="#ffffff"><strong>Depart</strong></font></td>
              </tr>
              <%
							Database con=new Database();
							ResultSet rs=con.getResultSet("select b.Country,b.Type,b.Enquiry,b.Interview,b.Results,b.OnsiteDeparture from ApplicationEntry b where b.EmpID=\'"+EmpID+"\' and b.OnsiteArrival='No'");
							int i=0;
							while(rs.next()){
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
                <td height="20"><%= Country %></td>
                <td><%= Type %></td>
                <td><%= Enquiry %></td>
                <td><%= Interview %></td>
                <td><%= Results %></td>
                <td><%= OnsiteDeparture %></td>
              </tr>
              <%			}
							con.closeResultSet();
				%>
            </table>
					<% }catch(Exception e){ } %>
					
					
					 
					
					
					
					</td></tr>
					<tr>
                <td height="20" width="100%"><font color="#001697"><strong>Finished 
                  Visa Status</strong></font></td>
              </tr>
					<tr><td width="100%">
					<% try{ %>
					
					
					<table width="100%" height="*" border="1">
              <tr bgcolor="#0000cc"> 
                <td  height="20"><font color="#ffffff"><strong>Country</strong></font></td>
                <td><font color="#ffffff"><strong>Visa Type</strong></font></td>
                <td><font color="#ffffff"><strong>From</strong></font></td>
                <td><strong><font color="#ffffff">To</font></strong></td>
              </tr>
              <%
							Database con=new Database();
							ResultSet rs=con.getResultSet("select b.ApplnID,b.Country,b.Type,e.F_Date f_date,f.F_Date t_date from ApplicationEntry b,OnsiteDeparture e,OnsiteArrival f where b.EmpID=\'"+EmpID+"\' and e.ApplnID=b.ApplnID and f.ApplnID=b.ApplnID order by t_date desc");
							int i=0;
							while(rs.next()){
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
                <td height="20"><a href="fVisaProcessStatus.jsp?ApplnID=<%= ApplnID %>" target="_blank"><%= Country %></a></td>
                <td><%= Type %></td>
                <td><%= Date_f %></td>
                <td><%= Date_t %></td>
              </tr>
              <%
							}
							con.closeResultSet();
						%>
		</table>
					
					
					<% }catch(Exception e){} %>
					</td></tr>
					<tr><td height="100%" width="100%"></td></tr>
				</table>
				</td>
			</tr>
		</table>

	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr>
</table>


</body>
</html>
