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
public class ApplicationEntry extends HttpServlet {

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

        // geting Values from HTML Page
		Date sysDate=new Date(System.currentTimeMillis());
		System.out.println("sysDate"+sysDate);
		String EmpID=request.getParameter("EmpID");
		System.out.println("EmpID"+EmpID);
		String r1=request.getParameter("r1");
		String time=request.getParameter("time");
		String count=request.getParameter("count");
		String type=request.getParameter("type");

		//get Session
		HttpSession session=request.getSession(true);
		String ExeID=session.getAttribute("Ses_ID").toString();

        //declaration
		Database con=null;
		ResultSet rs=null;
		String Qry=null;
		String newID=null;

		//Generate Auto ID
		try{
			con=new Database();
			Qry="select max(ApplnID) from ApplicationEntry";
			rs=con.getResultSet(Qry);

			if(!rs.next()){
				newID="Apln331";
			}else{
				newID=rs.getString(1);
				if(newID==null){
					newID="Apln331";
				}else{
					newID="Apln"+(Integer.parseInt(newID.substring(4,newID.length()))+1);

				}
			}
			con.closeResultSet();
		}catch(Exception e){
			System.out.println("Error While Generating Auto ID HrExecutiveID"+e);
		}

        //insert into table Application Entry
        try{
			con=new Database();
			Qry="insert into ApplicationEntry values ('"+newID+"','"+EmpID+"','"+ExeID+"',"+time+",'"+count+"','"+type+"','No','No','No','No','No','No','"+sysDate+"')";
			System.out.println("query"+Qry);
			int n=con.setResultSet(Qry);
			con.closeSetResultSet();
		}catch(Exception e){
			System.out.println("Error While inserting HrExecutiveID"+e);
		}
		//Re Directing Page to DeleteExecute

		response.sendRedirect("HrManager/ApplicationEntry.jsp");
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
