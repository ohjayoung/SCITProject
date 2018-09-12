package global.sesoc.www.dto;

public class T_Request {
	private int reqNum;	//PK
	private String requester;
	private String reqAccepter;
	private int isAccepted;
	private int plaNum; //T_Planner fk
	public T_Request() {
		// TODO Auto-generated constructor stub
	}
	public int getReqNum() {
		return reqNum;
	}
	public void setReqNum(int reqNum) {
		this.reqNum = reqNum;
	}
	public String getRequester() {
		return requester;
	}
	public void setRequester(String requester) {
		this.requester = requester;
	}
	public String getReqAccepter() {
		return reqAccepter;
	}
	public void setReqAccepter(String reqAccepter) {
		this.reqAccepter = reqAccepter;
	}
	public int getIsAccepted() {
		return isAccepted;
	}
	public void setIsAccepted(int isAccepted) {
		this.isAccepted = isAccepted;
	}
	public int getPlaNum() {
		return plaNum;
	}
	public void setPlaNum(int plaNum) {
		this.plaNum = plaNum;
	}
	@Override
	public String toString() {
		return "T_Request [reqNum=" + reqNum + ", requester=" + requester + ", reqAccepter=" + reqAccepter
				+ ", isAccepted=" + isAccepted + ", plaNum=" + plaNum + "]";
	}
	
}
