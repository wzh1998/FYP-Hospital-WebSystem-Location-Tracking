package ie.ucd.EEEN3010J;

import java.util.List;

public class Test {

	public static void main(String[] args) {
		
		Actuator e = new Actuator(3001, "a3", 1);
//		System.out.print(ActuatorDAO.insertActuator(e));
		List<Equipment> equipments = EquipmentDAO.getAllEquipments();
		for(int i=0; i<equipments.size(); i++) {
			Equipment equipment = equipments.get(i);
			System.out.println(equipment.getEquipID()+"\n");
		}
//		
//		Sensor e = new Sensor(1001, "Temperature s1", 1, "1999-9-9 12:12:12", "30", 3001, "degree", "TEMPERATURE SENSORS", "Bedroom");
//		System.out.print(SensorDAO.insertSensor(e));
//		Sensor e1 = new Sensor(1004, "Temperature s4", 1, "30", 3001, "degree", "TEMPERATURE SENSORS", "Bedroom");

//		SensorDAO.insertSensor(e1);
		
//		List<Sensor> sensors = SensorDAO.getAllSensors(1);
//		for(int i=0; i<sensors.size(); i++) {
//			Sensor sensor = sensors.get(i);
//			System.out.println(sensor.toString()+"\n");
//		}
//		
		//TODO Question 6 
		
		

	}

}
