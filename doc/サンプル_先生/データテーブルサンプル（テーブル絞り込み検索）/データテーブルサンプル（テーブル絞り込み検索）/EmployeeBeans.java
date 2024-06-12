package model;

public class EmployeeBeans {
	private String empId;
	private String empName;
	private int empAge;
	private String license;
	private String message;
	private String gender;
	private String department;

	public EmployeeBeans() {

	}

	public EmployeeBeans(String empId,String empName,int empAge,String license,String message,String gender,String department) {
		this.empId= empId;
		this.empName= empName;
		this.empAge= empAge;
		this.license = license;
		this.message = message;
		this.gender = gender;
		this.department= department;
	}

	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getEmpAge() {
		return empAge;
	}
	public void setEmpAge(int empAge) {
		this.empAge = empAge;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}


}
