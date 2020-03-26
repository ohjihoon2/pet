package com.myspring.controller;

import java.text.DecimalFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pettoday.dao.CusDAO;
import com.pettoday.dao.memberDAO;
import com.pettoday.vo.PurchasesVO;
import com.pettoday.vo.SessionVO;



@Controller
public class CustomController {
	
	@Autowired
	private CusDAO cusDao;

	/**
	 * �� �ֹ� ���� ���� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/cus_main.do", method = RequestMethod.GET)
	public String cus_main() {
	
		return "/customizing/cus_main.user";
	}

	/**
	 * �� �ֹ� ���� ���� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/cus_main_proc.do", method = RequestMethod.GET)
	@ResponseBody
	public String cus_main_proc(String produce) {
		
		/*ModelAndView mv =new ModelAndView();

		int price = cusDao.cus_price(produce);
		mv.addObject("price",price);
		//mv.setViewName("/customizing/cus_main");
		return mv;*/
		String price = cusDao.cus_price(produce);
		
		return price;
	}
	/**
	 * �Һ��� �ֹ� ���� ���� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/cus_main_tum.do", method = RequestMethod.GET)
	public String cus_main_tum() {
	
		return "/customizing/cus_main_tum.user";
	}
	/**
	 * �� �� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/cus_dt.do", method = RequestMethod.GET)
	public ModelAndView cus_dt(String type,String color,String price) {
		ModelAndView mv =new ModelAndView();
		mv.addObject("type",type);
		mv.addObject("color",color);
		mv.addObject("price",price);
		
		mv.setViewName("/customizing/cus_dt.user");
		return mv;
	}
	/**
	 * �Һ��� �� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/cus_dt_tum.do", method = RequestMethod.GET)
	public ModelAndView cus_dt_tum(String type,String color,String price) {
		ModelAndView mv =new ModelAndView();
		mv.addObject("type",type);
		mv.addObject("color",color);
		mv.addObject("price",price);
		mv.setViewName("/customizing/cus_dt_tum.user");
		return mv;
	}
	
	/**
	 * �ֹ����� ���� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/cus_pay.do", method = RequestMethod.GET)
	public ModelAndView cus_pay(String type,String color,String price,String size) {
		ModelAndView mv =new ModelAndView();
		
		String price1=price;
		String[] price2=price1.split("��");
	
		mv.addObject("type",type);
		mv.addObject("color",color);
		mv.addObject("price",price);
		mv.addObject("price2",price2[0]);
		mv.addObject("size",size);
	
	
		mv.setViewName("/customizing/cus_pay.user");
		return mv;
	}
	/**
	 * ���������� �� ���μ���
	 */
	@RequestMapping(value = "/cus_pay_proc.do", method = RequestMethod.GET)
	public ModelAndView cus_pay_proc(PurchasesVO vo) {
		ModelAndView mv =new ModelAndView();
		boolean result =cusDao.getResultWrite(vo);
		
		if(result) {
			
			mv.setViewName("redirect:/index.do");
		}else {
			
		}
	
		return mv;
	}


	/**
	 * īī������
	 */
	@RequestMapping(value = "/kakaoPay.do", method = RequestMethod.POST)
	public ModelAndView kakaoPay(String price,String pc_name,int pc_count) {
		ModelAndView mv =new ModelAndView();
		
		mv.addObject("price",price);
		mv.addObject("pc_name",pc_name);
		mv.addObject("pc_count",pc_count);
		mv.setViewName("/customizing/kakaoPay.none");
		
		return mv;
	}
	

}











