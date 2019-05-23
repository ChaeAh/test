package kr.study.VO;

public class LikeVO {

	
	private int idx;
	private int board_idx;
	private int user_idx;
	private int like_check;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	@Override
	public String toString() {
		return "LikeVO [idx=" + idx + ", board_idx=" + board_idx + ", user_idx=" + user_idx + ", like_check="
				+ like_check + "]";
	}
	
	
}
