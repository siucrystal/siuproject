package mini_project;

public interface MemberService {
	MemberDTO getMember(MemberDTO dto);
	int insert(MemberDTO dto);
	// 영선 -- 일반 게시판
	MemberDTO write(MemberDTO dto);
}
