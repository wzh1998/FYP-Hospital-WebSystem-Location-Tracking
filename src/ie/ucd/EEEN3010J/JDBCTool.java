package ie.ucd.EEEN3010J;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCTool {
	
	public static Connection getConnection(String url, String dbname, String username, String password) {
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://"+url+"/"+dbname+"?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf-8", username, password);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//TODO Question 1 Check user name and password
	public static Connection getConnection() {
		return JDBCTool.getConnection("39.108.231.244", "HETS", "root", "logic");
	}

}
