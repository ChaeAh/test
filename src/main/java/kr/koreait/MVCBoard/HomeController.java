package kr.koreait.MVCBoard;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.koreait.vo.MVCBoardList;
import kr.koreait.vo.MVCBoardVO;
import kr.study.VO.BcommentList;
import kr.study.VO.BcommentVO;
import kr.study.VO.BoardList;
import kr.study.VO.BoardSearch;
import kr.study.VO.BoardVO;
import kr.study.VO.BuserVO;
import kr.study.VO.LikeVO;
import kr.study.dao.MyBatisDAO;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		
		return "redirect:index";
	}
	
	@RequestMapping("/index")
	   public String index(HttpServletRequest request, Model model, HttpSession session) {
	      //게시판 DB 호출 및 model 저장
	      MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
	      
	      int currentPage = 1;
	      int totalCount = 5;
	      int pageSize = 5;
	      model.addAttribute("rn", "\r\n");
	      BoardList boardList = ctx.getBean("BoardList", BoardList.class);
			boardList.BoardList(pageSize, totalCount, currentPage);
	      HashMap<String, String> hmap = new HashMap<String, String>();
	      hmap.put("startNo","1");
	      hmap.put("endNo", "5");
	      
	      String contentType="공지"; //= request.getParameter("contentType");
	      String contentSubType="공지"; //= request.getParameter("contentSubType");
	      hmap.put("type", contentType);
	      hmap.put("sub_type", contentSubType);
	      boardList.setBoardList(mapper.select(hmap));
	      model.addAttribute("infoList", boardList);      
//	      
	      BoardList freeList = ctx.getBean("BoardList", BoardList.class);
	      freeList.BoardList(pageSize, totalCount, currentPage);
	      HashMap<String, String> hmap2 = new HashMap<String, String>();
	      hmap2.put("startNo","1");
	      hmap2.put("endNo", "5");
	      String contentType2="자유"; //= request.getParameter("contentType");
	      String contentSubType2="자유"; //= request.getParameter("contentSubType");
	      hmap2.put("type", contentType2);
	      hmap2.put("sub_type", contentSubType2);
	      freeList.setBoardList(mapper.select(hmap2));
	      model.addAttribute("freeList", freeList);      
	      
//	   전공별
	      BoardList majorList = ctx.getBean("BoardList", BoardList.class);
	      majorList.BoardList(pageSize, totalCount, currentPage);	      
	      HashMap<String, String> hmap3 = new HashMap<String, String>();
	      hmap3.put("startNo","1");
	      hmap3.put("endNo", "5");
	      majorList.setBoardList(mapper.selectMajor(hmap3));
	      model.addAttribute("majorList", majorList);      
	      
//	  조회수별
	      BoardList hitList = ctx.getBean("BoardList", BoardList.class);
	      hitList.BoardList(pageSize, totalCount, currentPage);	      
	      HashMap<String, String> hmap4 = new HashMap<String, String>();
	      hmap4.put("startNo","1");
	      hmap4.put("endNo", "5");
	      hitList.setBoardList(mapper.selectHit(hmap4));
	      model.addAttribute("hitList", hitList);      
	      
//	  좋아요가 많은 순별
		  
	      BoardList likeList = ctx.getBean("BoardList", BoardList.class);
	      likeList.BoardList(pageSize, totalCount, currentPage);	      
	      HashMap<String, String> hmap5 = new HashMap<String, String>();
	      hmap5.put("startNo","1");
	      hmap5.put("endNo", "5");
	      ArrayList<LikeVO> like_rank = mapper.selectLikeRank(hmap5);
//	      mapper.selectLikeRank(hmap5);
	      ArrayList<BoardVO> likeBoard = new ArrayList<BoardVO>();
	      for(int i=0; i<like_rank.size(); i++) {
	    	  likeBoard.add(mapper.selectLikeBoard(like_rank.get(i)));
	      }
	      model.addAttribute("likeBoard", likeBoard);      
			return "index";
	   }
	
	@RequestMapping("/sidebar")
	public String sidebar(HttpServletRequest request, Model model, HttpSession session) {
		String currentPage = request.getParameter("currentPage");
		String contentType = request.getParameter("contentType");
		String contentSubType = request.getParameter("contentSubType");
		System.out.println(currentPage + "  " + contentType);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("contentType", contentType);
		model.addAttribute("contentSubType", contentSubType);
			
		return "sidebar";
	}
	
	@RequestMapping("/about")
	public String about(HttpServletRequest request, Model model, HttpSession session) {
					
		return "about";
	}
	
