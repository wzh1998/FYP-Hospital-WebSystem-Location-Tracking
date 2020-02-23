package ie.ucd.EEEN3010J;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


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
	
//	public static Actuator getActuatorByID(int aid) {
//		try {
//			Connection conn = JDBCTool.getConnection();
//			Statement st = conn.createStatement();	
//			ResultSet rs = st.executeQuery("SELECT * FROM Actuators WHERE ActID=" + aid);
//			rs.next();
//			
//			int ActID = rs.getInt("ActID");
//			String ActName = rs.getString("ActName");
//			int ActState = rs.getInt("ActState");
//			Actuator act = new Actuator(ActID, ActName, ActState);
//				
//			rs.close();
//			st.close();
//			conn.close();
//	
//			return act;
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}		
//	return null;
//	}
//	
//
//	public static boolean deleteActuatorByID(int aid) {
//		try {
//			Connection conn = JDBCTool.getConnection();
//			Statement st = conn.createStatement();	
//			int rs = st.executeUpdate("DELETE FROM Actuators WHERE ActID=" + aid);
//			
//			st.close();
//			conn.close();
//			
//			return (rs==0) ? false : true;
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return false;
//	}
//	
//
//	public static boolean updateActuator(Actuator act) {
//		try {
//			Connection conn = JDBCTool.getConnection();
//			Statement st = conn.createStatement();	
//			System.out.println("UPDATE Actuators SET ActName='"+ act.getActName() + "', ActState=" + act.getActState() + " WHERE ActID=" + act.getActID() + ";");
//			int rs = st.executeUpdate("UPDATE Actuators SET ActName='"+ act.getActName() + "', ActState=" + act.getActState() + " WHERE ActID=" + act.getActID() + ";" );
//			
//			st.close();
//			conn.close();
//			return (rs==0) ? false : true;
//		} catch (SQLException exception) {
//			exception.printStackTrace();
//		}
//		return false;
//	}
//	
//
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
}