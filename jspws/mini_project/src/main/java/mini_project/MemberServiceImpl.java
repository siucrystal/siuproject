package mini_project;

public class MemberServiceImpl implements MemberService {
	private MemberDAO dao;
	
	public MemberServiceImpl() {
		this.dao = new MemberDAOImpl();
	}

	@Override
	public MemberDTO getMember(MemberDTO dto) {
		return dao.getMember(dto);
	}
	public int insert(MemberDTO dto) {
		return dao.insert(dto);
	}
	// 영선 -- 일반 게시판
	public MemberDTO write(MemberDTO dto) {
		return dao.boardWrite(dto);
	}

}