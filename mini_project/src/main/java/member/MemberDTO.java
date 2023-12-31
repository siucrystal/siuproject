package member;

public class MemberDTO {
	private int idx;
	private String id, pw, nickname, grade, regdate;
	
	public MemberDTO() {
	}

	public MemberDTO(int idx, String id, String pw, String nickname, String grade, String regdate) {
		super();
		this.idx = idx;
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.grade = grade;
		this.regdate = regdate;
	}

	public MemberDTO(String id, String pw, String nickname, String grade) {
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.grade = grade;
	}
	
	public MemberDTO(String id, String pw, String nickname) {
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getRegdate() {
		return regdate;
	}
	
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "일련번호: " + idx + ", 아이디: " + id + ", 비밀번호: " + pw +
				", 닉네임: " + nickname + ", 등급: " + grade + ", 가입일자: " + regdate;
	}
}
