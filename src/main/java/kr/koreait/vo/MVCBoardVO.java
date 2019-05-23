package kr.koreait.vo;

import java.util.Date;

public class MVCBoardVO {
	private int idx;
	private String type;
	private String type_sub;
	private String subject;
	private String content;
	private String name;
	private int hit;
	private Date writeDate;
	
	public MVCBoardVO() {
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

	public String getType_sub() {
		return type_sub;
	}

	public void setType_sub(String type_sub) {
		this.type_sub = type_sub;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
		return "MVCBoardVO [idx=" + idx + ", type=" + type + ", type_sub=" + type_sub + ", subject=" + subject
				+ ", content=" + content + ", name=" + name + ", hit=" + hit + ", writeDate=" + writeDate + "]";
	}
	
	
}
