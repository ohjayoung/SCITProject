package global.sesoc.www.dto;

public class T_GrequestUser {
	private String groName;
	private int groNum;
	private int greqNum;
	private String gRequester;
	private String greqAccepter;
	private int isgreqAccepter;
	private String userName;
	private String originalImage;
	private String savedImage;	
	private String introduce;
	private String email;
	private String belong;
	public T_GrequestUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getGroName() {
		return groName;
	}
	public void setGroName(String groName) {
		this.groName = groName;
	}
	public int getGroNum() {
		return groNum;
	}
	public void setGroNum(int groNum) {
		this.groNum = groNum;
	}
	public int getGreqNum() {
		return greqNum;
	}
	public void setGreqNum(int greqNum) {
		this.greqNum = greqNum;
	}
	public String getgRequester() {
		return gRequester;
	}
	public void setgRequester(String gRequester) {
		this.gRequester = gRequester;
	}
	public String getGreqAccepter() {
		return greqAccepter;
	}
	public void setGreqAccepter(String greqAccepter) {
		this.greqAccepter = greqAccepter;
	}
	public int getIsgreqAccepter() {
		return isgreqAccepter;
	}
	public void setIsgreqAccepter(int isgreqAccepter) {
		this.isgreqAccepter = isgreqAccepter;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBelong() {
		return belong;
	}
	public void setBelong(String belong) {
		this.belong = belong;
	}
	@Override
	public String toString() {
		return "GrequestUser [groName=" + groName + ", groNum=" + groNum + ", greqNum=" + greqNum + ", gRequester="
				+ gRequester + ", greqAccepter=" + greqAccepter + ", isgreqAccepter=" + isgreqAccepter + ", userName="
				+ userName + ", originalImage=" + originalImage + ", savedImage=" + savedImage + ", introduce="
				+ introduce + ", email=" + email + ", belong=" + belong + "]";
	}
	


	
}
