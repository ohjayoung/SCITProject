package global.sesoc.www.dto;

public class T_Group {
	private int groNum;//PK
	private String groName;
	private String groIntro;
	private String groRegdate;
	private int userCount;
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
	@Override
	public String toString() {
		return "T_Group [groNum=" + groNum + ", groName=" + groName + ", groIntro=" + groIntro + ", groRegdate="
				+ groRegdate + ", userCount=" + userCount + "]";
	}
	
}
