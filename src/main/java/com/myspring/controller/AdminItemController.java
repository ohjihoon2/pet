package com.myspring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pettoday.dao.ItemDAO;
import com.pettoday.vo.ItemBoardVO;
import com.pettoday.vo.ItemVO;

@Controller
public class AdminItemController {
	
	@Autowired
	private ItemDAO itemDao;
	
	
	/**
	 * ������ ����̸���Ʈ ����������
	 */
	@RequestMapping(value="/admin_cat_delete_proccess.do", method=RequestMethod.GET)
	public ModelAndView admin_cat_delete_proccess(String item_no, HttpServletRequest requset) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = itemDao.getResultDogDelete(item_no,requset);
		
		if(result) {
			mv.setViewName("redirect:/admin_cat_item.do");
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
	
	
	/**
	 * ������ ����̸���Ʈ ����������
	 */
	@RequestMapping(value="/admin_cat_delete.do", method=RequestMethod.GET)
	public ModelAndView admin_cat_delete(String item_no) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("item_no",item_no);
		mv.setViewName("/admin/admin_cat_delete.none");
		
		return mv;
	}
	
	
	/**
	 * ������ ����̸���Ʈ ���� �Ϸ�
	 */
	@RequestMapping(value="/admin_cat_update_proccess.do", method=RequestMethod.POST)
	public ModelAndView admin_cat_update_proccess(ItemVO vo, HttpServletRequest request, String del_simgfile, String del_item_sdescriptionfile) 
			throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		
		String root_path="";
		String attach_path="";
		String item_simg="";
		String item_sdescription="";
		
		if((vo.getItem_cimg().getOriginalFilename() != null && vo.getItem_cimg().getOriginalFilename() != "")
			||(vo.getItem_cdescription().getOriginalFilename() != null && vo.getItem_cdescription().getOriginalFilename() != "")) {
			System.out.println("��������");
			//item_img,item_simg ����
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path ="\\resources\\upload\\";
			
			//�ߺ����� ó��
			UUID uuid = UUID.randomUUID();
			String item_img = vo.getItem_cimg().getOriginalFilename();
			item_simg = uuid+"_"+vo.getItem_cimg().getOriginalFilename();
			String item_description = vo.getItem_cdescription().getOriginalFilename();
			item_sdescription = uuid+"_"+vo.getItem_cdescription().getOriginalFilename();
			
			System.out.println("item_img="+item_img);
			System.out.println("item_simg="+item_simg);
			System.out.println("item_description="+item_description);
			System.out.println("item_sdescription="+item_sdescription);
			
			//db������ ���� ���ϸ� set
			vo.setItem_img(item_img);
			vo.setItem_simg(item_simg);
			
			vo.setItem_description(item_description);
			vo.setItem_sdescription(item_sdescription);
			
			result = itemDao.gerResultAdminDogUpdate(vo);
			
			if(result) {
				String upload_path = root_path + attach_path + item_simg;
				String upload_path2 = root_path + attach_path + item_sdescription;
				
				File file = new File(upload_path);	// ���ϰ��/���ϸ�
				vo.getItem_cimg().transferTo(file);
				
				File file2 = new File(upload_path2);	// ���ϰ��/���ϸ�
				vo.getItem_cdescription().transferTo(file2);
				
				if(del_simgfile != null && del_simgfile != "") {
					String del_path = root_path + attach_path + del_simgfile;
					File delFile = new File(del_path);
					if(delFile.exists()) {
						delFile.delete();
					}
				}else if(del_item_sdescriptionfile != null && del_item_sdescriptionfile != "") {
					String del_path = root_path + attach_path + del_item_sdescriptionfile;
					File delFile = new File(del_path);
					if(delFile.exists()) {
						delFile.delete();
					}
				}
				
				
			}
			
		}else {
			System.out.println("���Ͼ���");
			result = itemDao.gerResultAdminDogUpdateNofile(vo);
			vo.setItem_img("");
			vo.setItem_simg("");
			vo.setItem_description("");
			vo.setItem_sdescription("");
		}
		if(result) {
			mv.setViewName("redirect:/admin_cat_item.do");
		}
		
