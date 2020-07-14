<%@ page language="java" import="java.sql.*,joseph.Database" errorPage="" %>
<% 
	String ApplnID=request.getParameter("ApplnID");
	Database con=new Database();
	String Qry="select a.EmpID,a.EmpName,a.Designation,a.PassportNo,b.NoOfTimeToOnsite,b.Country,b.Type,b.Date ApDate,c.EnteredBy InEnBy,c.IntDate,c.IntTime,c.Venu,c.Date InDate,d.EnteredBy ReEnBy,d.Result,d.Date ReDate,e.EnteredBy DeEnBy,e.TicketNo DeTiNo,e.FlightNo DeFiNo,e.F_From DeFrom,e.Via DeVia,e.F_To DeTo,e.F_Date DeFDate,e.F_Time DeFTime,e.Date DeDate,f.EnteredBy ArEnBy,f.TicketNo ArTiNo,f.FlightNo ArFiNo,f.F_From ArFrom,f.Via ArVia,f.F_To ArTo,f.F_Date ArFDate,f.F_Time ArFTime,f.Date ArDate from EmpDetails a,ApplicationEntry b,Interview c,Results d,OnsiteDeparture e,OnsiteArrival f where a.EmpID=b.EmpID and c.ApplnID=\'"+ApplnID+"\' and d.ApplnID=\'"+ApplnID+"\' and e.ApplnID=\'"+ApplnID+"\' and f.ApplnID=\'"+ApplnID+"\' and b.ApplnID=\'"+ApplnID+"\'";
	ResultSet rs=con.getResultSet(Qry);
	String EmpID=null,EmpName=null,Designation=null,PassportNo=null,NoOfTimeToOnsite=null,Country=null,Type=null,ApDate=null,InEnBy=null,IntDate=null,IntTime=null,Venu=null,InDate=null,ReEnBy=null,Result=null,ReDate=null,DeEnBy=null,DeTiNo=null,DeFiNo=null,DeFrom=null,DeVia=null,DeTo=null,DeFDate=null,DeFTime=null,DeDate=null,ArEnBy=null,ArTiNo=null,ArFiNo=null,ArFrom=null,ArVia=null,ArTo=null,ArFDate=null,ArFTime=null,ArDate=null;
	int i=0;
	if(rs.next()){
		EmpID=rs.getString("EmpID");	
		EmpName=rs.getString("EmpName");	
		Designation=rs.getString("Designation");	
		PassportNo=rs.getString("PassportNo");	
		NoOfTimeToOnsite=rs.getString("NoOfTimeToOnsite");	
		Country=rs.getString("Country");	
		Type=rs.getString("Type");	
		ApDate=rs.getString("ApDate");	
		InEnBy=rs.getString("InEnBy");	
		IntDate=rs.getString("IntDate");	
		IntTime=rs.getString("IntTime");	
		Venu=rs.getString("Venu");	
		InDate=rs.getString("InDate");	
		ReEnBy=rs.getString("ReEnBy");	
		Result=rs.getString("Result");	
		ReDate=rs.getString("ReDate");	
		DeEnBy=rs.getString("DeEnBy");	
		DeTiNo=rs.getString("DeTiNo");	
		DeFiNo=rs.getString("DeFiNo");	
		DeFrom=rs.getString("DeFrom");	
		DeVia=rs.getString("DeVia");	
		DeTo=rs.getString("DeTo");	
		DeFDate=rs.getString("DeFDate");	
		DeFTime=rs.getString("DeFTime");	
		DeDate=rs.getString("DeDate");	
		ArEnBy=rs.getString("ArEnBy");	
		ArTiNo=rs.getString("ArTiNo");
		ArFiNo=rs.getString("ArFiNo");	
		ArFrom=rs.getString("ArFrom");	
		ArVia=rs.getString("ArVia");	
		ArTo=rs.getString("ArTo");	
		ArFDate=rs.getString("ArFDate");	
		ArFTime=rs.getString("ArFTime");
		ArDate=rs.getString("ArDate");	
	}
	con.closeResultSet();
%>

