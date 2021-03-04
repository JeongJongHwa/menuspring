package kr.co.vo;

import java.util.Date;

public class NoticeVO {

	private int noticeNumber;
	private String noticeTitle;

	@Override
	public String toString() {
		return "NoticeVO [noticeNumber=" + noticeNumber + ", noticeTitle=" + noticeTitle + ", noticeContent="
				+ noticeContent + ", noticeDate=" + noticeDate + ", noticeId=" + noticeId + ", noticeAvailable="
				+ noticeAvailable + "]";
	}

	private String noticeContent;
	private Date noticeDate;
	private String noticeId;
	private String noticeAvailable;

	public int getNoticeNumber() {
		return noticeNumber;
	}

	public void setNoticeNumber(int noticeNumber) {
		this.noticeNumber = noticeNumber;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoticeAvailable() {
		return noticeAvailable;
	}

	public void setNoticeAvailable(String noticeAvailable) {
		this.noticeAvailable = noticeAvailable;
	}

	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
