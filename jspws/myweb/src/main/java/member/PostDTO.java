package member;

public class PostDTO {
	private String num,nickname, title, category, file_name, postdate;
	private int id, file_id, visit_count;
	
	public PostDTO() {
	}

	public PostDTO(String num, String nickname, String title, String category, String file_name, String postdate,
			int id, int file_id, int visit_count) {
		super();
		this.num = num;
		this.nickname = nickname;
		this.title = title;
		this.category = category;
		this.file_name = file_name;
		this.postdate = postdate;
		this.id = id;
		this.file_id = file_id;
		this.visit_count = visit_count;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getPostdate() {
		return postdate;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFile_id() {
		return file_id;
	}

	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}

	public int getVisit_count() {
		return visit_count;
	}

	public void setVisit_count(int visit_count) {
		this.visit_count = visit_count;
	}

	@Override
	public String toString() {
		return "PostDTO [num=" + num + ", nickname=" + nickname + ", title=" + title + ", category=" + category
				+ ", file_name=" + file_name + ", postdate=" + postdate + ", id=" + id + ", file_id=" + file_id
				+ ", visit_count=" + visit_count + "]";
	}
	
	
	
}
