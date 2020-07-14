<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.*,joseph.Database"%>
<%@ page errorPage="errorPage.jsp" %>
<HEAD>
	<script LANGUAGE="Javascript" SRC="validate.js"></script>
	<LINK href="styles/styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class=Main>
<table width="900" height="100%" align="center">
	<tr><td height="100" width="100%"><jsp:include page="../General/header.jsp" flush="true" /></td></tr>
	<tr><td width="100%" height="*" align="center">
		<table width="100%" height="100%" border="0">
			<tr>
				<td width="175" height="100%" valign="top">
				<jsp:include page="menu.jsp" flush="true" />
				</td><td width="100%" height="100%" align="center" valign="top"><br><br>
					<table width="100%" border="0">
						<tr><td width="200" align="left"><font color="#001967"><strong>Enquiry Status Report</strong></font></td>
                <td align="left" width="*"></td></tr>
						<tr>
 
            
<%
String URL = "GenericAvsBReport.jsp?TableName=kbdata&VerCategory=ContentType&HorCategory=Status&Title=Status Report";

//Connection con=null;
Statement stmt=null;
ResultSet rs=null;
ResultSet VerRs=null,HorRs=null;
int iCount=0;
int jCount=0;
int[] HorTotal= new int[100];
int Total=0;
int Gtotal=0;
int pos=0;
int[][] HorCount= new int[100][100];
String TableName = "applicationentry";
String VerCategory = "enquiry";
String HorCategory = "empId";
String Condition = "";
String Title = "Status Report";

String[] VerCat = new String[500];
String[] HorCat = new String[500];
int Vi=0,Hi=0,VCount=0,HCount=0;
String VerQry = "Select distinct `"+VerCategory+"` from "+TableName;
String HorQry = "Select distinct `"+HorCategory+"` from "+TableName;
System.out.println(VerQry+","+HorQry);

try
{
	/*Getting the connection variable from session*/
				Database con=new Database();
				//stmt =  con.createStatement();

				//VerRs  = stmt.executeQuery(VerQry);
				System.out.println("-1-"+VerQry);
				VerRs = con.getResultSet(VerQry);
				
				//Getting Vertical category list
				while(VerRs.next()){
					VerCat[Vi] = VerRs.getString(1);
					System.out.println(VerCat[Vi]);
					Vi++;
				}
				VCount= Vi;
				VerRs.close();
				System.out.println("-2-"+HorQry);
				//HorRs  = stmt.executeQuery(HorQry);
				HorRs = con.getResultSet(HorQry);
				//Getting Horizontal category list
				while(HorRs.next()){
					HorCat[Hi] = HorRs.getString(1);
					System.out.println(HorCat[Hi]);
					Hi++;
				}
				HCount= Hi;
				HorRs.close();

				//stmt.close();
				HorCat = HorCat;
				//stmt =  con.createStatement();
for(int i=0;i<20;i++){
	for(int j=0;j<20;j++)
		HorCount[i][j]=0;
	HorTotal[i]=0;
}


	for(iCount=0;iCount<VCount;iCount++)
	{
		String TempQry ="SELECT Count(`"+VerCategory+"`),`"+HorCategory+"` FROM "+TableName+" WHERE (`"+VerCategory+"`='"+VerCat[iCount]+"' ) GROUP BY `"+HorCategory+"`" ;
		if(!(Condition==null||Condition.equals("")))
		{
			TempQry = "SELECT Count(`"+VerCategory+"`),`"+HorCategory+"` FROM "+TableName+" WHERE (`"+VerCategory+"`='"+VerCat[iCount]+"' ) and "+Condition+" GROUP BY `"+HorCategory+"`" ;
		}
		System.out.println("--"+TempQry);
		rs = con.getResultSet(TempQry);
//		rs = stmt.executeQuery(TempQry);

	
		if(rs!=null)
		{
			while(rs.next())
			{
				
				String myLoc=rs.getString(2);
				int iTemp=rs.getInt(1);
				//Finding the position of location read from database in HorCat array
				for(int j=0;j<HCount;j++){
					if(HorCat[j].equalsIgnoreCase(myLoc)){
						pos=j;
						break;
					}
				}
					HorCount[pos][jCount]=iTemp;
					HorTotal[pos] += HorCount[pos][jCount];
			}
		 	jCount=jCount+1;
		}
		rs.close();	
	}
		for(int ii=0;ii<HCount;ii++){
			System.out.println("Total-:---"+HorTotal[ii]);
		}

}
catch(Exception e)
{
	
	%><%=e%><%
}
if(rs!=null){
%>
<table width="60%" align=center >
<tr class=row_title>
	<th class=row_title><FONT COLOR="#FF0000">Employ IDs/Enquiry Status</FONT></th>
		<%
			for(iCount=0;iCount<VCount;iCount++){
			%><th class=row_title><%=VerCat[iCount]%></th><%
			}
		%>
	<th class=row_title>Total</th>
</tr>
	<%
	for(int k=0;k<HCount;k++){
	%><tr class=row_odd><th class=results><%=HorCat[k]%></th><%
		for(iCount=0;iCount<VCount;iCount++)
		{
			%><td class=results align="center"><%=HorCount[k][iCount]%></td><%
		}
		%><td class=results align="center"><font color="red"><b><%=HorTotal[k]%></b></font></td><%
	}
	%>
</tr>
<tr class=row_odd>
	<th class=results><font color="Red">Total</font></th>
	<%
		for(iCount=0;iCount<VCount;iCount++)
		{
			for(int k=0;k<HCount;k++){
				Total+=HorCount[k][iCount];
			}
			Gtotal=Gtotal+Total;
			%><td class=results align="center"><font color="Red"><b><%=Total%></b></font></td><%
			Total=0;
		}
		%><td class=results align="center"><font color="Red"><b><%=Gtotal%></b></font></td><%
	%>
</tr>
<%
}
else
{
	/*To write to the server if the resultset is null*/
	System.out.println("Result set is null\n");

}


%>
</table>

 </td>
			</table>
				
				</td>
			</tr>
		
	</td></tr>
	<tr><td height="50" align="center"><jsp:include page="../General/footer.jsp" flush="true" /></td></tr>
</table>
</BODY>
