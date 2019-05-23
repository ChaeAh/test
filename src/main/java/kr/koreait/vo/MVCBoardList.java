package kr.koreait.vo;

import java.util.ArrayList;

public class MVCBoardList {
	private ArrayList<MVCBoardVO> mvcBoardList = new ArrayList<MVCBoardVO>();
	private int pageSize;		
	private int totalCount;		
	private int totalPage;		
	private int currentPage;	
	private int startNo;		
	private int endNo; 			
	private int startPage;		
	private int endPage;
	private String type;
	
	public MVCBoardList() {};
	
	public void initMVCBoardList(int pageSize, int totalCount, int currentPage, String type){
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.type = type;
		calculator();
		
	}
	private void calculator(){
		totalPage = (totalCount - 1)/pageSize +1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage-1) * pageSize +1;
		endNo = startNo + pageSize -1;
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (currentPage-1)/10*10+1;
		endPage = startPage+9;
		endPage = endPage > totalPage ? totalPage : endPage;
	}
	public ArrayList<MVCBoardVO> getMvcBoardList() {
		return mvcBoardList;
	}
	public void setMvcBoardList(ArrayList<MVCBoardVO> mvcBoardList) {
		this.mvcBoardList = mvcBoardList;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
	
	
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "MVCBoardList [mvcBoardList=" + mvcBoardList + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo="
				+ endNo + ", startPage=" + startPage + ", endPage=" + endPage + ", type=" + type + "]";
	}

	
}

