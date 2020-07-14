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
import java.lang.*;

import javax.servlet.*;
import javax.servlet.http.*;

// Start Of Class
public class newExecutive extends HttpServlet {

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
		String name=request.getParameter("name");
        String d=request.getParameter("d");
        String m=request.getParameter("m");
        String y=request.getParameter("y");
        String date=y+"-"+m+"-"+d;
        String email=request.getParameter("email");
        String phno=request.getParameter("phno");
        String add=request.getParameter("add");


        //declaration
		Database con=null;
		ResultSet rs=null;
		String Qry=null;
		String newID=null;

        //Establishing Databasse Connection
		try{
			con=new Database();
		}catch(Exception e){
			System.out.println("Cannot Create Connection : newEmployee.class"+e);
		}

        //Generate Auto ID
        try{
			Qry="select max(ExeID) from Executive";
			rs=con.getResultSet(Qry);

			if(!rs.next()){
				newID="HrEx4331";
			}else{
				newID=rs.getString(1);
				if(newID==null){
					newID="HrEx4331";
					System.out.println(newID);
				}else{
					newID="HrEx"+(Integer.parseInt(newID.substring(4,newID.length()))+1);
				}
			}
		}catch(Exception e){
			System.out.println("Error While Generating HrExecutiveID"+e);

		}

		// Inserting into table Executive
		try{

			Qry="insert into Executive values('"+newID+"', '"+name+"','"+date+"','"+email+"','"+phno+"','"+add+"','"+sysDate+"')";
			int no=con.setResultSet(Qry);
			Qry="insert into LoginDetails values(\'"+newID+"\',\'"+newID+"\','HrManager')";
			no=con.setResultSet(Qry);
			con.closeResultSet();
		}catch(Exception e){
			System.out.println("Unable to insert into table Executive"+e);
		}
		response.sendRedirect("Admin/AddNewExecutive.jsp?ExeID="+newID);
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
