package ie.ucd.EEEN3010J;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO {
	
	public static User login(String ID, String password) {
		Connection conn = null;
		
		try {
			conn = JDBCTool.getConnection();
		
			String information = "SELECT * FROM Users WHERE UsrID=? AND UsrPwd=?";
			
			PreparedStatement ps = conn.prepareStatement(information);
			
			ps.setString(1, ID);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
		
			if(rs.next()) {
				
				String uID = rs.getString("UsrID");
				String uPwd = rs.getString("UsrPwd");
				String uName = rs.getString("UsrName");
				String uTel = rs.getString("Telephone");
				String uEmail = rs.getString("Email");
				String uDept = rs.getString("DeptIn");
				
				User u = new User(uID,uPwd,uName,uTel,uEmail,uDept);
				return u;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			if(conn!=null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		
		return null;
	}
	

}
