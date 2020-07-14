<%@ page language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Visa Processing</title>
<script language="JavaScript">
	function Validate(){
		var docF=document.f1;
		if(docF.name.value==""){
			alert("Plz Enter the Name");
			docF.name.focus();
			return false;
		}
		if(docF.d.value=="" || docF.m.value=="" || docF.y.value==""){
			alert("Plz Specify your database in the correct format.");
			if(docF.d.value=="")
				docF.d.focus();
			else if(docF.m.value=="")
				docF.m.focus();
			else
				docF.y.focus();					
			return false;		
		}
		if(docF.email.value==""){
			alert("Enter Email ID");
			docF.email.focus();
			return false;
		}
		if(docF.phno.value==""){
			alert("Enter Phone Number");
			docF.phno.focus();
			return false;
		}
		if(isNaN(docF.phno.value)){
			alert(" Plz Enter Phone Number in Correct Format");
			docF.phno.select();
			docF.phno.focus();
			return false;
		}
		if(docF.add.value==""){
			alert("Enter Address");
			docF.add.focus();
			return false;
		}
		if(docF.add.value.length>=200){
			alert("Address Should not Exceeds 200 Character");
			docF.add.select();
			docF.add.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form name="f1" action="../newEmploy" onSubmit="return Validate();">
<table width="900" height="100%" align="center">
	<tr><td height="100" width="100%"><jsp:include page="../General/header.jsp" flush="true" /></td></tr>
	<tr><td width="100%" height="*" align="center">
		<table width="100%" height="100%" border="0">
			<tr>
				<td width="175" height="100%" valign="top">
					<jsp:include page="EmployMenu.jsp" flush="true" />
				</td>
				<td width="100%" height="100%" align="center" valign="top"><br><br>
					<table width="100%" border="0">
						<tr>
                <td width="200" align="left"><font color="#001967"><strong>Add
                  New Employee</strong></font></td>
				   <td align="left" width="*"></td></tr>
						<tr>
                <td width="200" align="right"><font color="#001967">Emp ID :</font> 
                </td>
				<td align="left"><input name="empid" type="text" id="empid"></td></tr>
                <td align="left" width="*"></td></tr>
						<tr>
                <td width="200" align="right"><font color="#001967">Name :</font> 
                </td>
                <td align="left"><input name="empname" type="text" id="empname"></td></tr>
                <tr><td width="200" align="right"><font color="#001967">Password
                  :</font> </td>
                <td align="left"><input name="password" type="password" id="password"></td></tr>
						
					<tr>
                <td width="200" align="right"><font color="#001967">Designation
                  : </font></td>
                <td align="left"><input name="designation" type="text" id="designation" ></td></tr>
						<tr>
                <td width="200" align="right"><font color="#001967">Passport Number 
                  : </font></td>
                <td align="left"><input name="passno" type="text" id="passno"></td></tr>
                <td width="200" align="right" valign="top" height="20">&nbsp;</td>
                <td align="left">&nbsp;</td>
              </tr>
						<tr><td width="200" align="right"><input type="submit" value="   Submit   "></td><td align="left"> <input type="reset" value="   Clear   "> </td></tr>
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
