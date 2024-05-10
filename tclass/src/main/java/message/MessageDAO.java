package message;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import board.BoardDTO;
import common.ConnectPool;

public class MessageDAO extends ConnectPool {
	// 쪽지 보내기
	public int sendMessage(MessageDTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO message(messageTitle, messageContent, orgFileName, saveFileName, sendDate, ");
		sb.append("readState, receiverName, senderName, memberIdx) ");
		sb.append("VALUES (?, ?, ?, ?, now(), ");
		sb.append("'N', ?, ?, ?) ");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getMessageTitle());
			psmt.setString(2, dto.getMessageContent());
			psmt.setString(3, dto.getOrgFileName());
			psmt.setString(4, dto.getSaveFileName());
			psmt.setString(5, dto.getReceiverName());
			psmt.setString(6, dto.getSenderName());
			psmt.setInt(7, dto.getMemberIdx());
			
			result = psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("쪽지 보내기 중 에러 발생");
		}
		
		return result;
	}
	
	// 보낸 쪽지 리스트 조회
	public List<MessageDTO> getSendList(Map<String, Object> maps) {
		List<MessageDTO> list = new Vector<>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT messageIdx, messageTitle, messageContent, orgFileName, saveFileName, sendDate, receiverName, memberIdx ");
		sb.append("FROM message ");
		sb.append("WHERE senderName=? AND memberIdx=? ");
		sb.append("ORDER BY sendDate DESC ");
		
		if(maps.get("page_size") != null && maps.get("page_skip_cnt") != null) {
			sb.append("LIMIT " + maps.get("page_skip_cnt") + ", " + maps.get("page_size"));
		}
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setObject(1, maps.get("senderName"));
			psmt.setObject(2, maps.get("memberIdx"));
			rs = psmt.executeQuery();

			while(rs.next()) {
				MessageDTO dto = new MessageDTO();
				dto.setMessageIdx(rs.getInt("messageIdx"));
				dto.setMessageTitle(rs.getString("messageTitle"));
				dto.setMessageContent(rs.getString("messageContent"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setSendDate(rs.getString("sendDate"));
				dto.setReceiverName(rs.getString("receiverName"));
				dto.setMemberIdx(rs.getInt("memberIdx"));

				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("보낸 쪽지 리스트 조회 시 에러 발생");
		}

		return list;
	}

	// 보낸 쪽지함 갯수
	public int getSendListCount(Map<String, Object> maps) {
		int total = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) ");
		sb.append("FROM message ");
		sb.append("WHERE senderName=? AND memberIdx=? ");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setObject(1, maps.get("senderName"));
			psmt.setObject(2, maps.get("memberIdx"));
			rs = psmt.executeQuery();
			rs.next();
			
			total = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("보낸 쪽지함 갯수 조회 중 에러 발생");
		}
		
		return total;
	}

	// 보낸 쪽지 상세 조회
	public MessageDTO getMessageDetail(int messageIdx) {
		MessageDTO dto = new MessageDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT messageIdx, messageTitle, messageContent, orgFileName, saveFileName, ");
		sb.append("sendDate, readDate, readState, receiverName, senderName, memberIdx ");
		sb.append("FROM message ");
		sb.append("WHERE messageIdx=? ");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, messageIdx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setMemberIdx(rs.getInt("messageIdx"));
				dto.setMessageTitle(rs.getString("messageTitle"));
				dto.setMessageContent(rs.getString("messageContent"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setSendDate(rs.getString("sendDate"));
				dto.setReadDate(rs.getString("readDate"));
				dto.setReadState(rs.getString("readState"));
				dto.setReceiverName(rs.getString("receiverName"));
				dto.setSenderName(rs.getString("senderName"));
				dto.setMemberIdx(rs.getInt("memberIdx"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("쪽지 상세 조회 중 에러 발생");
		}
		
		return dto;
	}
	
	// 받은 쪽지 리스트
	public List<MessageDTO> getReceiveList(Map<String, Object> maps) {
		List<MessageDTO> list = new Vector<>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT messageIdx, messageTitle, messageContent, orgFileName, saveFileName, sendDate, readState, senderName, memberIdx ");
		sb.append("FROM message ");
		sb.append("WHERE receiverName=? ");
		sb.append("ORDER BY sendDate DESC, messageIdx DESC ");
		
		if(maps.get("page_size") != null && maps.get("page_skip_cnt") != null) {
			sb.append("LIMIT " + maps.get("page_skip_cnt") + ", " + maps.get("page_size"));
		}
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setObject(1, maps.get("receiverName"));
			rs = psmt.executeQuery();

			while(rs.next()) {
				MessageDTO dto = new MessageDTO();
				dto.setMessageIdx(rs.getInt("messageIdx"));
				dto.setMessageTitle(rs.getString("messageTitle"));
				dto.setMessageContent(rs.getString("messageContent"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setSendDate(rs.getString("sendDate"));
				dto.setReadState(rs.getString("readState"));
				dto.setSenderName(rs.getString("senderName"));
				dto.setMemberIdx(rs.getInt("memberIdx"));

				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("받은 쪽지 리스트 조회 시 에러 발생");
		}

		return list;
	}

	// 보낸 쪽지함 갯수
	public int getReceiveListCount(Map<String, Object> maps) {
		int total = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) ");
		sb.append("FROM message ");
		sb.append("WHERE receiverName=? ");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setObject(1, maps.get("receiverName"));
			rs = psmt.executeQuery();
			rs.next();
			
			total = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("받은 쪽지함 갯수 조회 중 에러 발생");
		}
		
		return total;
	}
}
