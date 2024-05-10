package member;

import common.ConnectPool;

public class MemberDAO extends ConnectPool {
	
	// 아이디 중복 체크
	public int getIdCheck(String memberId) {
		int result = 0;
		String sql = "SELECT COUNT(memberId) FROM member WHERE memberId=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memberId);

			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원 조회 시 에러 발생");
		}

		return result;
	}
	
	// 회원가입
	public int join(MemberDTO dto) {
		int result = 0;

		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO member(name, memberId, pwd, year, month, day, gender, phone, email, interest, grade) ");
		sb.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getMemberId());
			psmt.setString(3, dto.getPwd());
			psmt.setString(4, dto.getYear());
			psmt.setString(5, dto.getMonth());
			psmt.setString(6, dto.getDay());
			psmt.setString(7, dto.getGender());
			psmt.setString(8, dto.getPhone());
			psmt.setString(9, dto.getEmail());
			psmt.setString(10, dto.getInterest());
			psmt.setString(11, dto.getGrade());

			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("회원가입 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 로그인 정보 조회/처리
	public MemberDTO getMemberInfo(String memberId, String pwd) {
		MemberDTO dto = new MemberDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT memberIdx, name, memberId, pwd, year, month, day, gender, phone, email, interest, grade ");
		sb.append("FROM member ");
		sb.append("WHERE memberId = ?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, memberId);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pwd").equals(pwd)) {
					dto.setMemberIdx(rs.getInt("memberIdx"));
					dto.setName(rs.getString("name"));
					dto.setMemberId(rs.getString("memberId"));
					dto.setPwd(rs.getString("pwd"));
					dto.setYear(rs.getString("year"));
					dto.setMonth(rs.getString("month"));
					dto.setDay(rs.getString("day"));
					dto.setGender(rs.getString("gender"));
					dto.setPhone(rs.getString("phone"));
					dto.setEmail(rs.getString("email"));
					dto.setInterest(rs.getString("interest"));
					dto.setGrade(rs.getString("grade"));
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("로그인 정보 조회 시 에러 발생");
		}
		
		return dto;
	}

	// 회원수정
	public int modifyMyInfo(int memberIdx, String pwd, String phone) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("UPDATE member SET pwd=?, phone=? ");
		sb.append("WHERE memberIdx=?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, pwd);
			psmt.setString(2, phone);
			psmt.setInt(3, memberIdx);
			
			result = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("개인정보수정 시 에러 발생");
		}
		
		return result;
	}

	// 회원탈퇴
	public int deleteMember(int memberIdx) {
		int result = 0;
		
		String sql = "DELETE FROM member where memberIdx=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, memberIdx);
			
			result = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("개인정보삭제 시 에러 발생");
		}
		
		return result;
	}
	
	// 아이디 찾기
	public MemberDTO searchId(String name, String phone) {
		MemberDTO dto = new MemberDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT memberIdx, name, memberId, pwd, year, month, day, gender, phone, email, interest, grade, regDate ");
		sb.append("FROM member ");
		sb.append("WHERE name=? AND phone=?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, name);
			psmt.setString(2, phone);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setMemberIdx(rs.getInt("memberIdx"));
				dto.setName(rs.getString("name"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setPwd(rs.getString("pwd"));
				dto.setYear(rs.getString("year"));
				dto.setMonth(rs.getString("month"));
				dto.setDay(rs.getString("day"));
				dto.setGender(rs.getString("gender"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setInterest(rs.getString("interest"));
				dto.setGrade(rs.getString("grade"));
				dto.setRegDate(rs.getString("regDate"));
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("아이디 찾기 중 에러 발생");
		}
		
		return dto;
	}
	
	// 비밀번호 찾기
	public MemberDTO searchPwd(String memberId, String name, String phone) {
		MemberDTO dto = new MemberDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT memberIdx, name, memberId, pwd, year, month, day, gender, phone, email, interest, grade, regDate ");
		sb.append("FROM member ");
		sb.append("WHERE memberId=? AND name=? AND phone=?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, memberId);
			psmt.setString(2, name);
			psmt.setString(3, phone);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setMemberIdx(rs.getInt("memberIdx"));
				dto.setName(rs.getString("name"));
				dto.setMemberId(rs.getString("memberId"));
				dto.setPwd(rs.getString("pwd"));
				dto.setYear(rs.getString("year"));
				dto.setMonth(rs.getString("month"));
				dto.setDay(rs.getString("day"));
				dto.setGender(rs.getString("gender"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setInterest(rs.getString("interest"));
				dto.setGrade(rs.getString("grade"));
				dto.setRegDate(rs.getString("regDate"));
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("비밀번호 찾기 중 에러 발생");
		}
		
		return dto;
	}
	
	// 비밀번호 변경
	public int changePwd(String memberId, String pwd) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE member SET pwd=? ");
		sb.append("WHERE memberId=?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, pwd);
			psmt.setString(2, memberId);
			
			result = psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("비밀번호 변경 중 에러 발생");
		}
		
		return result;
	}
}
