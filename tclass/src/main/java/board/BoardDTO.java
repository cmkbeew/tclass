package board;

public class BoardDTO {
	private int boardIdx;
	private String division1;
	private String division2;
	private String boardTitle;
	private String boardContent;
	private	String regDate;
	private String replyState;
	
	private int memberIdx;

	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

	public String getDivision1() {
		return division1;
	}

	public void setDivision1(String division1) {
		this.division1 = division1;
	}

	public String getDivision2() {
		return division2;
	}

	public void setDivision2(String division2) {
		this.division2 = division2;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getReplyState() {
		return replyState;
	}

	public void setReplyState(String replyState) {
		this.replyState = replyState;
	}

	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	
	
}
