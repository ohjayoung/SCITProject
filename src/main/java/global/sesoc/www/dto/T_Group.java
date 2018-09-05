package global.sesoc.www.dto;

public class T_Group {
	private int groNum;//PK
	private String userId;
	private String groName;
	private String groIntro;
	private String groRegdate;
	private int userCount;	
	private String originalImage;
	private String savedImage;
	public T_Group() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getGroNum() {
		return groNum;
	}
	public void setGroNum(int groNum) {
		this.groNum = groNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGroName() {
		return groName;
	}
	public void setGroName(String groName) {
		this.groName = groName;
	}
	public String getGroIntro() {
		return groIntro;
	}
	public void setGroIntro(String groIntro) {
		this.groIntro = groIntro;
	}
	public String getGroRegdate() {
		return groRegdate;
	}
	public void setGroRegdate(String groRegdate) {
		this.groRegdate = groRegdate;
	}
	public int getUserCount() {
		return userCount;
	}
	public void setUserCount(int userCount) {
		this.userCount = userCount;
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
	@Override
	public String toString() {
		return "T_Group [groNum=" + groNum + ", userId=" + userId + ", groName=" + groName + ", groIntro=" + groIntro
				+ ", groRegdate=" + groRegdate + ", userCount=" + userCount + ", originalImage=" + originalImage
				+ ", savedImage=" + savedImage + "]";
	}
	
	
	
}
