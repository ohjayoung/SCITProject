package global.sesoc.www.dto;

public class T_Board {
	private int boaNum; //pk
	private String boaTitle;
	private String boaContent;
	private String boaRegdate;
	private String userId;	//T_User useId fk
	private int groNum; //T_Group groNum
	private String originalFile;
	private String savedFile;
	public T_Board() {
		super();
	}
	public int getBoaNum() {
		return boaNum;
	}
	public void setBoaNum(int boaNum) {
		this.boaNum = boaNum;
	}
	public String getBoaTitle() {
		return boaTitle;
	}
	public void setBoaTitle(String boaTitle) {
		this.boaTitle = boaTitle;
	}
	public String getBoaContent() {
		return boaContent;
	}
	public void setBoaContent(String boaContent) {
		this.boaContent = boaContent;
	}
	public String getBoaRegdate() {
		return boaRegdate;
	}
	public void setBoaRegdate(String boaRegdate) {
		this.boaRegdate = boaRegdate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getGroNum() {
		return groNum;
	}
	public void setGroNum(int groNum) {
		this.groNum = groNum;
	}
	public String getOriginalFile() {
		return originalFile;
	}
	public void setOriginalFile(String originalFile) {
		this.originalFile = originalFile;
	}
	public String getSavedFile() {
		return savedFile;
	}
	public void setSavedFile(String savedFile) {
		this.savedFile = savedFile;
	}
	@Override
	public String toString() {
		return "T_Board [boaNum=" + boaNum + ", boaTitle=" + boaTitle + ", boaContent=" + boaContent + ", boaRegdate="
				+ boaRegdate + ", userId=" + userId + ", groNum=" + groNum + ", originalFile=" + originalFile
				+ ", savedFile=" + savedFile + "]";
	}
	
	
}
