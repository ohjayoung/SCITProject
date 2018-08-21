package global.sesoc.www.dto;

public class T_Reply {
	private int repNum;
	private String userId;
	private String repText;
	private String repRegdate;
	private int boaNum;
	
	public T_Reply() {
		// TODO Auto-generated constructor stub
	}

	public int getRepNum() {
		return repNum;
	}

	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRepText() {
		return repText;
	}

	public void setRepText(String repText) {
		this.repText = repText;
	}

	public String getRepRegdate() {
		return repRegdate;
	}

	public void setRepRegdate(String repRegdate) {
		this.repRegdate = repRegdate;
	}

	public int getBoaNum() {
		return boaNum;
	}

	public void setBoaNum(int boaNum) {
		this.boaNum = boaNum;
	}

	@Override
	public String toString() {
		return "T_Reply [repNum=" + repNum + ", userId=" + userId + ", repText=" + repText + ", repRegdate="
				+ repRegdate + ", boaNum=" + boaNum + "]";
	}
	
}
