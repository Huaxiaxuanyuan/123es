package cn.estore.entity;

public class CustomerEntity {
	
	private int id;
	private String userName;
	private String password;
	private String realName;
	private String mobile;
	private String email;
	private String passwordQuestion;
	private String passwordHintAnswer;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswordQuestion() {
		return passwordQuestion;
	}
	public void setPasswordQuestion(String passwordQuestion) {
		this.passwordQuestion = passwordQuestion;
	}
	public String getPasswordHintAnswer() {
		return passwordHintAnswer;
	}
	public void setPasswordHintAnswer(String passwordHintAnswer) {
		this.passwordHintAnswer = passwordHintAnswer;
	}
	public CustomerEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CustomerEntity(int id, String userName, String password) {
		super();
		this.id = id;
		this.userName = userName;
		this.password = password;
	}
	
	
	
}
