package kr.study.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.study.VO.BcommentVO;
import kr.study.VO.BoardSearch;
import kr.study.VO.BoardVO;
import kr.study.VO.BuserVO;
import kr.study.VO.LikeVO;

public interface MyBatisDAO {

	
	void insert(BoardVO boardVO);

	int selectCount(HashMap<String, String> hmap_tot);
//	int selectCount(BoardVO vo);

	ArrayList<BoardVO> select(HashMap<String, String> hmap);

	void increment(int idx);

	BoardVO selectByIdx(int idx);

	void delete(int idx);

	void update(BoardVO boardVO);

	void insertComment(BcommentVO vo);

	ArrayList<BcommentVO> selectComment(HashMap<String, Integer> hmap);

	void deleteComment(int idx);

	void updateComment(BcommentVO vo);

	int selectCommentCount(int idx);

	int commentTotalCount(int idx);

	BcommentVO selectByCommentIdx(int idx);

	void re_updateComment(BcommentVO vo);

	void re_insertComment(BcommentVO vo);

	int selectMultiCountList(HashMap<String, String> searchMap);

	ArrayList<BoardVO> selectMulti(BoardSearch boardSearch);

	int findId(String id);

	BuserVO selectById(String id);

	void insertUser(BuserVO userVO);

	ArrayList<BoardVO> selectMajor(HashMap<String, String> hmap3);

	ArrayList<BoardVO> selectHit(HashMap<String, String> hmap4);

	void insertLike(HashMap<String, String> hmap);

	LikeVO selectLike(HashMap<String, String> hmap);

	void updateLike(HashMap<String, String> hmap);

	int likeCount(HashMap<String, String> hmap);

	ArrayList<LikeVO> selectLikeRank(HashMap<String, String> hmap5);

	ArrayList<BoardVO> selectLikeBoard(ArrayList<LikeVO> like_rank);

	BoardVO selectLikeBoard(LikeVO likeVO);

	
	
}
