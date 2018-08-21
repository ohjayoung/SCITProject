package global.sesoc.www.dto;

public class T_Friend {
	private int friNum;
	private String friRequester;
	private String friAccepter;
	private int isAccepted;
	
	public T_Friend() {
		// TODO Auto-generated constructor stub
	}

	public int getFriNum() {
		return friNum;
	}

	public void setFriNum(int friNum) {
		this.friNum = friNum;
	}

	public String getFriRequester() {
		return friRequester;
	}

	public void setFriRequester(String friRequester) {
		this.friRequester = friRequester;
	}

	public String getFriAccepter() {
		return friAccepter;
	}

	public void setFriAccepter(String friAccepter) {
		this.friAccepter = friAccepter;
	}

	public int getIsAccepted() {
		return isAccepted;
	}

	public void setIsAccepted(int isAccepted) {
		this.isAccepted = isAccepted;
	}

	@Override
	public String toString() {
		return "T_Friend [friNum=" + friNum + ", friRequester=" + friRequester + ", friAccepter=" + friAccepter
				+ ", isAccepted=" + isAccepted + "]";
	}
	
}
