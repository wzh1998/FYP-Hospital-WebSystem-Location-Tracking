package ie.ucd.EEEN3010J;

public class User {
	
	
	private String usrID;
	private String usrPwd;
	private String usrName;
	private String usrTel;
	private String usrEmail;
	private String usrDept;
	
	
	public User(String usrID, String usrPwd, String usrName, String usrTel, String usrEmail,String usrDept) {
		super();
		this.usrID = usrID;
		this.usrPwd = usrPwd;
		this.usrName = usrName;
		this.usrTel = usrTel;
		this.usrEmail = usrEmail;
		this.usrDept = usrDept;
	}
	
	public String getUsrID() {
		return usrID;
	}
	public String getUsrName() {
		return usrName;
	}
	public String getUsrTel() {
		return usrTel;
	}
	
	public String getUsrEmail() {
		return usrEmail;
	}
	public String getusrDept() {
		return usrDept;
	}
}
