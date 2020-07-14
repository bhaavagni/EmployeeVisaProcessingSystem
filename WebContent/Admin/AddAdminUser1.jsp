<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,joseph.Database"%>

<HEAD>
<script LANGUAGE="Javascript" >
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
		function ChkAlphaNumericField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter alphabets or numbers for "+T);return false;}
		}
		function ChkAlphaField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z ]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter text for "+T);return false;}
		}
		function ChkEmailField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9\_\.]{4,25})$/;
			if(!(pattern.test(val)==true)){alert("Please enter valid email for "+T);return false;}
		}
		function ChkDateField(F,T)
		{
			var val = F.value;
		    var pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
		    if(!(pattern.test(val)==true)){alert("Please enter valid date format (yyyy-mm-dd) for "+T);return false;}
		}
		function validate()
		{
			var frm = document.forms(0);
			if(ChkMandatoryField(frm.UserName,'UserName')==false) return false;
			if(ChkEmailField(frm.UserName,'UserName')==false) return false;
			if(ChkMandatoryField(frm.Password,'Old Password')==false) return false;
			if(ChkAlphaNumericField(frm.Password,'Old Password')==false) return false;
                        if(ChkMandatoryField(frm.newPassword,'New Password')==false) return false;
			if(ChkAlphaNumericField(frm.newPassword,'New Password')==false) return false;
			
		}
	</script>
</head>
<body Class="SC">
<FORM NAME="LOGIN" ACTION="AddAdminUser.jsp" METHOD="POST" >

<table width="900" height="100%" align="center">
	<tr><td height="100" width="100%"><jsp:include page="../General/header.jsp" flush="true" /></td></tr>
	<tr><td width="100%" height="*" align="center">
		<table width="100%" height="100%" border="0">
			<tr>
				<td width="175" height="100%" valign="top">
					<jsp:include page="menu.jsp" flush="true" />
				</td>
				
				<td width="*" height="100%">

						<TABLE align=center width="50%">
						<TR class=row_title ALIGN="center">
							   <TH COLSPAN="2"> Create Admin</TH>
						</TR>

						<TR class=row_even>
							<TD>User name</TD>
							<TD><input TYPE=text name=UserName size="8" value=""  class="TextField Medium"></TD>
						</TR>
						<TR class=row_odd>
							<TD>Password</TD>
							<TD><input TYPE=password name=Password  class="TextField Medium"></TD>
						</TR>
						<TR class=row_odd>
							<TD><INPUT TYPE=submit name=submit value="Submit" class=Button>
						</TD>
							<TD><INPUT TYPE=reset name=resett value="Reset"  class=Button> 
						</TD>
						</TR>
						</TABLE>
						 <P align=right><A href="home.jsp" class=genlinks> Home </A></P>
				</td>
			</tr>
		</table>

	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr>
</table>

</FORM>

</BODY>




