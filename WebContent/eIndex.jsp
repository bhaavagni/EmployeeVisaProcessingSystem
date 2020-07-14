<%@ page language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Visa Processing</title>
<script language="JavaScript">
	function submitF(){
		var docF=document.f1;
		if(docF.uname.value==""){
			alert("Enter User Name");
			docF.uname.focus();
			return false;
		}
		if(docF.pass.value==""){
			alert("Enter Password");
			docF.pass.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form name="f1" action="LoginValidation" method="post" onSubmit="return submitF();">
<table width="900" height="100%" align="center">
	<tr><td height="100" width="100%"><img src="images/banner.jpg"></td></tr>
	<tr>
      <td width="100%" height="*" align="center"> <font color="#FF0000"><strong>'User 
        Name or Password Not Correct. Please Try Again'</strong></font> 
        <table width="250" border="0">
			<tr>
            <td height="30"><U><B>Login</B></U></td>
          </tr>
			<tr><td width="100%">
				<table width="100%" border="0">
					<tr>
                  <td height="30" align="right" width="100"><font color="#001967">User 
                    Name</font><font color="#0000FF"> : </font></td>
                  <td><input type="text" name="uname"></td></tr>
					<tr>
                  <td height="30" align="right"><font color="#001967">Password 
                    : </font></td>
                  <td><input type="password" name="pass"></td></tr>
				</table>
			</td></tr>
			<tr>
            <td height="30" align="center"><input type="submit" value="   Submit   ">&nbsp;&nbsp;<input type="reset" value="   Clear   "></td>
          </tr>
		</table>
	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="General/footer.jsp" flush="true" /></td></tr>
</table>
</form>
</body>
</html>
