package kr.study.VO;

import java.util.Date;

public class BcommentVO {

	private int idx;
	private String name;
	private String bcomment;
	private int subject_idx;			// 글 idx
	private int ref;						// 같은 글 그룹
	private int lev;							// 같은 글 그룹내 깊이
	private int seq;						// 같은 글 그룹내 우선순위
	private Date writeDate;
	private int deleteCheck;
	
	public int getDeleteCheck() {
		return deleteCheck;
	}
	public void setDeleteCheck(int deleteCheck) {
		this.deleteCheck = deleteCheck;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBcomment() {
		return bcomment;
	}
	public void setBcomment(String bcomment) {
		this.bcomment = bcomment;
	}
	public int getSubject_idx() {
		return subject_idx;
	}
	public void setSubject_idx(int subject_idx) {
		this.subject_idx = subject_idx;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	
	@Override
	public String toString() {
		return "BcommentVO [idx=" + idx + ", name=" + name + ", bcomment=" + bcomment + ", subject_idx=" + subject_idx
				+ ", ref=" + ref + ", lev=" + lev + ", seq=" + seq + ", writeDate=" + writeDate + ", deleteCheck="
				+ deleteCheck + "]";
	}
	
	
	
	
}
