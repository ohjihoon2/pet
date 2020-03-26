package com.myspring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pettoday.dao.ItemDAO;
import com.pettoday.dao.PhotocontestDAO;
import com.pettoday.dao.VetDAO;
import com.pettoday.dao.memberDAO;
import com.pettoday.vo.ItemVO;
import com.pettoday.vo.LoginVO;
import com.pettoday.vo.PhotocontestVO;
import com.pettoday.vo.SessionVO;
import com.pettoday.vo.VetVO;

@Controller
public class MainController {
	
	@Autowired
	private ItemDAO itemDao;
	
	@Autowired
	private PhotocontestDAO photoDao;
	
	@Autowired
	private VetDAO vetDao;
	@Autowired
	private memberDAO memberDao;
	
	
	/**
	 * 메인 컨트롤러
	 */
	@RequestMapping(value = "/index.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView index(String sid) {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<ItemVO> list =itemDao.getGoodList();
		ArrayList<ItemVO> list2 =itemDao.getNearList(sid);
		ArrayList<PhotocontestVO> list3 =photoDao.getResultList3();
		ArrayList<VetVO> list4 = vetDao.getResultListMain();
		
		mv.addObject("list",list);
		mv.addObject("list2",list2);
		mv.addObject("list3",list3);
		mv.addObject("list4",list4);
		
		mv.setViewName("index.user");
		return mv;
	}
	
	
	/**
	 * 예제 컨트롤러
	 */
	@RequestMapping(value = "/ex.do", method = RequestMethod.GET)
	public String ex() {
		return "ex";
	}
	
	
	
	
}
