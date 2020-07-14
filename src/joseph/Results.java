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
public class Results extends HttpServlet {

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
        String res=request.getParameter("res");

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
			Qry="select max(ResID) from Results";
			rs=con.getResultSet(Qry);

			if(!rs.next()){
				newID="Res31";
			}else{
				newID=rs.getString(1);
				if(newID==null){
					newID="Res31";
					System.out.println(newID);
				}else{
					newID="Res"+(Integer.parseInt(newID.substring(3,newID.length()))+1);
				}
			}
			con.closeResultSet();
		}catch(Exception e){
			System.out.println("Error While Generating Results ID : "+e);
		}

		//Inserting Into Tables
		try{
			int no;
			Qry="insert into Results values('"+newID+"','"+ApplnID+"','"+ExeID+"','"+res+"','"+sysDate+"')";
			con=new Database();
			no=con.setResultSet(Qry);
			Qry="update ApplicationEntry set Results='yes' where ApplnID='"+ApplnID+"'";
			no=con.setResultSet(Qry);
			con.closeSetResultSet();
		}catch(Exception e){
			System.out.println("Error While Inserting Results : "+e);
		}
		response.sendRedirect("HrManager/Results.jsp");
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
