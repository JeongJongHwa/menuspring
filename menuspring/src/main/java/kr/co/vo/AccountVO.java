package kr.co.vo;

public class AccountVO {

	private String BUSI_NUM; // 사업자번호
	private String FACTORY; // 사무소
	private String TRADE_BANK; // 거래은행
	private String ACCOUNT_NUM; // 계좌번호

	public AccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getBUSI_NUM() {
		return BUSI_NUM;
	}

	public void setBUSI_NUM(String bUSI_NUM) {
		BUSI_NUM = bUSI_NUM;
	}

	public String getFACTORY() {
		return FACTORY;
	}

	public void setFACTORY(String fACTORY) {
		FACTORY = fACTORY;
	}

	public String getTRADE_BANK() {
		return TRADE_BANK;
	}

	public void setTRADE_BANK(String tRADE_BANK) {
		TRADE_BANK = tRADE_BANK;
	}

	public String getACCOUNT_NUM() {
		return ACCOUNT_NUM;
	}

	public void setACCOUNT_NUM(String aCCOUNT_NUM) {
		ACCOUNT_NUM = aCCOUNT_NUM;
	}

	@Override
	public String toString() {
		return "AccountVO [BUSI_NUM=" + BUSI_NUM + ", FACTORY=" + FACTORY + ", TRADE_BANK=" + TRADE_BANK
				+ ", ACCOUNT_NUM=" + ACCOUNT_NUM + "]";
	}

}
