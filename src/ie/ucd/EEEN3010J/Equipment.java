package ie.ucd.EEEN3010J;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Equipment {
	private String EquipID;
	private String EquipType;
	private String UpdateTime;
	private String Location;
	private int RemainingPow;
	private boolean isLowPow;
	private String deptOwns;
	private String deptInUse;
	
	public Equipment(String EquipID, String EquipType, String UpdateTime, String Location, int RemainingPow, boolean isLowPow, String deptOwns, String deptInUse) {
		super();
		this.EquipID = EquipID;
		this.EquipType = EquipType;
		this.UpdateTime = UpdateTime;
		this.Location = Location;
		this.RemainingPow = RemainingPow;
		this.isLowPow = isLowPow;
		this.deptOwns = deptOwns;
		this.deptInUse = deptInUse;
	}
	
	public String getEquipID() {
		return EquipID;
	}
	
	public String getEquipType() {
		return EquipType;
	}
	
	public String getUpdateTime() {
		return UpdateTime;
	}
	public String getLocation() {
		return Location;
	}
	public int getPower() {
		return RemainingPow;
	}
	
	public boolean isLowPow() {
		return isLowPow;
	}
	
	public String getDeptOwns() {
		return deptOwns;
	}
	public String getDeptInUse() {
		return deptInUse;
	}
	public boolean isBorrowed() {
		return (!deptOwns.equals(deptInUse));
	}
}
