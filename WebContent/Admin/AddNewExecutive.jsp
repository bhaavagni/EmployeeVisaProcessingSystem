<%@ page language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Visa Processing</title>

</head>
<body>
<form name="f1" action="../newExecutive" onSubmit="return Validate();">
<table width="900" height="100%" align="center">
	<tr><td height="100" width="100%"><jsp:include page="../General/header.jsp" flush="true" /></td></tr>
	<tr><td width="100%" height="*" align="center">
		<table width="100%" height="100%" border="0">
			<tr>
				<td width="175" height="100%" valign="top">
					<jsp:include page="menu.jsp" flush="true" />
				</td>
				<td width="300"><font color="#001967"><strong>Sucessfully Created New Executive</strong></font></td>
				</table>
				
				</td>
			</tr>
		
	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr>
</table>