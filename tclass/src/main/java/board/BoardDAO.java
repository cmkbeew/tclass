package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.ConnectPool;

public class BoardDAO extends ConnectPool {

	// 1:1 게시판 등록
	public int writeBoard(BoardDTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("INSERT INTO board(division1, division2, boardTitle, boardContent, regDate, memberIdx) ");
		sb.append("VALUES (?, ?, ?, ?, now(), ?)");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getDivision1());
			psmt.setString(2, dto.getDivision2());
			psmt.setString(3, dto.getBoardTitle());
			psmt.setString(4, dto.getBoardContent());
			psmt.setInt(5, dto.getMemberIdx());
			
			result = psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("1:1 게시판 등록 실패");
		}
		
		return result;
	}
	
	// 내가 작성한 글 갯수
	public int getBoardCount(Map<String, Object> maps) {
		int result = 0;

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(boardIdx) FROM board ");
		sb.append("WHERE memberIdx=?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setObject(1, maps.get("memberIdx"));
			rs = psmt.executeQuery();

			rs.next();

			result = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시글 total_count 에러 발생");
		}

		return result;
	}
	
	// 1:1 게시판 목록
	public List<BoardDTO> getBoardList(Map<String, Object> maps) {
		List<BoardDTO> list = new Vector<>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT boardIdx, division1, boardTitle, replyState, regDate, memberIdx ");
		sb.append("FROM board ");
		sb.append("WHERE memberIdx=? ");
		sb.append("ORDER BY regDate DESC, boardIdx DESC ");
		
		if(maps.get("page_size") != null && maps.get("page_skip_cnt") != null) {
			sb.append("LIMIT " + maps.get("page_skip_cnt") + ", " + maps.get("page_size"));
		}
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setObject(1, maps.get("memberIdx"));
			rs = psmt.executeQuery();

			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setBoardIdx(rs.getInt("boardIdx"));
				dto.setDivision1(rs.getString("division1"));
				dto.setBoardTitle(rs.getString("boardTitle"));
				dto.setReplyState(rs.getString("replyState"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setMemberIdx(rs.getInt("memberIdx"));

				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("내가 작성한 글 리스트 조회 시 에러 발생");
		}

		return list;
	}
	
	// 1:1 게시판 글 상세 조회
	public BoardDTO getBoardDetail(int boardIdx){
		BoardDTO dto = new BoardDTO();

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT b.boardIdx, b.division1, b.division2, b.boardTitle, b.boardContent, b.regDate, b.replyState, m.memberIdx ");
		sb.append("FROM board AS b INNER JOIN member AS m ON m.memberIdx = b.memberIdx ");
		sb.append("WHERE b.boardIdx=? ");

		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, boardIdx);
			rs = psmt.executeQuery();

			if(rs.next()) {
				dto.setBoardIdx(rs.getInt("boardIdx"));
				dto.setDivision1(rs.getString("division1"));
				dto.setDivision2(rs.getString("division2"));
				dto.setBoardTitle(rs.getString("boardTitle"));
				dto.setBoardContent(rs.getString("boardContent"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setReplyState(rs.getString("replyState"));
				dto.setMemberIdx(rs.getInt("memberIdx"));
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("내가 작성한 글 상세 조회 시 에러 발생");
		}

		return dto;
	}
	
	// 1:1 게시글 수정
		public BoardDTO modifyBoard(BoardDTO dto) {
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE board SET division1=?, division2=?, boardTitle=?, boardContent=? ");
			sb.append("WHERE boardIdx=?");

			try {
				psmt = conn.prepareStatement(sb.toString());

				psmt.setString(1, dto.getDivision1());
				psmt.setString(2, dto.getDivision2());
				psmt.setString(3, dto.getBoardTitle());
				psmt.setString(4, dto.getBoardContent());
				psmt.setInt(5, dto.getBoardIdx());

				psmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("내가 작성한 글 수정 시 에러 발생");
			}

			return dto;
		}

		public int getBoardDelete(int boardIdx) {
			int result = 0;
			
			String sql = "DELETE FROM board WHERE boardIdx = ?";

			try {
				psmt = conn.prepareStatement(sql);

				psmt.setInt(1, boardIdx);

				result = psmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("내가 작성한 글 삭제 시 에러 발생");
			}
			
			return result;
		}
}
