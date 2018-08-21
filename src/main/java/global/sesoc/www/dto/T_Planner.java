package global.sesoc.www.dto;

public class T_Planner {
	private int plaNum;//PK
	private String plaTitle;
	private String plaRegdate;
	public T_Planner() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPlaNum() {
		return plaNum;
	}
	public void setPlaNum(int plaNum) {
		this.plaNum = plaNum;
	}
	public String getPlaTitle() {
		return plaTitle;
	}
	public void setPlaTitle(String plaTitle) {
		this.plaTitle = plaTitle;
	}
	public String getPlaRegdate() {
		return plaRegdate;
	}
	public void setPlaRegdate(String plaRegdate) {
		this.plaRegdate = plaRegdate;
	}
	@Override
	public String toString() {
		return "T_Planner [plaNum=" + plaNum + ", plaTitle=" + plaTitle + ", plaRegdate=" + plaRegdate + "]";
	}
	
}