		return mv;
	}
	
	/**
	 * ������ ����̸���Ʈ ����������
	 */
	@RequestMapping(value="/admin_cat_update.do", method=RequestMethod.GET)
	public ModelAndView admin_cat_update(String item_no) {
		ModelAndView mv = new ModelAndView();

		//BoardCheckService board = new BoardCheckService();
		ItemVO vo = itemDao.getResultAdminDogContent(item_no);
		
		mv.addObject("vo",vo);
		mv.setViewName("/admin/admin_cat_update.none");
		
		return mv;
	}
	
	/**
	 * ������ ����̸���Ʈ ��������
	 */
	@RequestMapping(value = "/admin_cat_content.do", method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public ModelAndView admin_cat_content(String item_no, String rpage) {
		ModelAndView mv = new ModelAndView();
		
		ItemVO vo = itemDao.getResultAdminDogContent(item_no);
		
		if(vo.getItem_cate_brand1() != null && vo.getItem_cate_brand1() != "") {
			mv.addObject("vo",vo);
			mv.addObject("rpage",rpage);
			mv.setViewName("/admin/admin_cat_content.none");
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
	
	/**
	 * ������ ����� ��ǰ�Ϸ�
	 */
	@RequestMapping(value = "/admin_cat_good_insert_proccess.do", method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public String admin_cat_good_insert_proccess(ItemVO vo, HttpServletRequest request) throws Exception {
		
		String root_path="";
		String attach_path="";
		String item_simg="";
		String item_sdescription="";
		
		if((vo.getItem_cimg().getOriginalFilename() != null && vo.getItem_cimg().getOriginalFilename() != "")
			||(vo.getItem_cdescription().getOriginalFilename() != null && vo.getItem_cdescription().getOriginalFilename() != "")) {
			//item_img,item_simg ����
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path ="\\resources\\upload\\";
			
			//�ߺ����� ó��
			UUID uuid = UUID.randomUUID();
			String item_img = vo.getItem_cimg().getOriginalFilename();
			item_simg = uuid+"_"+vo.getItem_cimg().getOriginalFilename();
			String item_description = vo.getItem_cdescription().getOriginalFilename();
			item_sdescription = uuid+"_"+vo.getItem_cdescription().getOriginalFilename();
			
			System.out.println("item_img="+item_img);
			System.out.println("item_simg="+item_simg);
			System.out.println("item_description="+item_description);
			System.out.println("item_sdescription="+item_sdescription);
			
			//db������ ���� ���ϸ� set
			vo.setItem_img(item_img);
			vo.setItem_simg(item_simg);
			
			vo.setItem_description(item_description);
			vo.setItem_sdescription(item_sdescription);
			
		}else {
			vo.setItem_img("");
			vo.setItem_simg("");
			vo.setItem_description("");
			vo.setItem_sdescription("");
		}
		
		boolean result = itemDao.getResultInsGood(vo);
		String resPage="";
		
		if(result) {
			if((vo.getItem_cimg().getOriginalFilename() != null && vo.getItem_cimg().getOriginalFilename() != "")
					||(vo.getItem_cdescription().getOriginalFilename() != null && vo.getItem_cdescription().getOriginalFilename() != "")) {
				//upload ������ ����
				String upload_path = root_path + attach_path + item_simg;
				String upload_path2 = root_path + attach_path + item_sdescription;
				
				File file = new File(upload_path);	// ���ϰ��/���ϸ�
				vo.getItem_cimg().transferTo(file);
				
				File file2 = new File(upload_path2);	// ���ϰ��/���ϸ�
				vo.getItem_cdescription().transferTo(file2);
			}
			resPage = "redirect:/admin_cat_item.do";
		}else {
			resPage = "errorPage";
		}
		
		return resPage;
	}
	
	
	/**
	 * ������ ����� ��ǰ���
	 */
	@RequestMapping(value = "/admin_cat_good_insert.do", method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public String admin_cat_good_insert() {
		return "/admin/admin_cat_good_insert.none";
	}
	
	/**
	 * ������ ����� ����Ʈ
	 */
	@RequestMapping(value = "/admin_cat_item.do", method = RequestMethod.GET)
	public ModelAndView admin_cat_item(String rpage) {
		ModelAndView mv = new ModelAndView();
		//����¡ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 7;	//���������� �Խù� ��
		int reqPage = 0;	//��û������	, rpage�� ��ü
		int pageCount = 1;	//��ü ������ ��
		int dbCount = itemDao.execTotalCatCount();	//DB���� ������ ��ü ��� 
		
		//�� ������ �� ���
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//��û ������ ���
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
	 		endCount = reqPage *pageSize;
		}else{
			reqPage = 1;
			startCount = 1;
			endCount = 7;
		}
		//System.out.println(startCount+","+ endCount+","+item_cate);			
		ArrayList<ItemVO> list = itemDao.getResultAdminCatList(startCount, endCount);

		mv.addObject("list",list);
		mv.addObject("dbcount", dbCount);
		mv.addObject("rpage", reqPage);
		mv.addObject("pagesize", pageSize);
		mv.setViewName("/admin/admin_cat_item.none");
		
		return mv;
	}
	
	
	/**
	 * ������ ����������Ʈ ����������
	 */
	@RequestMapping(value="/admin_dog_delete_proccess.do", method=RequestMethod.GET)
	public ModelAndView admin_dog_delete_proccess(String item_no, HttpServletRequest requset) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = itemDao.getResultDogDelete(item_no,requset);
		
		if(result) {
			mv.setViewName("redirect:/admin_dog_item.do");
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
	
	
	/**
	 * ������ ����������Ʈ ����������
	 */
	@RequestMapping(value="/admin_dog_delete.do", method=RequestMethod.GET)
	public ModelAndView admin_dog_delete(String item_no) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("item_no",item_no);
		mv.setViewName("/admin/admin_dog_delete.none");
		
		return mv;
	}
	
	
	/**
	 * ������ ����������Ʈ ���� �Ϸ�
	 */
	@RequestMapping(value="/admin_dog_update_proccess.do", method=RequestMethod.POST)
	public ModelAndView admin_dog_update_proccess(ItemVO vo, HttpServletRequest request, String del_simgfile, String del_item_sdescriptionfile) 
	throws Exception{
		ModelAndView mv = new ModelAndView();
		boolean result = false;
		
		String root_path="";
		String attach_path="";
		String item_simg="";
		String item_sdescription="";
		
		if((vo.getItem_cimg().getOriginalFilename() != null && vo.getItem_cimg().getOriginalFilename() != "")
			||(vo.getItem_cdescription().getOriginalFilename() != null && vo.getItem_cdescription().getOriginalFilename() != "")) {
			System.out.println("��������");
			//item_img,item_simg ����
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path ="\\resources\\upload\\";
			
			//�ߺ����� ó��
			UUID uuid = UUID.randomUUID();
			String item_img = vo.getItem_cimg().getOriginalFilename();
			item_simg = uuid+"_"+vo.getItem_cimg().getOriginalFilename();
			String item_description = vo.getItem_cdescription().getOriginalFilename();
			item_sdescription = uuid+"_"+vo.getItem_cdescription().getOriginalFilename();
			
			System.out.println("item_img="+item_img);
			System.out.println("item_simg="+item_simg);
			System.out.println("item_description="+item_description);
			System.out.println("item_sdescription="+item_sdescription);
			
			//db������ ���� ���ϸ� set
			vo.setItem_img(item_img);
			vo.setItem_simg(item_simg);
			
			vo.setItem_description(item_description);
			vo.setItem_sdescription(item_sdescription);
			
			result = itemDao.gerResultAdminDogUpdate(vo);
			
			if(result) {
				String upload_path = root_path + attach_path + item_simg;
				String upload_path2 = root_path + attach_path + item_sdescription;
				
				File file = new File(upload_path);	// ���ϰ��/���ϸ�
				vo.getItem_cimg().transferTo(file);
				
				File file2 = new File(upload_path2);	// ���ϰ��/���ϸ�
				vo.getItem_cdescription().transferTo(file2);
				
				if(del_simgfile != null && del_simgfile != "") {
					String del_path = root_path + attach_path + del_simgfile;
					File delFile = new File(del_path);
					if(delFile.exists()) {
						delFile.delete();
					}
				}else if(del_item_sdescriptionfile != null && del_item_sdescriptionfile != "") {
					String del_path = root_path + attach_path + del_item_sdescriptionfile;
					File delFile = new File(del_path);
					if(delFile.exists()) {
						delFile.delete();
					}
				}
				
				
			}
			
		}else {
			System.out.println("���Ͼ���");
			result = itemDao.gerResultAdminDogUpdateNofile(vo);
			vo.setItem_img("");
			vo.setItem_simg("");
			vo.setItem_description("");
			vo.setItem_sdescription("");
		}
		if(result) {
			mv.setViewName("redirect:/admin_dog_item.do");
		}
		
		return mv;
	}
	
	/**
	 * ������ ����������Ʈ ����������
	 */
	@RequestMapping(value="/admin_dog_update.do", method=RequestMethod.GET)
	public ModelAndView admin_dog_update(String item_no) {
		ModelAndView mv = new ModelAndView();

		//BoardCheckService board = new BoardCheckService();
		ItemVO vo = itemDao.getResultAdminDogContent(item_no);
		
		mv.addObject("vo",vo);
		mv.setViewName("/admin/admin_dog_update.none");
		
		return mv;
	}
	
	/**
	 * ������ ����������Ʈ ��������
	 */
	@RequestMapping(value = "/admin_dog_content.do", method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public ModelAndView admin_dog_content(String item_no, String rpage) {
		ModelAndView mv = new ModelAndView();
		
		ItemVO vo = itemDao.getResultAdminDogContent(item_no);
		
		if(vo.getItem_cate_brand1() != null && vo.getItem_cate_brand1() != "") {
			mv.addObject("vo",vo);
			mv.addObject("rpage",rpage);
			mv.setViewName("/admin/admin_dog_content.none");
		}else {
			mv.setViewName("errorPage");
		}
		
		return mv;
	}
	
	/**
	 * ������ ������ ��ǰ�Ϸ�
	 */
	@RequestMapping(value = "/admin_dog_good_insert_proccess.do", method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public String admin_dog_good_insert_proccess(ItemVO vo, HttpServletRequest request) throws Exception {
		
		String root_path="";
		String attach_path="";
		String item_simg="";
		String item_sdescription="";
		
		if((vo.getItem_cimg().getOriginalFilename() != null && vo.getItem_cimg().getOriginalFilename() != "")
			||(vo.getItem_cdescription().getOriginalFilename() != null && vo.getItem_cdescription().getOriginalFilename() != "")) {
			//item_img,item_simg ����
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path ="\\resources\\upload\\";
			
			//�ߺ����� ó��
			UUID uuid = UUID.randomUUID();
			String item_img = vo.getItem_cimg().getOriginalFilename();
			item_simg = uuid+"_"+vo.getItem_cimg().getOriginalFilename();
			String item_description = vo.getItem_cdescription().getOriginalFilename();
			item_sdescription = uuid+"_"+vo.getItem_cdescription().getOriginalFilename();
			
			System.out.println("item_img="+item_img);
			System.out.println("item_simg="+item_simg);
			System.out.println("item_description="+item_description);
			System.out.println("item_sdescription="+item_sdescription);
			
			//db������ ���� ���ϸ� set
			vo.setItem_img(item_img);
			vo.setItem_simg(item_simg);
			
			vo.setItem_description(item_description);
			vo.setItem_sdescription(item_sdescription);
			
		}else {
			vo.setItem_img("");
			vo.setItem_simg("");
			vo.setItem_description("");
			vo.setItem_sdescription("");
		}
		
		boolean result = itemDao.getResultInsGood(vo);
		String resPage="";
		
		if(result) {
			if((vo.getItem_cimg().getOriginalFilename() != null && vo.getItem_cimg().getOriginalFilename() != "")
					||(vo.getItem_cdescription().getOriginalFilename() != null && vo.getItem_cdescription().getOriginalFilename() != "")) {
				//upload ������ ����
				String upload_path = root_path + attach_path + item_simg;
				String upload_path2 = root_path + attach_path + item_sdescription;
				
				File file = new File(upload_path);	// ���ϰ��/���ϸ�
				vo.getItem_cimg().transferTo(file);
				
				File file2 = new File(upload_path2);	// ���ϰ��/���ϸ�
				vo.getItem_cdescription().transferTo(file2);
			}
			resPage = "redirect:/admin_dog_item.do";
		}else {
			resPage = "errorPage";
		}
		
		return resPage;
	}
	
	
	/**
	 * ������ ������ ��ǰ���
	 */
	@RequestMapping(value = "/admin_dog_good_insert.do", method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public String admin_dog_good_insert() {
		return "/admin/admin_dog_good_insert.none";
	}
	
	/**
	 * ������ ������ ����Ʈ
	 */
	@RequestMapping(value = "/admin_dog_item.do", method = RequestMethod.GET)
	public ModelAndView admin_dog_item(String rpage) {
		ModelAndView mv = new ModelAndView();
		//����¡ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 7;	//���������� �Խù� ��
		int reqPage = 0;	//��û������	, rpage�� ��ü
		int pageCount = 1;	//��ü ������ ��
		int dbCount = itemDao.execTotalDogCount();	//DB���� ������ ��ü ��� 
		
		//�� ������ �� ���
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//��û ������ ���
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
	 		endCount = reqPage *pageSize;
		}else{
			reqPage = 1;
			startCount = 1;
			endCount = 7;
		}
		//System.out.println(startCount+","+ endCount+","+item_cate);			
		ArrayList<ItemVO> list = itemDao.getResultAdminDogList(startCount, endCount);

		mv.addObject("list",list);
		mv.addObject("dbcount", dbCount);
		mv.addObject("rpage", reqPage);
		mv.addObject("pagesize", pageSize);
		mv.setViewName("/admin/admin_dog_item.none");
		
		return mv;
	}
	

}
