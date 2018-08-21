package global.sesoc.www.dto;

public class T_GRequest {
	private int greqNum;
	private String gRequester;
	private String greqAccepter;
	private int isgreqAccepter;
	private int groNum;
	
	public T_GRequest() {
		// TODO Auto-generated constructor stub
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

	public int getGroNum() {
		return groNum;
	}

	public void setGroNum(int groNum) {
		this.groNum = groNum;
	}

	@Override
	public String toString() {
		return "T_GRequest [greqNum=" + greqNum + ", gRequester=" + gRequester + ", greqAccepter=" + greqAccepter
				+ ", isgreqAccepter=" + isgreqAccepter + ", groNum=" + groNum + "]";
	}
	
}
