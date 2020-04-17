package ie.ucd.EEEN3010J;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import ie.ucd.EEEN3010J.JDBCTool;


public class EquipmentDAO {
	
	public static List<Equipment> getAllEquipments() {
		List<Equipment> equipments = new ArrayList<Equipment>();
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT * FROM Equipments ORDER BY EquipID");
			
			while(rs.next()) {
				String EquipID = rs.getString("EquipID");
				String EquipType = rs.getString("EquipType");
				
				java.sql.Timestamp UpdateTime_t = rs.getTimestamp("LastUpdateTime");	
				Date date = new Date(UpdateTime_t.getTime());
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String UpdateTime = sdf.format(date);
				
				String Location = rs.getString("LastLocation");
				int RemainingPow = rs.getInt("RemainingPow");
				boolean isLowPow = rs.getBoolean("IsLowPow");
				String deptOwns = rs.getString("deptOwns");
				String deptInUse = rs.getString("deptInUse");
				
				Equipment equip = new Equipment(EquipID, EquipType, UpdateTime, Location, RemainingPow, isLowPow, deptOwns, deptInUse);
				
				equipments.add(equip);
			}
			
			rs.close();
			st.close();
			conn.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return equipments;
	}
	
	public static boolean insertEquipment(String equipID, String equipType, String deptOwns) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			int rs = st.executeUpdate("INSERT INTO Equipments VALUES ('" + equipID + "', '" + equipType + "', '1970-01-01 08:00:00', NULL, 100, 0, '" + deptOwns + "', '" + deptOwns + "');");
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}
	
	public static boolean deleteEquipment(String equipID) {
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();	
			int rs = st.executeUpdate("DELETE FROM Equipments WHERE equipID='" + equipID + "';");
			
			st.close();
			conn.close();
			
			return (rs==0) ? false : true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public static int[] getEquipNum() {
		int[] equipNum = {0,0,0,0,0,0,0,0,0,0};
		try {
			Connection conn = JDBCTool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT COUNT(Equipments.DeptOwns) AS EquipNum FROM Departments LEFT JOIN Equipments ON Departments.DeptCode = Equipments.DeptOwns GROUP BY Departments.DeptCode ORDER BY Departments.DeptCode;");
			for(int i = 0;rs.next();i++) {
				
				equipNum[i] = rs.getInt("EquipNum");
			}
			
			rs.close();
			st.close();
			conn.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return equipNum;
	}
	
}

