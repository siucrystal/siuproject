package novel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import control.JDBCUtil;

public class NovelDAOImpl implements NovelDAO {
	private Connection conn;
	private PreparedStatement pstmt; 
	private ResultSet rs;
	String sql = "";
	
	public int getMemberCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int retRs = 0;
		
		try {
			conn = JDBCUtil.getConnection();
			
			String sql = "select count(*) as cnt from post where category = '소설'";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				retRs = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return retRs;
	} // End
	public List<NovelDTO> getPostList(int pageNum, int listNum){
		List<NovelDTO> list = new ArrayList<NovelDTO>();
		int offSet = (pageNum -1) * listNum;
		
		conn = JDBCUtil.getConnection();
		sql = "SELECT * FROM (SELECT ROWNUM AS rnum, post.* FROM (SELECT * FROM post WHERE POST.CATEGORY = '소설' ORDER BY num DESC) post WHERE ROWNUM <= ?) WHERE rnum >= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, listNum);
			pstmt.setInt(2, offSet);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				int num = rs.getInt("num");
				String nickname = rs.getString("nickname");
				String title = rs.getString("title");
				String category = rs.getString("category");
				String context = rs.getString("context");
				String postdate = rs.getString("postdate");
				int visit_count = rs.getInt("visit_count");
				NovelDTO dto = new NovelDTO(num, visit_count, context, id, nickname, title, category, postdate);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return list;		
	}
	public int BoardInsert(NovelDTO dto) {
		int rs = 0;
		
		conn = JDBCUtil.getConnection();
		sql = "INSERT INTO post (num,id, nickname, title, context, category) VALUES (post_idx.NEXTVAL,?, ?, ?, ?, '소설')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContext());
			
			System.out.print("id " + dto.getId() + " /");
			System.out.print("name " + dto.getNickname() + " /");
			System.out.print("title " + dto.getTitle() + " /");
			System.out.print("context " + dto.getContext() + " /");
			
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return rs;
	}
	public int delete(NovelDTO dto) {
		int rs = 0;
		
		conn = JDBCUtil.getConnection();
		sql = "delete from post where num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return rs;
	}
    // 게시판 조회수
	public int boardCnt(NovelDTO dto) {   
        int rs = 0;
        conn = JDBCUtil.getConnection();
        sql = "update post SET visit_count = (visit_count+1) where num = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, dto.getNum());
            rs = pstmt.executeUpdate();
            System.out.print("DAO쪽의 rs : "+ rs);
        } catch (Exception e) {
            e.printStackTrace();
          }
        return rs;
 
    }
	public NovelDTO view(NovelDTO dto) {
		ResultSet rs;
		
		conn = JDBCUtil.getConnection();
		sql = "select id, nickname, title, category,context, postdate, visit_count from post WHERE category = '소설' and num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String id = rs.getString("id");
				String nickname = rs.getString("nickname");
				String title = rs.getString("title");
				String context = rs.getString("context");
				String postdate = rs.getString("postdate");
				int visit_count = rs.getInt("visit_count");
				
				
				dto = new NovelDTO(context, nickname, id, title, visit_count, postdate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return dto;
	}
	public int update(NovelDTO dto) {
		int rs = 0;
		
		conn = JDBCUtil.getConnection();
		sql = "UPDATE post SET title = ?, context = ? WHERE num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContext());
			pstmt.setInt(3, dto.getNum());
			
			System.out.print("update 확인");
			System.out.print("title " + dto.getTitle() + " /");
			System.out.print("context " + dto.getContext() + " /");
			System.out.print("num " + dto.getNum() + " /");
			
			rs = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return rs;
	}
	public NovelDTO prevWrite(NovelDTO dto) {
		ResultSet rs;
		
		conn = JDBCUtil.getConnection();
		sql = "select id, nickname, title, category,context, postdate, visit_count from post WHERE category = '소설' and num = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String id = rs.getString("id");
				String nickname = rs.getString("nickname");
				String title = rs.getString("title");
				String context = rs.getString("context");
				String postdate = rs.getString("postdate");
				int visit_count = rs.getInt("visit_count");
				
				
				dto = new NovelDTO(context, nickname, id, title, visit_count, postdate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return dto;
	}
	public NovelDTO prev(NovelDTO dto) {
		ResultSet rs;
		
		conn = JDBCUtil.getConnection();
		sql = "select num, id, nickname,title,context,postdate,visit_count  From(select * from post where category = '소설' and num < ? order by num desc) where rownum <=1";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String id = rs.getString("id");
				String nickname = rs.getString("nickname");
				String title = rs.getString("title");
				String context = rs.getString("context");
				String postdate = rs.getString("postdate");
				int visit_count = rs.getInt("visit_count");
				int num = rs.getInt("num");
				
				
				dto = new NovelDTO(context, nickname, id, title, visit_count, postdate,num);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return dto;
	}
	public int next(NovelDTO dto) {
		ResultSet rs;
		int as = 0;
		
		conn = JDBCUtil.getConnection();
		sql = "select num From(select * from post where category = '소설' and num > ? order by num) where rownum <=1";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				as = rs.getInt("num");
				System.out.print("알에스 next의 rs : " + rs.getInt("num"));
				System.out.print("에이에스 next의 as : " + as);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return as;
	}
}




