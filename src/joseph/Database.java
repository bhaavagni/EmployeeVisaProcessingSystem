/*
	Name 		:	S.Joseph Beevin
	Designation	:	Programmer
	Date		:	2006-02-07
	place		:	Horizone Technologies, T.Nagar.
*/

// Package

package joseph;

// Import Statements

import java.sql.*;

// Start Of Class

public class Database {
	//Declaration

	private Connection Con=null;
	private Statement st=null;
	private ResultSet rs=null;

	//Constructor

	public Database() throws Exception {
		//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		//Con=DriverManager.getConnection("jdbc:odbc:H1BVisaProcess","","");
		Class.forName("com.mysql.jdbc.Driver");
Con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/visa", "root", "root");
		st=Con.createStatement();
	}

	//To Return ResultSet from the Table

	public ResultSet getResultSet(String Qry) throws Exception {
                rs=st.executeQuery(Qry);
                return rs;
 	}


	//To Insert or Update the Table


	public int setResultSet(String Qry) throws Exception {
                int no=st.executeUpdate(Qry);
		return no;
        }

        // To Close Connection, Statememt and ResultSet

        public void closeResultSet() throws Exception {
           	rs.close();
           	st.close();
           	Con.close();
        }
        public void closeSetResultSet() throws Exception {
          	st.close();
          	Con.close();
        }
}

// End Of Class