<table width="100%" border="1">
	<tr>
    <td bgcolor="#0000cc"><font color="#ffffff"><strong>Genral Details</strong></font></td>
  </tr>
	<tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%" align="right"><font color="#001967">Application ID :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= ApplnID %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Employee ID :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= EmpID %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Name : </font></td>
          <td> <font color="#0000FF">&nbsp;<%= EmpName %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Designation : </font></td>
          <td> <font color="#0000FF">&nbsp;<%= Designation %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Passport No : </font></td>
          <td> <font color="#0000FF">&nbsp;<%= PassportNo %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Country :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= Country %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Type Of Visa : </font></td>
          <td> <font color="#0000FF">&nbsp;<%= Type %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Entered By :</font></td>
          <td></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Date : </font></td>
          <td> <font color="#0000FF">&nbsp;<%= ApDate %></font></td>
        </tr>
      </table></td>
  </tr>
	<tr>
    <td bgcolor="#0000cc"><font color="#ffffff"><strong>Enquiry Details</strong></font></td>
  </tr>
	<tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr align="center" bgcolor="#E7EDFF">
          <td width="120" align="left"><font color="#001967"><strong>Enquiry Date</strong></font></td>
          <td width="150" align="left"><font color="#001967"><strong>Entered By</strong></font></td>
          <td align="left"><font color="#001967"><strong>Enquiry</strong></font></td>
          <td align="left"><font color="#001967"><strong>Reply</strong></font></td>
        </tr>
        <% 
				con=new Database(); 
				rs=con.getResultSet("select Date,Enteredby,Query,Ans from Enquiry where ApplnID=\'"+ApplnID+"\'");
				while(rs.next()){
		%>
		<tr>
          <td> <font color="#0000FF">&nbsp;<%= rs.getString(1).substring(0,10) %></font></td>
          <td> <font color="#0000FF">&nbsp;<%= rs.getString(2) %></font></td>
          <td> <font color="#0000FF">&nbsp;<%= rs.getString(3) %></font></td>
          <td> <font color="#0000FF">&nbsp;<%= rs.getString(4) %></font></td>
        </tr>
		<% 
		}
		con.closeResultSet();
		%>
      </table></td>
  </tr>	
	<tr>
    <td bgcolor="#0000cc"><font color="#ffffff"><strong>Interview Details</strong></font></td>
  </tr>
	<tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%" align="right"><font color="#001967">Interview Date :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= IntDate %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">InterView Time : </font></td>
          <td> <font color="#0000FF">&nbsp;<%= IntTime %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Interview Venu : </font></td>
          <td> <font color="#0000FF">&nbsp;<%= Venu %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Entered By :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= InEnBy %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Date :</font> </td>
          <td> <font color="#0000FF">&nbsp;<%= InDate %></font></td>
        </tr>
      </table></td>
  </tr>	
	<tr>
    <td bgcolor="#0000cc"><font color="#ffffff"><strong>Result Details</strong></font></td>
  </tr>
	<tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%" align="right"><font color="#001967">Result Detail :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= Result %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Entered By :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= ReEnBy %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Date : </font></td>
          <td> <font color="#0000FF">&nbsp;<%= ReDate %></font></td>
        </tr>
      </table></td>
  </tr>	
	<tr>
    <td bgcolor="#0000cc"><font color="#ffffff"><strong>OnsiteDeparture Details</strong></font></td>
  </tr>
	<tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%" align="right"><font color="#001967">Ticket No :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= DeTiNo %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Flight No :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= DeFiNo %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">From :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= DeFrom %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Via :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= DeVia %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">To : </font></td>
          <td> <font color="#0000FF">&nbsp;<%= DeTo %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Flight Date :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= DeFDate %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Flight Time :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= DeFTime %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Entered By :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= DeEnBy %></font></td>
        </tr>
        <tr>
          <td align="right"><font color="#001967">Date :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= DeDate %></font></td>
        </tr>
      </table></td>
  </tr>	
	<tr>
    <td bgcolor="#0000cc"><font color="#ffffff"><strong>Reports Details</strong></font></td>
  </tr>
	<tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr align="center" bgcolor="#E7EDFF">
          <td width="120"><font color="#001967"><strong>Date</strong></font></td>
          <td align="left"><font color="#001967"><strong>Reports</strong></font></td>
        </tr>
		<%
			con=new Database();
			rs=con.getResultSet("select Date,Reports from Reports where ApplnID=\'"+ApplnID+"\'");
			while(rs.next()){
		%>
        <tr>
          <td> <font color="#0000FF">&nbsp;<%= rs.getString(1).substring(0,10) %></font></td>
          <td> <font color="#0000FF">&nbsp;<%= rs.getString(2) %></font></td>
        </tr>
		<%
			}
			con.closeResultSet();
		%>
      </table></td>
  </tr>	
	<tr>
    <td bgcolor="#0000cc"><font color="#ffffff"><strong>OnSite Arrival</strong></font></td>
  </tr>
	<tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="50%" align="right"><font color="#001967">Ticket No :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= ArTiNo %></font></td>
        </tr>
        <tr> 
          <td align="right"><font color="#001967">Flight No :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= ArFiNo %></font></td>
        </tr>
        <tr> 
          <td align="right"><font color="#001967">From :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= ArFrom %></font></td>
        </tr>
        <tr> 
          <td align="right"><font color="#001967">Via :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= ArVia %></font></td>
        </tr>
        <tr> 
          <td align="right"><font color="#001967">To : </font></td>
          <td> <font color="#0000FF">&nbsp;<%= ArTo %></font></td>
        </tr>
        <tr> 
          <td align="right"><font color="#001967">Flight Date :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= ArFDate %></font></td>
        </tr>
        <tr> 
          <td align="right"><font color="#001967">Flight Time :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= ArFTime %></font></td>
        </tr>
        <tr> 
          <td align="right"><font color="#001967">Entered By :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= ArEnBy %></font></td>
        </tr>
        <tr> 
          <td align="right"><font color="#001967">Date :</font></td>
          <td> <font color="#0000FF">&nbsp;<%= ArDate %></font></td>
        </tr>
      </table></td>
  </tr>	
</table>

