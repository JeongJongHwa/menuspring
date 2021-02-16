package kr.co.vo;

public class AppraisalVO {

	private int menuNumber;
	private String id;
	private int menuAppraisal;

	public AppraisalVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getMenuNumber() {
		return menuNumber;
	}

	public void setMenuNumber(int menuNumber) {
		this.menuNumber = menuNumber;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMenuAppraisal() {
		return menuAppraisal;
	}

	public void setMenuAppraisal(int menuAppraisal) {
		this.menuAppraisal = menuAppraisal;
	}

	@Override
	public String toString() {
		return "AppraisalVO [menuNumber=" + menuNumber + ", id=" + id + ", menuAppraisal=" + menuAppraisal + "]";
	}

}
