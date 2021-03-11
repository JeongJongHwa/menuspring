package kr.co.vo;

public class CustomVO {

	private String BUSI_NUM; // 사업자번호
	private String CUSTOM; // 거래처명
	private String SHORT; // 약칭
	private String CEO; // 대표자
	private String GE_PERSON; // 담당자
	private String BUSI_CONDITION; // 업태
	private String ITEM; // 종목
	private String POST_NUM; // 우편번호
	private String ADDR1; // 주소1
	private String ADDR2; // 주소2
	private String TEL; // 전화번호
	private String FAX; // 팩스번호
	private String HOMEPAGE; // 홈페이지
	private boolean CO_YN; // 법인여부 0 법인 1 개인
	private boolean FOREIGN_YN; // 해외여부 0 국내 1 해외
	private boolean TAX_YN; // 과세구분 0 과세 1 비과세
	private String COUNTRY_ENG; // 국가_영문
	private String COUNTRY_KOR; // 국가_한글
	private boolean SPECIAL_RELATION; // 특수관계자 yes 1 no 0
	private boolean TRADE_STOP; // 거래중지 yes 1 no 0
	private String CONTRACT_PERIOD_S; // 계약기간 시작
	private String CONTRACT_PERIOD_E; // 계약기간 끝
	private String REGI_INFO_MAN; // 등록정보 등록인
	private String REGI_INFO_DATE; // 등록정보 등록날짜
	private String MODI_INFO_MAN; // 변경정보 변경인
	private String MODI_INFO_DATE; // 변경정보 변경날짜

	public CustomVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getBUSI_NUM() {
		return BUSI_NUM;
	}

	public void setBUSI_NUM(String bUSI_NUM) {
		BUSI_NUM = bUSI_NUM;
	}

	public String getCUSTOM() {
		return CUSTOM;
	}

	public void setCUSTOM(String cUSTOM) {
		CUSTOM = cUSTOM;
	}

	public String getSHORT() {
		return SHORT;
	}

	public void setSHORT(String sHORT) {
		SHORT = sHORT;
	}

	public String getCEO() {
		return CEO;
	}

	public void setCEO(String cEO) {
		CEO = cEO;
	}

	public String getGE_PERSON() {
		return GE_PERSON;
	}

	public void setGE_PERSON(String gE_PERSON) {
		GE_PERSON = gE_PERSON;
	}

	public String getBUSI_CONDITION() {
		return BUSI_CONDITION;
	}

	public void setBUSI_CONDITION(String bUSI_CONDITION) {
		BUSI_CONDITION = bUSI_CONDITION;
	}

	public String getITEM() {
		return ITEM;
	}

	public void setITEM(String iTEM) {
		ITEM = iTEM;
	}

	public String getPOST_NUM() {
		return POST_NUM;
	}

	public void setPOST_NUM(String pOST_NUM) {
		POST_NUM = pOST_NUM;
	}

	public String getADDR1() {
		return ADDR1;
	}

	public void setADDR1(String aDDR1) {
		ADDR1 = aDDR1;
	}

	public String getADDR2() {
		return ADDR2;
	}

	public void setADDR2(String aDDR2) {
		ADDR2 = aDDR2;
	}

	public String getTEL() {
		return TEL;
	}

	public void setTEL(String tEL) {
		TEL = tEL;
	}

	public String getFAX() {
		return FAX;
	}

	public void setFAX(String fAX) {
		FAX = fAX;
	}

	public String getHOMEPAGE() {
		return HOMEPAGE;
	}

	public void setHOMEPAGE(String hOMEPAGE) {
		HOMEPAGE = hOMEPAGE;
	}

	public boolean isCO_YN() {
		return CO_YN;
	}

	public void setCO_YN(boolean cO_YN) {
		CO_YN = cO_YN;
	}

	public boolean isFOREIGN_YN() {
		return FOREIGN_YN;
	}

	public void setFOREIGN_YN(boolean fOREIGN_YN) {
		FOREIGN_YN = fOREIGN_YN;
	}

	public boolean isTAX_YN() {
		return TAX_YN;
	}

