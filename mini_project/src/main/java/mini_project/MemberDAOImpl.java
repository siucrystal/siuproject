package mini_project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAOImpl implements MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String sql = "";
	
	@Override
	public MemberDTO getMember(MemberDTO dto) {
		MemberDTO retDto = null;
		
		conn = JDBCUtil.getConnection();
		sql = "SELECT id, pw, nickname, grade FROM member WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String nickname = rs.getString("nickname");
				String grade = rs.getString("grade");
				
				retDto = new MemberDTO(id, pw, nickname, grade);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		
		return retDto;
	}
	@Override
	public int insert(MemberDTO dto) {
		int rs = 0;
		
		conn = JDBCUtil.getConnection();
		sql = "INSERT INTO member(idx, id, pw, nickname) VALUES (member_idx.NEXTVAL, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getNickname());
			
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return rs;
	}
	// 영선 -- 일반 게시판
	public MemberDTO boardWrite(MemberDTO dto) {
		MemberDTO retDto = null;
		
		conn = JDBCUtil.getConnection();
		sql = "SELECT id, pw, nickname, grade FROM member WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String nickname = rs.getString("nickname");
				String grade = rs.getString("grade");
				
				retDto = new MemberDTO(id, pw, nickname, grade);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		
		return retDto;
	}

	
}
