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
					
					<form name="f1" action="../OnsiteArrival"  method="post" >
						<tr>
                  <td width="200"><font color="#001967"><strong>Onsite Arrival Details</strong></font></td>
                  <td width="*"></td></tr>
						
		<td>
			<% try{
		Database con=new Database();
		String qry="select applicationentry.EmpID,applicationentry.ApplnID,empdetails.PassportNo,empdetails.EmpName,empdetails.Designation from applicationentry,empdetails where applicationentry.EmpID='"+EmpID+"'  and applicationentry.EmpID=empdetails.EmpID";
		System.out.println("qry"+qry);
		ResultSet rs=con.getResultSet("select applicationentry.EmpID,applicationentry.ApplnID,applicationentry.Country,empdetails.PassportNo,empdetails.EmpName,applicationentry.Type,applicationentry.Enquiry,empdetails.Designation from applicationentry,empdetails where applicationentry.EmpID='"+EmpID+"'  and applicationentry.EmpID=empdetails.EmpID and OnsiteArrival='no'");
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
 <td align="right"><font color="#001967">Ticket No  </font><td><font color="#0000FF">:&nbsp;<Input type =text name=ticNo><font color="#001967"></td>
				</td></tr>
<td align="right"><font color="#001967">Flight No  </font><td><font color="#0000FF">:&nbsp;<Input type =text name=fliNo><font color="#001967"></td>
				</td></tr>
<td align="right"><font color="#001967">From  </font><td><font color="#0000FF">:&nbsp;<Input type =text name=from><font color="#001967"></td>
				</td></tr>
<td align="right"><font color="#001967">Via  </font><td><font color="#0000FF">:&nbsp;<Input type =text name=via><font color="#001967"></td>
				</td></tr>
<td align="right"><font color="#001967">To  </font><td><font color="#0000FF">:&nbsp;<Input type =text name=to><font color="#001967"></td>
				</td></tr>
  <td width="200" align="right"><font color="#001967"> Date 
                  :</font> </td>
                <td align="left">
		<% String Month[]={"January","February","March","April","May","June","July","August","September","October","November","December"}; %>
	<select name="d">
		<option value="" >..Date..</option>
		<% for(int i=1;i<32;i++) { %>
		<option value="<%= i %>" ><%= i %></option>
		<% } %>
	</select>
  <select name="m">
		<option value="" >..Month..</option>
		<% for(int i=0;i<12;i++) { %>
		<option value="<%= i+1 %>" ><%= Month[i] %></option>
		<% } %>
  </select>
  <select name="y">
		<option value="" >..Year..</option>
		<% for(int i=2009;i<2020;i++) { %>
		<option value="<%= i %>" ><%= i %></option>
		<% } %>
  </select>
	</td></tr>
<td width="200" align="right"><font color="#001967">Time
                  :</font> </td>
                <td align="left">
		
	<select name="hr">
		<option value="" >..Hours..</option>
		<% for(int i=1;i<13;i++) { %>
		<option value="<%= i %>" ><%= i %></option>
		<% } %>
	</select>
  <select name="mi">
		<option value="" >..Minutes..</option>
		<% for(int i=0;i<60;i++) { %>
		<option value="<%= i+1 %>" ><%= i %></option>
		<% } %>
  </select>
  <select name="time">
		<option value="AM" >AM</option>
		<option value="PM" >PM</option>
		
  </select>
	</td></tr>
<tr>
               


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
