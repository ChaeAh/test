package kr.study.VO;

import java.util.Date;

public class BoardVO {

	private int idx;
	private String type;
	private String sub_type;
	private String name;
	private String subject;
	private String content;
	private int hit;
	private Date writeDate;
	private int commentCount;
	
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSub_type() {
		return sub_type;
	}
	public void setSub_type(String sub_type) {
		this.sub_type = sub_type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", type=" + type + ", sub_type=" + sub_type + ", name=" + name + ", subject="
				+ subject + ", content=" + content + ", hit=" + hit + ", writeDate=" + writeDate + ", commentCount="
				+ commentCount + "]";
	}
	
	
	
	
}
