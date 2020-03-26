package com.myspring.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pettoday.dao.memberDAO;
import com.pettoday.vo.JoinVO;

@Controller
public class AdminMemberController {
	@Autowired
	private memberDAO memberDao;


	@RequestMapping(value = "/admin_member.do", method = RequestMethod.GET)
	public ModelAndView admin_member() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<JoinVO> list = memberDao.getAdminMemList();
		
		mv.addObject("list", list);
		mv.setViewName("/admin/admin_member.none");
		return mv;
	}
	
	@RequestMapping(value = "/admin_member_delete_proc.do", method = RequestMethod.GET)
	public String admin_member_delete_proc(String mem_id) {
		
		boolean result = memberDao.getDeleteMember(mem_id);
		String resPage = "";
		
		if(result) {
			resPage = "redirect:/admin_member.do";
		}else {
			resPage = "errorPage";	
		}

		return resPage;
	}

}