package kr.study.VO;

import java.util.ArrayList;

public class BcommentList {

	private ArrayList<BcommentVO> bcommentList = new ArrayList<BcommentVO>();
	
	private int pageSize;
	private int totalPage;
	private int totalCount;
	private int recurrentPage;
	private int startNo;
	private int endNo;
	private int startPage;
	private int endPage;
	
	public BcommentList() {
	}
	
	
	public void BcommentList(int pageSize, int totalCount, int recurrentPage) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.recurrentPage = recurrentPage;
		cal();
	}

	private void cal() {
		totalPage = (totalCount-1) / pageSize +1;
		recurrentPage = recurrentPage > totalPage ? totalPage : recurrentPage;
		startNo = (recurrentPage -1) * pageSize +1;
		endNo = startNo + pageSize -1;
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (recurrentPage -1) /10 * 10 +1;
		endPage = startPage +9;
		endPage = endPage > totalPage ? totalPage :  endPage;
		
	}
	
	
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	

	public int getRecurrentPage() {
		return recurrentPage;
	}

	public void setRecurrentPage(int recurrentPage) {
		this.recurrentPage = recurrentPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public ArrayList<BcommentVO> getBcommentList() {
		return bcommentList;
	}


	public void setBcommentList(ArrayList<BcommentVO> bcommentList) {
		this.bcommentList = bcommentList;
	}


	@Override
	public String toString() {
		return "BcommentList [bcommentList=" + bcommentList + ", pageSize=" + pageSize + ", totalPage=" + totalPage
				+ ", totalCount=" + totalCount + ", recurrentPage=" + recurrentPage + ", startNo=" + startNo
				+ ", endNo=" + endNo + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}

	
	
}
