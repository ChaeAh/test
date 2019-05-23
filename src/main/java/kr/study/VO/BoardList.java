package kr.study.VO;

import java.util.ArrayList;

public class BoardList {

	private ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
	
	private int pageSize;
	private int totalPage;
	private int totalCount;
	private int currentPage;
	private int startNo;
	private int endNo;
	private int startPage;
	private int endPage;
	
	public BoardList() {
	}
	
	public void BoardList(int pageSize, int totalCount, int currentPage) {
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		cal();
	}
	
	private void cal() {
		totalPage = (totalCount-1)  / pageSize+1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
		startNo = (currentPage-1) * pageSize+1;
		endNo = startNo + pageSize -1;
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (currentPage -1) / 10 * 10 +1;
		endPage = startPage + 9;
		endPage = endPage > totalPage ? totalPage : endPage;
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

	public ArrayList<BoardVO> getBoardList() {
		return boardList;
	}

	public void setBoardList(ArrayList<BoardVO> boardList) {
		this.boardList = boardList;
	}

	@Override
	public String toString() {
		return "BoardList [boardList=" + boardList + ", pageSize=" + pageSize + ", totalPage=" + totalPage
				+ ", totalCount=" + totalCount + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo="
				+ endNo + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
	
	
}