	public void setTAX_YN(boolean tAX_YN) {
		TAX_YN = tAX_YN;
	}

	public String getCOUNTRY_ENG() {
		return COUNTRY_ENG;
	}

	public void setCOUNTRY_ENG(String cOUNTRY_ENG) {
		COUNTRY_ENG = cOUNTRY_ENG;
	}

	public String getCOUNTRY_KOR() {
		return COUNTRY_KOR;
	}

	public void setCOUNTRY_KOR(String cOUNTRY_KOR) {
		COUNTRY_KOR = cOUNTRY_KOR;
	}

	public boolean isSPECIAL_RELATION() {
		return SPECIAL_RELATION;
	}

	public void setSPECIAL_RELATION(boolean sPECIAL_RELATION) {
		SPECIAL_RELATION = sPECIAL_RELATION;
	}

	public boolean isTRADE_STOP() {
		return TRADE_STOP;
	}

	public void setTRADE_STOP(boolean tRADE_STOP) {
		TRADE_STOP = tRADE_STOP;
	}

	public String getCONTRACT_PERIOD_S() {
		return CONTRACT_PERIOD_S;
	}

	public void setCONTRACT_PERIOD_S(String cONTRACT_PERIOD_S) {
		CONTRACT_PERIOD_S = cONTRACT_PERIOD_S;
	}

	public String getCONTRACT_PERIOD_E() {
		return CONTRACT_PERIOD_E;
	}

	public void setCONTRACT_PERIOD_E(String cONTRACT_PERIOD_E) {
		CONTRACT_PERIOD_E = cONTRACT_PERIOD_E;
	}

	public String getREGI_INFO_MAN() {
		return REGI_INFO_MAN;
	}

	public void setREGI_INFO_MAN(String rEGI_INFO_MAN) {
		REGI_INFO_MAN = rEGI_INFO_MAN;
	}

	public String getREGI_INFO_DATE() {
		return REGI_INFO_DATE;
	}

	public void setREGI_INFO_DATE(String rEGI_INFO_DATE) {
		REGI_INFO_DATE = rEGI_INFO_DATE;
	}

	public String getMODI_INFO_MAN() {
		return MODI_INFO_MAN;
	}

	public void setMODI_INFO_MAN(String mODI_INFO_MAN) {
		MODI_INFO_MAN = mODI_INFO_MAN;
	}

	public String getMODI_INFO_DATE() {
		return MODI_INFO_DATE;
	}

	public void setMODI_INFO_DATE(String mODI_INFO_DATE) {
		MODI_INFO_DATE = mODI_INFO_DATE;
	}

	@Override
	public String toString() {
		return "CustomVO [BUSI_NUM=" + BUSI_NUM + ", CUSTOM=" + CUSTOM + ", SHORT=" + SHORT + ", CEO=" + CEO
				+ ", GE_PERSON=" + GE_PERSON + ", BUSI_CONDITION=" + BUSI_CONDITION + ", ITEM=" + ITEM + ", POST_NUM="
				+ POST_NUM + ", ADDR1=" + ADDR1 + ", ADDR2=" + ADDR2 + ", TEL=" + TEL + ", FAX=" + FAX + ", HOMEPAGE="
				+ HOMEPAGE + ", CO_YN=" + CO_YN + ", FOREIGN_YN=" + FOREIGN_YN + ", TAX_YN=" + TAX_YN + ", COUNTRY_ENG="
				+ COUNTRY_ENG + ", COUNTRY_KOR=" + COUNTRY_KOR + ", SPECIAL_RELATION=" + SPECIAL_RELATION
				+ ", TRADE_STOP=" + TRADE_STOP + ", CONTRACT_PERIOD_S=" + CONTRACT_PERIOD_S + ", CONTRACT_PERIOD_E="
				+ CONTRACT_PERIOD_E + ", REGI_INFO_MAN=" + REGI_INFO_MAN + ", REGI_INFO_DATE=" + REGI_INFO_DATE
				+ ", MODI_INFO_MAN=" + MODI_INFO_MAN + ", MODI_INFO_DATE=" + MODI_INFO_DATE + "]";
	}

}
