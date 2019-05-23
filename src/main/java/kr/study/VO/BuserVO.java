package kr.study.VO;

public class BuserVO {

	private int idx;
	private String id;
	private String name;
	private String pw;
	private String admin;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
	@Override
	public String toString() {
		return "BuserVO [idx=" + idx + ", id=" + id + ", name=" + name + ", pw=" + pw + ", admin=" + admin + "]";
	}
	
	
}
