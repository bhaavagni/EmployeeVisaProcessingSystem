

// Package

package joseph;

//Import Statements
//import joseph.*;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.lang.*;

import javax.servlet.*;
import javax.servlet.http.*;



// Start Of Class
public class LoginValidation extends HttpServlet {

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
        String uname=request.getParameter("uname");
        String pass=request.getParameter("pass");

		//declaration
		Database con=null;
		ResultSet rs=null;
		String Qry=null;

		//Establishing Databasse Connection
		try{
			con=new Database();
		}catch(Exception e){
			System.out.println("Cannot Create Connection : "+e);
		}
		//retriving Category for UserName and Password
		try{
			// Building the Query to Insert
			Qry="select Category from LoginDetails where UserName=\'"+uname+"\' and Password=\'"+pass+"\'";
			rs=con.getResultSet(Qry);
		}catch(Exception e){
			System.out.println("Cannot get ResultSet:");
		}

		// Checking Category. if recordset not found then login failed
		try{
			if(rs.next()){
				String Category=rs.getString("Category");
				if(Category.equals("Administrator")){
					response.sendRedirect("Admin/home.jsp");
				}else if(Category.equals("HrManager")){
					HttpSession session=request.getSession(true);
					session.setAttribute("Ses_ID",uname);
					response.sendRedirect("HrManager/home.jsp");
				}else if(Category.equals("Employee")){
					HttpSession Usession=request.getSession(true);
					Usession.setAttribute("Ses_ID",uname);
					response.sendRedirect("Employee/home.jsp");
				}else{
					response.sendRedirect("eIndex.jsp");
				}
			}else{
				response.sendRedirect("eIndex.jsp");
			}

		}catch(Exception e){
			System.out.println("Cannot check Login : ");
		}

		//Closing Database
		try{
			con.closeResultSet();
		}catch(Exception e){
			System.out.println("Cannot Close Database : joseph");
		}
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
