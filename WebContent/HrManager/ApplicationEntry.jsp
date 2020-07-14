<%@ page language="java" import="java.sql.*,joseph.Database" errorPage="" %>
<html>
<head>
<title>Visa Processing</title>
<script language="JavaScript">
	function enableTime(){
		var docF=document.f1;
		docF.time.value=1;
		
		docF.time.disabled=false;
		docF.time.select();
		//alert("Hai");
	}
	function disableTime(){
		var docF=document.f1;
		docF.time.value=0;
		docF.time.disabled=true;
		//alert(docF.r1[0].value+" "+docF.r1[1].value);
		//alert("Hai");
	}
	
	function Validate(){
		var docF=document.f1;
		if(docF.EmpID.value==""){
			alert("Plz Select Employee");
			docF.EmpID.focus();
			return false;
		}
		if(docF.r1[0].checked==false && docF.r1[1].checked==false){
			alert("Plz select how Many OnSites");
			docF.r1[0].focus();
			return false;
		}
		if(docF.count.value==""){
			alert("Plz Enter Country for Onsite");
			docF.count.focus();
			return false;
		}
		if(docF.type.value==""){
			alert("Plz Select Type of Visa");
			docF.type.focus();
			return false;
		}
		docF.time.disabled=false;
		return true;
	}
</script>
</head>
<body>
<form name="f1" action="../ApplicationEntry" method="post" onSubmit="return Validate();">
<table width="900" height="100%" align="center">
	<tr><td height="100" width="100%"><jsp:include page="../General/header.jsp" flush="true" /></td></tr>
	<tr><td width="100%" height="*" align="center">
		<table width="100%" height="100%" border="0">
			<tr>
				<td width="175" height="100%" valign="top">
					<jsp:include page="menu.jsp" flush="true" />
				</td>
				
				<td width="100%" height="100%" valign="top"><br><br>
				
					<table width="100%" border="0">
						<tr>
                  <td width="200"><font color="#001967"><strong>Application Entry</strong></font></td>
                  <td width="*"></td></tr>
						<tr>
                  <td align="right"><font color="#001967">EmpID :</font> </td>
                  <td>
							<select name="EmpID">
								<option value="">..Select..</option>
								<% 
									Database con=new Database();
									ResultSet rs=con.getResultSet("select EmpID,EmpName from EmpDetails where EmpID not in (select distinct(EmpID) from ApplicationEntry where OnsiteArrival='no')");
									while(rs.next()){
										String EmpID=rs.getString("EmpID");
										String EmpName=rs.getString("EmpName");
								%>
									<option value="<%= EmpID %>"><%= EmpID %> &nbsp; <%= EmpName %></option>
								<% } %>
							</select>
						</td></tr>
						<tr>
                  <td align="right"><font color="#001967">New To Onsite :</font> 
                  </td>
                  <td><input name="r1" type="radio" onClick="disableTime()" value="0"> Yes &nbsp; <input name="r1" type="radio" onClick="enableTime()" value="1"> No <input name="time" type="text" size="3" maxlength="3"> Times</td></tr>
						<tr>
                  <td align="right"><font color="#001967">Country Applying : </font></td>
                  <td><input name="count" type="text" id="count"></td></tr>
						<tr>
                  <td align="right"><font color="#001967">Type Of Visa : </font></td>
                  <!--<td>
							<select name="type">
								<option value="">..Select..</option>
								<option value="Tourist Visa">Tourist Visa</option>
								<option value="Business Visa">Business Visa</option>
								<option value="Visa">Visa</option>
							</select>
						</td>-->
						<td>
							<input type="text" name='type' id='type' >
						</td>
						</tr>
						<tr><td align="right" height="20"><td></td></tr>
						<tr><td align="right"><input type="reset" value="   Reset   "></td><td><input type="submit" value="   Submit   "></td></tr>
					</table>
				
				</td>
			</tr>
		</table>

	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr>
</table>

</form>
</body>
</html>
