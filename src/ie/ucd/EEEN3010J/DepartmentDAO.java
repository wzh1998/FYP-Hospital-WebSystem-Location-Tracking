//package ie.ucd.EEEN3010J;
//
//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//public class DepartmentDAO {
//	public static List<Department> getAllDepartments() {
//		List<Department> departments = new ArrayList<Department>();
//		try {
//			Connection conn = JDBCTool.getConnection();
//			Statement st = conn.createStatement();
//			
//			ResultSet rs = st.executeQuery("SELECT * FROM Departments ORDER BY DeptCode");
//			
//			while(rs.next()) {
//				String DeptCode = rs.getString("EquipID");
//				String DeptName = rs.getString("EquipType");
//				
//				Equipment equip = new Equipment(DeptCode, DeptName);
//				
//				equipments.add(equip);
//			}
//			
//			rs.close();
//			st.close();
//			conn.close();	
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return equipments;
//	}
//}