//		@RequestMapping("/list")
//	public String list(HttpServletRequest request, Model model) {		
//		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:myBean.xml");
//		
//		int currentPage = 1;
//		String contentType = "";
//		try {
//			currentPage = Integer.parseInt(request.getParameter("currentPage"));
//			contentType = request.getParameter("contentType");
//		}catch (Exception e) {}
//		System.out.println(contentType);
//		int pageSize = 10;
//		
//		selectService sc = ctx.getBean("select", selectService.class);
//		
//		
//		MVCBoardList boardList = ctx.getBean("mvcBoardList", MVCBoardList.class);
//		sc.toString2(boardList);
//		model.addAttribute("mvcBoardList", boardList);
//		
//		return "list";
//	}
		
		@Autowired
		public SqlSession sqlsession;
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");

		@RequestMapping("/insert")
		public String insert(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController insert() 메소드 실행");
			String[] mainArray = { "자유","인문사회", "예체능", "공학", "자연과학", "의학", "교육"};

			model.addAttribute("mainArray", mainArray);
			return "insert";
		}

		@RequestMapping("/insertOK")
		public String insertOK(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController insertOK() 메소드 실행");

			String sub_type = request.getParameter("sub_type");
			String subject = request.getParameter("subject");
			String name = (String) session.getAttribute("userVO");
			String content = request.getParameter("content");
			String type = request.getParameter("type");
			System.out.println(content);
			System.out.println(name);
			BoardVO boardVO = ctx.getBean("BoardVO", BoardVO.class);

			BcommentVO vo = ctx.getBean("BcommentVO", BcommentVO.class);

			boardVO.setSub_type(sub_type);
			boardVO.setName(name);
			boardVO.setContent(content);
			boardVO.setSubject(subject);
			boardVO.setType(type);

			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);

			mapper.insert(boardVO);
			System.out.println(boardVO);
			model.addAttribute("contentType", type);
			return "redirect: list";
		}

		@RequestMapping("/list")
		public String list(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController list() 메소드 실행");
			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
						
			int currentPage = 1;
			int recurrentPage = 1;
			String contentType=""; //= request.getParameter("contentType");
			String contentSubType=""; //= request.getParameter("contentSubType");
			String select="";
			String search = "";
			
			try {
				contentType = request.getParameter("contentType");
				contentSubType = request.getParameter("contentSubType");
				if(contentSubType == null) {
					contentSubType="";
				}
			} catch (Exception e) {
				System.out.println("tryCatch");
				contentType = "";
				contentSubType = "";
			}
			
			try {
				select = request.getParameter("select");
				search = request.getParameter("search");
				if (search != null || search.trim().length() != 0) {
					session.setAttribute("search", search);
					session.setAttribute("select", select);
				}
				if(search ==null || search.trim().length() == 0 || contentSubType.equals("") ) {
					session.setAttribute("search","");
				}
			} catch (Exception e) {
				String temp = (String) session.getAttribute("search");
				if (temp != null) {
					search = temp;
				}
				temp = (String) session.getAttribute("select");
				if (temp != null) {
					select = temp;
				}
			}

			try {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			} catch (Exception e) {
			}
			
			int pageSize = 10;
			HashMap<String, String> hmap_tot = new HashMap<String, String>();
			hmap_tot.put("type", contentType);
			hmap_tot.put("sub_type", contentSubType);
			int totalCount = mapper.selectCount(hmap_tot);

			BoardList boardList = ctx.getBean("BoardList", BoardList.class);
			boardList.BoardList(pageSize, totalCount, currentPage);

			HashMap<String, String> hmap = new HashMap<String, String>();
			hmap.put("startNo", boardList.getStartNo()+"");
			hmap.put("endNo", boardList.getEndNo()+"");
			hmap.put("type", contentType);
			hmap.put("sub_type", contentSubType);
			
			// 검색/////////////////////////////////////////////////
			if (search == null || search.trim().length() == 0 ) {
					session.removeAttribute("search");
					boardList.setBoardList(mapper.select(hmap));
				} else {
					System.out.println(contentType);
					HashMap<String, String> searchMap = new HashMap<String, String>();
					searchMap.put("select", select);
					searchMap.put("search", search);
					searchMap.put("type", contentType);
					searchMap.put("sub_type", contentSubType);
					int searchCount = mapper.selectMultiCountList(searchMap);
					System.out.println(searchCount);

					boardList.BoardList(pageSize, searchCount, currentPage);

					BoardSearch boardSearch = new BoardSearch();
					boardSearch.setStartNo(boardList.getStartNo());
					boardSearch.setEndNo(boardList.getEndNo());
					boardSearch.setSearch(search);
					boardSearch.setSelect(select);
					boardSearch.setType(contentType);
					boardSearch.setSub_type(contentSubType);
					boardList.setBoardList(mapper.selectMulti(boardSearch));
			
				}
			// 댓글갯수/////////////////////////////////////////
			int commentCount = 0;
			System.out.println("asdfasdfa : " + boardList);
//			ArrayList<Integer> comment = new ArrayList<Integer>();

			for (int i = 0; i < boardList.getBoardList().size(); i++) {
				commentCount = mapper.selectCommentCount(boardList.getBoardList().get(i).getIdx());
//				comment.add(commentCount);
				boardList.getBoardList().get(i).setCommentCount(commentCount);
			}
//			BoardVO boardvo = ctx.getBean("BoardVO", BoardVO.class);

			
			model.addAttribute("rn", "\r\n");
			model.addAttribute("boardList", boardList);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("recurrentPage", recurrentPage);
			model.addAttribute("contentType", contentType);
			model.addAttribute("contentSubType", contentSubType);
			
			
			return "list";
		}

		
		@RequestMapping("/increment")
		public String increment(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController increment() 메소드 실행");
			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
			String contentType= request.getParameter("contentType");
			String contentSubType=request.getParameter("contentSubType");
			
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int idx = Integer.parseInt(request.getParameter("idx"));
			int recurrentPage = 1;

			mapper.increment(idx);

			model.addAttribute("currentPage", currentPage);
			model.addAttribute("idx", idx);
			model.addAttribute("recurrentPage", recurrentPage);
			model.addAttribute("contentType", contentType);
			model.addAttribute("contentSubType", contentSubType);

			return "redirect:contentView";
		}

		@RequestMapping("/contentView")
		public String contentView(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController view() 메소드 실행");
			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
			
			String contentType= request.getParameter("contentType");
			String contentSubType=request.getParameter("contentSubType");
			
	
			int currentPage = 1;
			int idx = Integer.parseInt(request.getParameter("idx"));
			try {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			} catch (Exception e) {
			}

			BoardVO boardVO = ctx.getBean("BoardVO", BoardVO.class);
			boardVO = mapper.selectByIdx(idx);

	////////////////////////////////////////////////////////////

			int recurrentPage = 1;
			try {
				recurrentPage = Integer.parseInt(request.getParameter("recurrentPage"));
			} catch (Exception e) {

			}

			BcommentVO commentvo = ctx.getBean("BcommentVO", BcommentVO.class);
			BcommentList list = ctx.getBean("BcommentList", BcommentList.class);
			BoardList boardList = ctx.getBean("BoardList", BoardList.class);

			int pageSize = 10;
			int totalCount = mapper.commentTotalCount(idx);

			list.BcommentList(pageSize, totalCount, recurrentPage);
			HashMap<String, Integer> hmap = new HashMap<String, Integer>();
			hmap.put("startNo", list.getStartNo());
			hmap.put("endNo", list.getEndNo());
			hmap.put("subject_idx", idx);

			list.setBcommentList(mapper.selectComment(hmap));
			
			
//		//////////////////////////////////////////////////////////////////
			int user_idx=0;
			try {
			 user_idx = Integer.parseInt( String.valueOf(session.getAttribute("user_idx")));
			}catch(Exception e) { }
			System.out.println(user_idx);
			
			LikeVO likeVO = ctx.getBean("LikeVO", LikeVO.class);
			HashMap<String, String> likemap = new HashMap<String, String>();
			likemap.put("board_idx", idx+"");
			likemap.put("user_idx",user_idx+"");
			likeVO=mapper.selectLike(likemap);
			int like_count=mapper.likeCount(likemap);
			if(likeVO !=null) {
				model.addAttribute("likeVO", likeVO.getLike_check());
			}
			
			System.out.println("토탈카운트" + totalCount);
			System.out.println(list);
			model.addAttribute("rn", "\r\n");
			model.addAttribute("bcommentList", list);
			model.addAttribute("vo", boardVO);
			model.addAttribute("idx", idx);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("recurrentPage", recurrentPage);
			model.addAttribute("contentType", contentType);
			model.addAttribute("contentSubType", contentSubType);
			model.addAttribute("like_count", like_count);
			
			return "contentView";
		}

		/*
		 * @RequestMapping("/update") public String update(HttpServletRequest request,
		 * Model model) { System.out.println("HomeController update() 메소드 실행");
		 * MyBatisDAO mapper= sqlsession.getMapper(MyBatisDAO.class); int currentPage =
		 * Integer.parseInt(request.getParameter("currentPage")); int idx
		 * =Integer.parseInt(request.getParameter("idx")); BoardVO boardVO =
		 * ctx.getBean("BoardVO",BoardVO.class); boardVO= mapper.selectByIdx(idx);
		 * model.addAttribute("vo", boardVO); model.addAttribute("idx", idx);
		 * model.addAttribute("currentPage", currentPage);
		 * 
		 * model.addAttribute("type",request.getParameter("type"));
		 * System.out.println(request.getParameter("type")); return "update"; }
		 */

		@RequestMapping("/update")
		   public String update(HttpServletRequest request, Model model, HttpSession session) {
		      System.out.println("HomeController update() 메소드 실행");
		      MyBatisDAO mapper= sqlsession.getMapper(MyBatisDAO.class);
		      int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		      int idx =Integer.parseInt(request.getParameter("idx"));
		      BoardVO boardVO = ctx.getBean("BoardVO",BoardVO.class);
		      boardVO= mapper.selectByIdx(idx);
		      String contentType = request.getParameter("contentType");
		      String contentSubType = request.getParameter("contentSubType");
		      
		      
//		      String [] mainArray = {"인문사회","예체능","공학"};
//		      String [] array = { "작곡","공학", "전자","전기","컴퓨터","건축","산업안전",
//		            "재료","기계","화학","에너지","교육"};
//		      model.addAttribute("mainArray", mainArray);
//		      model.addAttribute("array", array);
		      
		      model.addAttribute("vo", boardVO);
		      model.addAttribute("idx", idx);
		      model.addAttribute("currentPage", currentPage);
		      model.addAttribute("contentType", contentType);
		      model.addAttribute("contentSubType", contentSubType);
		      /*
		       * model.addAttribute("type",request.getParameter("type"));
		       * System.out.println(request.getParameter("type"));
		       */   return "update";
		   }
		
		@RequestMapping("/updateOK")
		public String updateOK(HttpServletRequest request, Model model, HttpSession session) {
			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int idx = Integer.parseInt(request.getParameter("idx"));
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String contentType = request.getParameter("contentType");
			String contentSubType = request.getParameter("contentSubType");
			
			Timestamp sqlDate = new Timestamp(new Date().getTime());
			BoardVO boardVO = ctx.getBean("BoardVO", BoardVO.class);
			boardVO.setIdx(idx);
			boardVO.setContent(content);
			boardVO.setSubject(subject);
			boardVO.setWriteDate(sqlDate);
			mapper.update(boardVO);
			System.out.println("HomeController updateOK() 메소드 실행" + boardVO);

			model.addAttribute("idx", idx);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("contentType", contentType);
			model.addAttribute("contentSubType", contentSubType);

			return "redirect:contentView";
		}

		@RequestMapping("/delete")
		public String delete(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController delete() 메소드 실행");
			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int idx = Integer.parseInt(request.getParameter("idx"));
			String contentType = request.getParameter("contentType");
			String contentSubType = request.getParameter("contentSubType");

			mapper.delete(idx);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("contentType", contentType);
			model.addAttribute("contentSubType", contentSubType);
			return "redirect:list";
		}

		@RequestMapping("/CommentOK")
		public String CommentOK(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController CommentOK() 메소드 실행");
			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
			
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			int idx = Integer.parseInt(request.getParameter("idx"));
			int mode = Integer.parseInt(request.getParameter("mode"));
			int subject_idx = Integer.parseInt(request.getParameter("subject_idx"));
			int recurrentPage = Integer.parseInt(request.getParameter("recurrentPage"));
			int seq = 0;
			int lev = 0;
			try {
				seq = Integer.parseInt(request.getParameter("seq"));
				lev = Integer.parseInt(request.getParameter("lev"));
			}catch (Exception e) {
				// TODO: handle exception
			}
			Timestamp sqlDate = new Timestamp(new Date().getTime());
			String bcomment = request.getParameter("bcomment");
			String name = (String)session.getAttribute("userVO");
			String contentType = request.getParameter("contentType");
			String contentSubType = request.getParameter("contentSubType");
			BcommentVO vo = ctx.getBean("BcommentVO", BcommentVO.class);

			vo.setIdx(idx);
			vo.setSubject_idx(subject_idx);
			vo.setName(name);
			vo.setBcomment(bcomment);
			vo.setSeq(seq);
			vo.setLev(lev);
			vo.setWriteDate(sqlDate);
			switch (mode) {
			case 1:
				System.out.println(vo);
				mapper.insertComment(vo);
				break;
			case 2:
				mapper.updateComment(vo);
				break;
			case 3:
				mapper.deleteComment(idx);
				break;
			case 4:
				vo.setLev(vo.getLev() + 1);
				vo.setSeq(vo.getSeq() + 1);

				HashMap<String, Integer> hmap = new HashMap<String, Integer>();
				hmap.put("ref", vo.getRef());
				hmap.put("seq", vo.getSeq());

				mapper.re_updateComment(vo);

				mapper.re_insertComment(vo);

				break;
			}
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("recurrentPage", recurrentPage);
			model.addAttribute("idx", subject_idx);
			model.addAttribute("contentType", contentType);
			model.addAttribute("contentType", contentSubType);

			return "redirect:contentView";
		}

		@RequestMapping("/register")
		public String register(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController register() 메소드 실행");
			return "register";
		}

		@RequestMapping("/registerOK")
		public String registerOK(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController registerOK() 메소드 실행");
			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String pw = request.getParameter("pw");
			String id_check = request.getParameter("id_check");
			BuserVO userVO = ctx.getBean("BuserVO", BuserVO.class);

			userVO.setId(id);
			userVO.setName(name);
			userVO.setPw(pw);
			mapper.insertUser(userVO);
			return "redirect:login";
		}

		@RequestMapping("/login")
		public String login(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("컨트롤러의 login( ) 메소드");
			String referer = request.getHeader("Referer");
			request.setAttribute("referer", referer);
			return "login";
		}

		@RequestMapping("/logout")
		public String logout(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("컨트롤러의 logout( ) 메소드");
			session.removeAttribute("userVO");
			return "redirect:index";
		}

		@RequestMapping("/loginOK")
		public String loginOK(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("컨트롤러의 loginOK( ) 메소드");
			String referer = (String) request.getParameter("referer");
			String url ="";
//			System.out.println(referer);
			
			if(referer != null) {
				System.out.println(referer);
				url = "redirect:"+ referer;
			}
			
			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
			String id = request.getParameter("id").trim();
			String pw = request.getParameter("pw").trim();
			String remember_id = request.getParameter("remember_id");
			BuserVO userVO = ctx.getBean("BuserVO", BuserVO.class);
			int result = mapper.findId(id);

			if (result == 1) {
//				System.out.println("아이디있음");
				userVO = mapper.selectById(id);
				if (userVO.getPw().equals(pw)) {
					System.out.println("아이디,패스워드 확인 완료");
				} else {
					System.out.println("비밀번호 없음");
					model.addAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
					return "login";
				}
			} else {
				System.out.println("아이디없음");
				model.addAttribute("msg", "등록된 아이디가 없습니다.");
				return "login";
			}

			session.setAttribute("user_idx", userVO.getIdx());
			session.setAttribute("user_id", userVO.getId());
			session.setAttribute("userVO", userVO.getName());
			session.setAttribute("userVO_admin", userVO.getAdmin());
//			System.out.println("유저인덱스" +userVO.getIdx());
			
			return url;
		}

		@ResponseBody
		@RequestMapping(value = "/registerCheck", method = RequestMethod.POST)
		public String registerCheck(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController registerCheck() 메소드 실행");
			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
			String id = request.getParameter("id");
			BuserVO userVO = ctx.getBean("BuserVO", BuserVO.class);
			System.out.println(id);
			userVO = mapper.selectById(id);
			System.out.println(userVO);
			
			int result=0;
			if(userVO !=null) {
				result =1;
			}
			
			System.out.println(result);
			/*
			 * if (userVO.getId().equals(id)) { model.addAttribute("msg", "아이디가 이미 존재합니다");
			 * } else { model.addAttribute("msg", "등록된 아이디가 없습니다."); }
			 */
			return String.valueOf(result);
		}

		@ResponseBody
		@RequestMapping(value = "/like_check", method = RequestMethod.GET )
		public String like_check(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController like_check() 메소드 실행");
			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
			int board_idx = Integer.parseInt(request.getParameter("board_idx"));
			System.out.println(board_idx );
			int user_idx = Integer.parseInt(request.getParameter("user_idx"));
			System.out.println(user_idx );
			BoardVO boardVO = ctx.getBean("BoardVO", BoardVO.class);
			boardVO = mapper.selectByIdx(board_idx);
			System.out.println(boardVO);
			HashMap<String, String> hmap = new HashMap<String, String>();
			hmap.put("board_idx", board_idx+"");
			hmap.put("user_idx", user_idx+"");
			
			LikeVO likeVO = ctx.getBean("LikeVO", LikeVO.class);
			likeVO = mapper.selectLike(hmap);
			System.out.println(likeVO);
			int like_check=0;
			int like_count=0;
			
			if(likeVO != null) {
				like_check= likeVO.getLike_check();
				System.out.println(like_check );
				if(like_check==0) {
					like_check=1;
					hmap.put("like_check",like_check+"");
					mapper.updateLike(hmap);
					System.out.println("update 성공" );
				}else {
					like_check=0;
					hmap.put("like_check",like_check+"");
					mapper.updateLike(hmap);
				}
			}else {
				System.out.println("insert 성공전" );
				mapper.insertLike(hmap);
				System.out.println("insert 성공" );
				like_check=1;
			}
			like_count=	mapper.likeCount(hmap);
			
			
			System.out.println("like_check : " +like_check);
			JSONObject obj = new JSONObject();
		/* obj.put("board_idx", likeVO.getBoard_idx()); */
			obj.put("like_check", like_check);
			obj.put("like_count", like_count);

			
			return obj.toJSONString();
		}
		
		@RequestMapping("/memberinfo")
		public String memberinfo(HttpServletRequest request, Model model, HttpSession session) {
			System.out.println("HomeController insert() 메소드 실행");
			
			BuserVO buserVo = ctx.getBean("BuserVO", BuserVO.class);
			MyBatisDAO mapper = sqlsession.getMapper(MyBatisDAO.class);
			String id = (String) session.getAttribute("user_id");
			
//			System.out.println(id);
			
			buserVo = mapper.selectById(id);
			
			model.addAttribute("user", buserVo);
			return "memberInfo";
		}
		
	}

