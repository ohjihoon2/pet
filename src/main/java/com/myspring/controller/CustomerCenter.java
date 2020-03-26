package com.myspring.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pettoday.dao.NoticeDAO;
import com.pettoday.vo.NoticeVO;

@Controller
public class CustomerCenter {
	
	@Autowired
	private NoticeDAO noticeDao;
	
	
	@RequestMapping(value = "/cc.do", method = RequestMethod.GET)
	public String cc() {
		return "/CustomerCenter/cc.user";
	}
	
	
	/**
	 * 공지사항 컨트롤러
	 */
	@RequestMapping(value = "/notice.do", method = RequestMethod.GET)
	public ModelAndView notice(String rpage) {
		ModelAndView mv = new ModelAndView();

		// 페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5; // 한페이지당 게시물 수
		int reqPage = 0; // 요청페이지
		int pageCount = 1; // 전체 페이지 수
		int dbCount = noticeDao.execTotalCount(); // DB에서 가져온 전체 행수
		
		// 총 페이지 수 계산
		if (dbCount % pageSize == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = dbCount / pageSize + 1;
		}

		// 요청 페이지 계산
		if (rpage != null) {
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		} else { // 가장 처음 페이지 즉, 1번페이지가 나온다.
			reqPage = 1; 
			startCount = 1;
			endCount = 5;
		}

		ArrayList<NoticeVO> list = noticeDao.getResultList(startCount, endCount);
		
	

		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("rpage", reqPage);
		mv.addObject("pageSize", pageSize);
	
		mv.setViewName("/CustomerCenter/notice.user");

		return mv;
	}
	/**
	 * 공지사항 검색 컨트롤러
	 */
	@RequestMapping(value = "/notice_search.do", method = RequestMethod.GET)
	public ModelAndView notice_search(String rpage,String search) {
		ModelAndView mv = new ModelAndView();

		// 페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5; // 한페이지당 게시물 수
		int reqPage = 0; // 요청페이지
		int pageCount = 1; // 전체 페이지 수
		int dbCount = noticeDao.execSearchCount(search); // DB에서 가져온 전체 행수
		
		// 총 페이지 수 계산
		if (dbCount % pageSize == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = dbCount / pageSize + 1;
		}

		// 요청 페이지 계산
		if (rpage != null) {
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		} else { // 가장 처음 페이지 즉, 1번페이지가 나온다.
			reqPage = 1; 
			startCount = 1;
			endCount = 5;
		}

		ArrayList<NoticeVO> list = noticeDao.getResultList(startCount, endCount,search);
		
	
		mv.addObject("search",search);
		mv.addObject("list", list);
		mv.addObject("dbCount", dbCount);
		mv.addObject("rpage", reqPage);
		mv.addObject("pageSize", pageSize);
		mv.setViewName("/CustomerCenter/notice.user");

		return mv;
	}
	
	
	/**
	 * 공지사항 내용
	 */
	@RequestMapping(value = "/notice_content.do", method = RequestMethod.GET)
	public ModelAndView notice_content(String not_no) {
		ModelAndView mv = new ModelAndView();
		
		
		NoticeVO vo = noticeDao.getResultContent(not_no);
		
		if(vo.getNot_title() != null && vo.getNot_title() != ""){
			noticeDao.getResultUpdateHits(not_no);
			vo.setNot_content(vo.getNot_content().replace("\r\n", "<br>"));
			mv.addObject("vo",vo);
			mv.setViewName("/CustomerCenter/notice_content.user");
		}else{
			mv.setViewName("errorPage");
		}
		return mv;
		
	}
	
	/**
	 * 공지사항 작성
	 */
	@RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
	public String notice_write() {
		return "/CustomerCenter/notice_write.user";
	}
	

}
