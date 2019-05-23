package kr.koreait.vo;

import java.util.Date;

public class MVCBcomment {
	private int idx;
	private String name;
	private String bcomment;
	private int subject_idx;
	private int ref;
	private int lev;
	private int seq;
	private Date writeDate;
	
	public MVCBcomment() {
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
		return "MVCBcomment [idx=" + idx + ", name=" + name + ", bcomment=" + bcomment + ", subject_idx=" + subject_idx
				+ ", ref=" + ref + ", lev=" + lev + ", seq=" + seq + ", writeDate=" + writeDate + "]";
	}
	
}
