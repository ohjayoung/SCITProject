package global.sesoc.www.dto;

public class T_User {
	private String userId;	//pk
	private String userPwd;
	private String userName;
	private String birth;
	private String phone;
	private String email;
	private String originalImage;
	private String savedImage;
	private String introduce;
	private String belong;
	
	public T_User() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOriginalImage() {
		return originalImage;
	}

	public void setOriginalImage(String originalImage) {
		this.originalImage = originalImage;
	}

	public String getSavedImage() {
		return savedImage;
	}

	public void setSavedImage(String savedImage) {
		this.savedImage = savedImage;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getBelong() {
		return belong;
	}

	public void setBelong(String belong) {
		this.belong = belong;
	}

	@Override
	public String toString() {
		return "T_User [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", birth=" + birth
				+ ", phone=" + phone + ", email=" + email + ", originalImage=" + originalImage + ", savedImage="
				+ savedImage + ", introduce=" + introduce + ", belong=" + belong + "]";
	}
	
}
