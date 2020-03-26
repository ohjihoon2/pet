package com.myspring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.pettoday.dao.CommunityDAO;
import com.pettoday.vo.AnswerVO;
import com.pettoday.vo.SessionVO;
import com.pettoday.vo.WonderAnswerReplyVO;
import com.pettoday.vo.WonderReplyVO;
import com.pettoday.vo.WonderVO;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityDAO communityDao;
	/**
	 * 궁금해요 wonder page 
	 * @return
	 */
	@RequestMapping(value = "/wonder.do", method = RequestMethod.GET)
	public ModelAndView wonder(String rpage, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");
		System.out.println("sid = "+sid);
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	
		int reqPage = 1;	
		int pageCount = 1;	
		int dbCount = communityDao.execTotalCount();	
		
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
	 		endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 5;
		}
		
		ArrayList<WonderVO> list = communityDao.wonderList(startCount, endCount);
		
		mv.addObject("list",list);
		mv.addObject("sid",sid);
		mv.addObject("dbCount",dbCount);
		mv.addObject("rpage",rpage);
		mv.addObject("pageSize",pageSize);
		mv.setViewName("/community1/wonder.user");
		return mv;
	}
	
	@RequestMapping(value = "/wonder_search.do", method = RequestMethod.GET)
	public ModelAndView wonderSearch(String rpage, String search, String sort) {
		System.out.println("잘됩니다아아");
		System.out.println("rpage =" + rpage);
		System.out.println("search =" + search);
		System.out.println("sort =" + sort);
		
		ModelAndView mv = new ModelAndView();
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;	
		int reqPage = 1;	
		int pageCount = 1;	
		int dbCount = communityDao.execSearchCount(search, sort);	
		
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
	 		endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = 5;
		}	
		
		ArrayList<WonderVO> list = communityDao.wonderList(startCount, endCount, search, sort);
		
		mv.addObject("search",search);
		mv.addObject("sort",sort);
		mv.addObject("list",list);
		mv.addObject("dbCount",dbCount);
		mv.addObject("rpage",rpage);
		mv.addObject("pageSize",pageSize);
		mv.setViewName("/community1/wonder.user");
		return mv;
	}
	
	/**
	 * 궁금해요 상세페이지
	 * @return
	 */
	@RequestMapping(value = "/wonderDetail.do", method = RequestMethod.GET)
	public ModelAndView wonderDetail(String wonder_no , HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");
		
		int wReplyCount = communityDao.WonderReplyCount(wonder_no);
		
		System.out.println("wReplycount = "+wReplyCount);
		WonderVO wvo = communityDao.WonderContent(wonder_no);
		
		
		communityDao.WonderViewUpdate(wonder_no);
		ArrayList<AnswerVO> alist = communityDao.AnswerContentList(wonder_no);
		
		for(AnswerVO avo : alist) {
			int answerCount = communityDao.selectAnswerCount(avo.getWonder_answer_no());
			avo.setAnswer_count(answerCount);
		}
		
		mv.addObject("wReplyCount",wReplyCount);
		mv.addObject("sid",sid);
		mv.addObject("wvo", wvo);
		mv.addObject("alist", alist);
		mv.setViewName("/community1/wonderDetail.user");
		
		return mv;
	}
	
	/**
	 * 궁금해요 질문 작성 
	 * @return
	 */
	@RequestMapping(value = "/wonderNew.do", method = RequestMethod.GET)
	public ModelAndView wonderNew(String id, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");
		System.out.println("wonderNew - sid = " +sid);
		mv.addObject("sid", sid);
		mv.setViewName("/community1/wonderNew.user");
		
		return mv;
	}
	
	
	@RequestMapping(value = "/wonderNew_proc.do", method = RequestMethod.POST)
	public ModelAndView wonderNew_proc(WonderVO vo) {
		//String sid = (String) session.getAttribute("sid");
		ModelAndView mv = new ModelAndView();
		
		System.out.println("1"+vo.getWonder_title());
		System.out.println("2"+vo.getWonder_content());
		System.out.println("3"+vo.getWonder_writer());
			
		
		
		//vo.setWonder_writer(sid);
		int int_result = communityDao.wonderWrite(vo);
		System.out.println("insert 값은 "+int_result);
		
		if(int_result != 0) {
			
			mv.setViewName("redirect:/wonder.do");
		}else {
			mv.setViewName("/errorPage.user");
		}
		
		
		return mv;
	}
	
	/**
	 * 집근처 동물 병원
	 * @return
	 */
	@RequestMapping(value = "/hospitalMap.do", method = RequestMethod.GET)
	public ModelAndView hospitalMap(HttpSession session) {
			
		String mem_id = (String)session.getAttribute("sid");
		System.out.println("mem_id = "+mem_id);
		String place = "";
		ModelAndView mv = new ModelAndView();
		if(mem_id != null) {
			place = communityDao.NearHospital(mem_id);	
		}else {
			place = "강남역";
		}
		
		mv.addObject("place",place);
		mv.setViewName("/community1/hospitalMap.user");
		
		return mv;
	}
	
	/**
	 * 질문 답변쓰기
	 * @return
	 */
	@RequestMapping(value = "/answerNew.do", method = RequestMethod.GET)
	public ModelAndView testNew(String wonder_no) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("wonder_no", wonder_no);
		//실행하고 result 값을 1로 받으면 reload해주기 위해서 기본값을 0 을 주고 저장  
		mv.addObject("result","0");
		mv.setViewName("/community1/answerNew.none");
		
		return mv;
	}
	
	@RequestMapping(value = "/answer_proc.do", method = RequestMethod.POST)
	public ModelAndView answer_proc(AnswerVO avo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String) session.getAttribute("sid");
		System.out.println("wno= "+avo.getWonder_no());
		System.out.println("atitle= "+avo.getWonder_answer_title());
		System.out.println("acontent= "+avo.getWonder_answer_content());
		System.out.println("acontent= "+avo.getWonder_answer_writer());
		
		mv.addObject("sid",sid);
		int int_result = communityDao.AnswerInsert(avo);
		if(int_result != 0) {
			mv.setViewName("/community1/answerNew.none");
			mv.addObject("result",String.valueOf(int_result));
		}
		return mv;
	}
	
	/**
	 * 질문 댓글 개수
	 * @param wonder_no
	 * @return
	 */
	/*@RequestMapping(value = "/wonder_reply_count.do", method = RequestMethod.GET)
	@ResponseBody
	public int wonder_reply_count(String wonder_no) {
		
		int count = communityDao.WonderReplyCount(wonder_no);
		
		return count;
	}*/
	
	/**
	 * ajax를 통한 질문 댓글 list 출력 
	 * @param wonder_no
	 * @return
	 */
	@RequestMapping(value = "/wonder_reply_list.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String wonder_reply_list(String wonder_no) {
		
		ArrayList<WonderReplyVO> wrlist = communityDao.WonderReplyList(wonder_no);
		int wReplyCount = communityDao.WonderReplyCount(wonder_no);
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		for(WonderReplyVO vo :wrlist) {
			JsonObject obj = new JsonObject();
			obj.addProperty("wonder_reply_content",vo.getWonder_reply_content());
			obj.addProperty("wonder_reply_date",vo.getWonder_reply_date() );
			obj.addProperty("wonder_reply_writer",vo.getWonder_reply_writer() );
			obj.addProperty("wonder_no",vo.getWonder_no() );
			obj.addProperty("wonder_reply_no",vo.getWonder_reply_no() );
			obj.addProperty("wonder_reply_count",vo.getWonder_reply_count() );
			
			jlist.add(obj);
		}
		jdata.add("wrlist", jlist);
		jdata.addProperty("wReplyCount", wReplyCount);
		return String.valueOf(gson.toJson(jdata));
	}
	/**
	 * 질문 댓글 등록
	 * @param wonder_reply_writer
	 * @param wonder_reply_content
	 * @param wonder_no
	 * @return
	 */
	@RequestMapping(value = "/wonder_reply_proc.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String wonder_reply_proc(WonderReplyVO vo) {
		
		System.out.println("getWonder_reply_content = "+vo.getWonder_reply_content());
		System.out.println("getWonder_reply_writer = "+vo.getWonder_reply_writer());
		System.out.println("getWonder_no = "+vo.getWonder_no());
		/*WonderReplyVO vo = new WonderReplyVO();
		
		vo.setWonder_reply_content(wonder_reply_content.replace("\r\n", "<br>"));
		vo.setWonder_reply_writer(wonder_reply_writer);
		vo.setWonder_no(Integer.valueOf(wonder_no));*/
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		/*System.out.println("wonder_reply_writer = "+wonder_reply_writer );
		System.out.println("wonder_reply_content = "+wonder_reply_content );
		System.out.println("wonder_no = "+wonder_no );*/
		
		int int_result = communityDao.WonderReplyInsert(vo);
		if(int_result != 0) {
			
			int wReplyCount = communityDao.WonderReplyCount(String.valueOf(vo.getWonder_no()));
			
			
			ArrayList<WonderReplyVO> wrlist = communityDao.WonderReplyList(String.valueOf(vo.getWonder_no()));
			
			for(WonderReplyVO wrvo :wrlist) {
				JsonObject obj = new JsonObject();
				obj.addProperty("wonder_reply_content",wrvo.getWonder_reply_content());
				obj.addProperty("wonder_reply_date",wrvo.getWonder_reply_date() );
				obj.addProperty("wonder_reply_writer",wrvo.getWonder_reply_writer() );
				obj.addProperty("wonder_no",wrvo.getWonder_no() );
				obj.addProperty("wonder_reply_no",wrvo.getWonder_reply_no() );
				
				jlist.add(obj);
			}
			jdata.add("wrlist2", jlist);
			jdata.addProperty("wReplyCount", wReplyCount);
		}
		
		return String.valueOf(gson.toJson(jdata));
	}
	
	/**
	 * ajax를 통한 댓글 list 출력
	 * @param wonder_answer_no
	 * @return
	 */
	@RequestMapping(value = "/answer_reply_list.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String answer_reply_list(String wonder_answer_no) {
		
		ArrayList<WonderAnswerReplyVO> arlist = communityDao.AnswerReplyList(wonder_answer_no);
		
		int aReplyCount = communityDao.AnswerReplyCount(wonder_answer_no); //4
		System.out.println("aReplyCount= "+aReplyCount);
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		for(WonderAnswerReplyVO vo :arlist) {
			JsonObject obj = new JsonObject();
			obj.addProperty("wonder_answer_reply_content",vo.getWonder_answer_reply_content());
			obj.addProperty("wonder_answer_reply_date",vo.getWonder_answer_reply_date() );
			obj.addProperty("wonder_answer_reply_writer",vo.getWonder_answer_reply_writer() );
			obj.addProperty("wonder_answer_no",vo.getWonder_answer_no() );
			obj.addProperty("wonder_answer_reply_no",vo.getWonder_answer_reply_no() );
			
			jlist.add(obj);
		}
		
		/*ArrayList<AnswerVO> alist = communityDao.AnswerContentList(wonder_no);
		
		for(AnswerVO avo : alist) {
			int answerCount = communityDao.selectAnswerCount(avo.getWonder_answer_no());
			avo.setAnswer_count(answerCount);
		}*/
		
		jdata.add("arlist", jlist);
		jdata.addProperty("aReplyCount", aReplyCount);
		return String.valueOf(gson.toJson(jdata));
	}
	
	/**
	 * 답변 댓글 insert 하기
	 * @param wonder_answer_reply_writer
	 * @param wonder_answer_reply_content
	 * @param wonder_answer_no
	 * @return
	 */
	@RequestMapping(value = "/answer_reply_proc.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String answer_reply_proc(WonderAnswerReplyVO vo) {
		/*WonderAnswerReplyVO vo = new WonderAnswerReplyVO();
		vo.setWonder_answer_reply_content(wonder_answer_reply_content);
		vo.setWonder_answer_reply_writer(wonder_answer_reply_writer);
		vo.setWonder_answer_no(Integer.valueOf(wonder_answer_no));
		*/
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		/*System.out.println("wonder_answer_reply_writer = "+wonder_answer_reply_writer );
		System.out.println("wonder_answer_reply_content = "+wonder_answer_reply_content );
		System.out.println("wonder_answer_no = "+wonder_answer_no );*/
		System.out.println("wonder_answer_reply_writer = "+vo.getWonder_answer_reply_writer());
		System.out.println("wonder_answer_reply_content = "+vo.getWonder_answer_reply_content());
		System.out.println("wonder_answer_no = "+vo.getWonder_answer_no() );
		
		int int_result = communityDao.AnswerReplyInsert(vo);
		if(int_result != 0) {
			
			ArrayList<WonderAnswerReplyVO> arlist = communityDao.AnswerReplyList(String.valueOf(vo.getWonder_answer_no()));
			int aReplyCount = communityDao.AnswerReplyCount(String.valueOf(vo.getWonder_answer_no()));
			
			System.out.println("aReplyCount ="+aReplyCount);
			
			for(WonderAnswerReplyVO arvo :arlist) {
				JsonObject obj = new JsonObject();
				obj.addProperty("wonder_answer_reply_content",arvo.getWonder_answer_reply_content());
				obj.addProperty("wonder_answer_reply_date",arvo.getWonder_answer_reply_date() );
				obj.addProperty("wonder_answer_reply_writer",arvo.getWonder_answer_reply_writer() );
				obj.addProperty("wonder_answer_no",arvo.getWonder_answer_no() );
				obj.addProperty("wonder_answer_reply_no",arvo.getWonder_answer_reply_no() );
				
				jlist.add(obj);
			}
			jdata.add("arlist2", jlist);
			jdata.addProperty("aReplyCount", aReplyCount);
		}
		return String.valueOf(gson.toJson(jdata));
	}
	/**
	 * 질문 댓글 삭제 처리
	 * @param wonder_reply_no
	 * @param wonder_no
	 * @return
	 */
	@RequestMapping(value = "/wonder_reply_delete_proc.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String wonder_reply_delete_proc(String wonder_reply_no, String wonder_no) {
		
		communityDao.WonderReplyDelete(wonder_reply_no);
		int wReplyCount = communityDao.WonderReplyCount(wonder_no);
		ArrayList<WonderReplyVO> wrlist = communityDao.WonderReplyList(wonder_no);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		for(WonderReplyVO vo :wrlist) {
			JsonObject obj = new JsonObject();
			obj.addProperty("wonder_reply_content",vo.getWonder_reply_content());
			obj.addProperty("wonder_reply_date",vo.getWonder_reply_date() );
			obj.addProperty("wonder_reply_writer",vo.getWonder_reply_writer() );
			obj.addProperty("wonder_no",vo.getWonder_no() );
			obj.addProperty("wonder_reply_no",vo.getWonder_reply_no() );
			
			jlist.add(obj);
		}
		jdata.add("wrlist", jlist);
		jdata.addProperty("wReplyCount", wReplyCount);
		
		return String.valueOf(gson.toJson(jdata));
		
	}
	/**
	 * 답변 댓글 삭제 처리
	 * @param wonder_answer_reply_no
	 * @param wonder_answer_no
	 * @return
	 */
	@RequestMapping(value = "/answer_reply_delete_proc.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String answer_reply_delete_proc(String wonder_answer_reply_no, String wonder_answer_no) {
		
		communityDao.AnswerReplyDelete(wonder_answer_reply_no);
		int aReplyCount = communityDao.AnswerReplyCount(wonder_answer_no);
		ArrayList<WonderAnswerReplyVO> arlist = communityDao.AnswerReplyList(wonder_answer_no);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		for(WonderAnswerReplyVO vo :arlist) {
			JsonObject obj = new JsonObject();
			obj.addProperty("wonder_answer_reply_content",vo.getWonder_answer_reply_content());
			obj.addProperty("wonder_answer_reply_date",vo.getWonder_answer_reply_date() );
			obj.addProperty("wonder_answer_reply_writer",vo.getWonder_answer_reply_writer() );
			obj.addProperty("wonder_answer_no",vo.getWonder_answer_no() );
			obj.addProperty("wonder_answer_reply_no",vo.getWonder_answer_reply_no() );
			
			jlist.add(obj);
		}
		jdata.add("arlist", jlist);
		jdata.addProperty("aReplyCount", aReplyCount);
		return String.valueOf(gson.toJson(jdata));
		
	}
	/**
	 * 질문 삭제 처리
	 * @param wonder_no
	 * @return
	 */
	@RequestMapping(value="/wonder_delete_proc.do", method= RequestMethod.GET)
	public ModelAndView wonder_delete_proc(String wonder_no) {
		ModelAndView mv = new ModelAndView();
		
		int int_result = communityDao.WonderDelete(wonder_no);
		
		if(int_result != 0) {
			
			mv.setViewName("redirect:/wonder.do");
		}else {
			mv.setViewName("/errorPage.user");
		}
		
		return mv;
	}
	/**
	 * 질문 답변 삭제 처리
	 * @param wonder_no
	 * @param wonder_answer_no
	 * @return
	 */
	@RequestMapping(value="/wonder_answer_delete_proc.do", method= RequestMethod.GET)
	public ModelAndView wonder_answer_delete_proc(String wonder_no, String wonder_answer_no) {
		ModelAndView mv = new ModelAndView();
		System.out.println("12wonder_no = "+wonder_no);
		int int_result = communityDao.WonderAnswerDelete(wonder_answer_no);
		
		if(int_result != 0) {
			mv.setViewName("redirect:/wonderDetail.do?wonder_no="+wonder_no);
		}else {
			mv.setViewName("/errorPage.user");
		}
		
		return mv;
	}
	
	/**
	 * 질문 답변 수정
	 * @return
	 */
	@RequestMapping(value = "/answerUpdate.do", method = RequestMethod.GET)
	public ModelAndView answerUpdate(String wonder_no, String wonder_answer_no) {
		ModelAndView mv = new ModelAndView();
		AnswerVO avo = communityDao.AnswerContent(wonder_no, wonder_answer_no);
		
		mv.addObject("result","0");
		mv.addObject("wonder_no",wonder_no);
		mv.addObject("wonder_answer_no",wonder_answer_no);
		mv.addObject("avo", avo);
		mv.setViewName("/community1/answerUpdate.none");
		return mv;
	}
	/**
	 * 질문 답변 수정 처리
	 * @param wonder_no
	 * @param wonder_answer_title
	 * @param wonder_answer_content
	 * @param wonder_answer_no
	 * @return
	 */
	@RequestMapping(value = "/answerUpdate_proc.do", method = RequestMethod.POST)
	public ModelAndView answerUpdate_proc(String wonder_no, String wonder_answer_title, String wonder_answer_content, String wonder_answer_no) {
		ModelAndView mv = new ModelAndView();
		int int_result = communityDao.AnswerUpdate(wonder_answer_title, wonder_answer_content, wonder_answer_no);
		if(int_result != 0) {
			mv.setViewName("/community1/answerUpdate.none");
			mv.addObject("result",String.valueOf(int_result));
		}else {
			mv.setViewName("/errorPage.user");
		}
		
		return mv;
	}
	
	/**
	 * 질문 수정
	 * @return
	 */
	@RequestMapping(value = "/wonderUpdate.do", method = RequestMethod.GET)
	public ModelAndView wonderUpdate(String wonder_no) {
		ModelAndView mv = new ModelAndView();
		WonderVO wvo = communityDao.WonderContent(wonder_no);
		
		mv.addObject("result","0");
		mv.addObject("wonder_no",wonder_no);
		mv.addObject("wvo", wvo);
		mv.setViewName("/community1/wonderUpdate.none");
		return mv;
	}
	/**
	 * 질문 답변 수정 처리
	 * @param wonder_no
	 * @param wonder_answer_title
	 * @param wonder_answer_content
	 * @param wonder_answer_no
	 * @return
	 */
	@RequestMapping(value = "/wonderUpdate_proc.do", method = RequestMethod.POST)
	public ModelAndView wonderUpdate_proc(String wonder_no, String wonder_title, String wonder_content) {
		ModelAndView mv = new ModelAndView();
		int int_result = communityDao.WonderUpdate(wonder_title ,wonder_content ,wonder_no);
		if(int_result != 0) {
			mv.setViewName("/community1/answerUpdate.none");
			mv.addObject("result",String.valueOf(int_result));
		}else {
			mv.setViewName("/errorPage.user");
		}
		
		return mv;
	}
	
}
