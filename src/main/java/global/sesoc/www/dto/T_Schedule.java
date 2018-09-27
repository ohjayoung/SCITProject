package global.sesoc.www.dto;

public class T_Schedule {
	private int schNum;
	private String schTitle;
	private String schContent;
	private String schRegdate;
	private String schStartdate;
	private String schEnddate;
	private String importance;
	private int checked;
	private int shareable;
	private int plaNum;	//T_Planner fk
	private String category;
	private String schLocation;
	public T_Schedule() {}
	public int getSchNum() {
		return schNum;
	}
	public void setSchNum(int schNum) {
		this.schNum = schNum;
	}
	public String getSchTitle() {
		return schTitle;
	}
	public void setSchTitle(String schTitle) {
		this.schTitle = schTitle;
	}
	public String getSchContent() {
		return schContent;
	}
	public void setSchContent(String schContent) {
		this.schContent = schContent;
	}
	public String getSchRegdate() {
		return schRegdate;
	}
	public void setSchRegdate(String schRegdate) {
		this.schRegdate = schRegdate;
	}
	public String getSchStartdate() {
		return schStartdate;
	}
	public void setSchStartdate(String schStartdate) {
		this.schStartdate = schStartdate;
	}
	public String getSchEnddate() {
		return schEnddate;
	}
	public void setSchEnddate(String schEnddate) {
		this.schEnddate = schEnddate;
	}
	public String getImportance() {
		return importance;
	}
	public void setImportance(String importance) {
		this.importance = importance;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	public int getShareable() {
		return shareable;
	}
	public void setShareable(int shareable) {
		this.shareable = shareable;
	}
	public int getPlaNum() {
		return plaNum;
	}
	public void setPlaNum(int plaNum) {
		this.plaNum = plaNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSchLocation() {
		return schLocation;
	}
	public void setSchLocation(String schLocation) {
		this.schLocation = schLocation;
	}
	@Override
	public String toString() {
		return "T_Schedule [schNum=" + schNum + ", schTitle=" + schTitle + ", schContent=" + schContent
				+ ", schRegdate=" + schRegdate + ", schStartdate=" + schStartdate + ", schEnddate=" + schEnddate
				+ ", importance=" + importance + ", checked=" + checked + ", shareable=" + shareable + ", plaNum="
				+ plaNum + ", category=" + category + ", schLocation=" + schLocation + "]";
	}
	
	
}
