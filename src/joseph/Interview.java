/*
	Name 		:	S.Joseph Beevin
	Designation	:	Programmer
	Date		:	2006-02-07
	place		:	Horizone Technologies, T.Nagar.


	Project Name 	:	"Visa Processing"
*/

// Package
package joseph;

import java.io.*;
import java.net.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

// Start Of Class
public class Interview extends HttpServlet {

    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

    }

    /** Destroys the servlet.
     */
    public void destroy() {

    }

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        //geting values from HTML pages
					Date sysDate=new Date(System.currentTimeMillis());
		System.out.println("sysDate"+sysDate);
        String ApplnID=request.getParameter("ApplnID");
        String d=request.getParameter("d");
        String m=request.getParameter("m");
        String y=request.getParameter("y");
        String date=y+"-"+m+"-"+d;
        String hr=request.getParameter("hr");
        String mi=request.getParameter("mi");
		String t1=request.getParameter("time");
		String time=hr+" : "+mi+" "+t1;
		String venu=request.getParameter("Venue");

		//get Session String
		HttpSession session=request.getSession(true);
		String ExeID=session.getAttribute("Ses_ID").toString();

        //declaration
		Database con=null;
		ResultSet rs=null;
		String Qry=null;
		String newID=null;

        // Generating Auto ID
        try{
			con=new Database();
			Qry="select max(IntID) from Interview";
			rs=con.getResultSet(Qry);

			if(!rs.next()){
				newID="Int31";
			}else{
				newID=rs.getString(1);
				if(newID==null){
					newID="Int31";
					System.out.println(newID);
				}else{
					newID="Int"+(Integer.parseInt(newID.substring(3,newID.length()))+1);
				}
			}
			con.closeResultSet();
		}catch(Exception e){
			System.out.println("Error While Generating Interview ID : "+e);
		}

		//Inserting Into Tables
		try{
			int no;
			Qry="insert into Interview values('"+newID+"','"+ApplnID+"','"+ExeID+"','"+date+"','"+time+"','"+venu+"','"+sysDate+"')";
			con=new Database();
			no=con.setResultSet(Qry);
			Qry="update ApplicationEntry set Interview='yes' where ApplnID='"+ApplnID+"'";
			no=con.setResultSet(Qry);
			con.closeSetResultSet();
		}catch(Exception e){
			System.out.println("Error While Inserting Interview : "+e);
		}
		response.sendRedirect("HrManager/Interview.jsp");
    }

    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }

}
