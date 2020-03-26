package com.myspring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pettoday.dao.WalktogetherDAO;
import com.pettoday.vo.WalktogetherVO;

@Controller
public class AdminFriendController {
	
	@Autowired
	private WalktogetherDAO walkDao;
	
	
	@RequestMapping(value = "/admin_friend.do", method = RequestMethod.GET)
	public ModelAndView admin_friend(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		// 페이징 처리 - startCount, endCount 구하기
				int startCount = 0;
				int endCount = 0;
				int pageSize = 4; // 한페이지당 게시물 수
				int reqPage = 1; // 요청페이지
				int pageCount = 1; // 전체 페이지 수
				int dbCount = walkDao.execTotalCount(); // DB에서 가져온 전체 행수

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
					startCount = 1;
					endCount = 4;
				}
				
				ArrayList<WalktogetherVO> list = walkDao.getResultList(startCount, endCount);
				
				mv.addObject("list", list);
				mv.addObject("dbCount", dbCount);
				mv.addObject("rpage", rpage);
				mv.addObject("pageSize", pageSize);
				mv.setViewName("/admin/admin_friend.none");

				return mv;
	}
	
	@RequestMapping(value = "/admin_friend_delete_proc.do", method = RequestMethod.GET)
	public ModelAndView admin_friend_delete_proc(String wal_no, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = walkDao.getResultDelete(wal_no, request);
		
		if(result) {
			mv.setViewName("redirect:/admin_friend.do");
		}else {
			mv.setViewName("errorPage");	
		}

		return mv;
	}
}
