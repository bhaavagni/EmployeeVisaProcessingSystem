<%@ page language="java" import="java.sql.*,joseph.Database" errorPage="" %>
<html>
<head>
<title>Visa Processing</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
<%
String EmpID=request.getParameter("EmpID");
System.out.println("EmpID--->"+EmpID);
String AppID="",ApplnID="",employid="",EmpName="",Designation="",PassportNo="",Country="",Type="",EnqStatus="";
%>
<table width="900" height="100%" align="center">
	<tr><td height="100" width="100%"><jsp:include page="../General/header.jsp" flush="true" /></td></tr>
	<tr><td width="100%" height="*" align="center">
		<table width="100%" height="100%" border="0">
			<tr>
				<td width="175" height="100%" valign="top">
					<jsp:include page="menu.jsp" flush="true" />
				</td>
				
				<td width="*" height="100%" valign="top"><br><br>
					<table width="100%">
					
					<form name="f1" action="../Enquiry"  method="post" >
						<tr>
                  <td width="200"><font color="#001967"><strong>Enquiry Details</strong></font></td>
                  <td width="*"></td></tr>
						
		<td>
			<% try{
		Database con=new Database();
		String qry="select applicationentry.EmpID,applicationentry.ApplnID,empdetails.PassportNo,empdetails.EmpName,empdetails.Designation from applicationentry,empdetails where applicationentry.EmpID='"+EmpID+"'  and applicationentry.EmpID=empdetails.EmpID";
		System.out.println("qry"+qry);
		ResultSet rs=con.getResultSet("select applicationentry.EmpID,applicationentry.ApplnID,applicationentry.Country,empdetails.PassportNo,empdetails.EmpName,applicationentry.Type,applicationentry.Enquiry,empdetails.Designation from applicationentry,empdetails where applicationentry.EmpID='"+EmpID+"'  and applicationentry.EmpID=empdetails.EmpID and Enquiry!='yes'");
		while(rs.next()){
			System.out.println("in while loop");
			 employid=rs.getString("EmpID");
			System.out.println("employid"+employid);
			 ApplnID=rs.getString("ApplnID");
			 EmpName=rs.getString("EmpName");
	Designation=rs.getString("Designation");
	PassportNo=rs.getString("PassportNo");
	Country=rs.getString("Country");
	Type=rs.getString("Type");
	EnqStatus=rs.getString("Enquiry");
	 } 
	}
	catch(Exception e){
	System.out.println(e);
	}
	%>


							
	<tr>
  <td align="right"><font color="#001967">Application ID   </font><td><font color="#0000FF">:&nbsp;<%=ApplnID%><font color="#001967"></td>
  <Input type=hidden name=ApplnID value='<%=ApplnID%>'>
				</td></tr><tr>
  <td align="right"><font color="#001967">Employee ID  </font><td><font color="#0000FF">:&nbsp;<%=employid%><font color="#001967"></td>
				</td></tr>
				<tr>
  <td align="right"><font color="#001967">Employee Name   </font><td><font color="#0000FF">:&nbsp;<%=EmpName%><font color="#001967"></td>
				</td></tr>
				<tr>
  <td align="right"><font color="#001967">Designation   </font><td><font color="#0000FF">:&nbsp;<%=Designation%><font color="#001967"></td>
				</td></tr>
				<tr>
  <td align="right"><font color="#001967">Passport No </font><td><font color="#0000FF">:&nbsp;<%=PassportNo%><font color="#001967"></td>
				</td></tr>
				<tr>
  <td align="right"><font color="#001967">Country Applying  </font><td><font color="#0000FF">:&nbsp;<%=Country%><font color="#001967"></td>
				</td></tr>
				<tr>
  <td align="right"><font color="#001967">Type of Visa  </font><td><font color="#0000FF">:&nbsp;<%=Type%><font color="#001967"></td>
				</td></tr>
 <td align="right"><font color="#001967"> </font><td><font color="#0000FF">&nbsp;<%=EnqStatus%>&nbsp;Enquiry Have Been Made.<font color="#001967"></td>
				</td></tr>
  <td align="right"><font color="#001967">Query</font><td><font color="#0000FF">:&nbsp;<textarea name=Query></textarea><font color="#001967"></td>
				</td></tr>
<td align="right"><font color="#001967">Report</font><td><font color="#0000FF">:&nbsp;<textarea name=Report></textarea><font color="#001967"></td>
				</td></tr>
<td align="right"><font color="#001967">Status</font><td><font color="#0000FF">:&nbsp;<INPUT type="radio" value="yes" name="Status">Finished Enquiry&nbsp;&nbsp;<INPUT type=radio value="no" name="Status">More Enquiry</TD><font color="#001967"></td>
				</td></tr>


		<tr><td height="20"></td><td width="*"></td></tr>
		<tr><td></td><td width="*"><input type="submit" value="   Submit   "></td></tr>
		</form>
		</table>
					
				</td>
			</tr>
		</table>

	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr>
</table>


</body>
</html>
