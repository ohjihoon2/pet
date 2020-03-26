package com.myspring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.pettoday.dao.PhotocontestDAO;
import com.pettoday.vo.PhotocontestVO;

@Controller
public class PhotoContestController {

	@Autowired
	private PhotocontestDAO photocontestDao;

	/**
	 * ������ȸ ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/photocontest.do", method = RequestMethod.GET)
	public ModelAndView photocontest(String rpage) {
		ModelAndView mv = new ModelAndView();

		// ����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int startCount2 = 1;
		int endCount2 = 3;
		int pageSize = 9; // ���������� �Խù� ��
		int reqPage = 1; // ��û������
		int pageCount = 1; // ��ü ������ ��
		int dbCount = photocontestDao.execTotalCount(); // DB���� ������ ��ü ���

		// �� ������ �� ���
		if (dbCount % pageSize == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = dbCount / pageSize + 1;
		}

		// ��û ������ ���
		if (rpage != null) {
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		} else { // ���� ó�� ������ ��, 1���������� ���´�.
			startCount = 1;
			endCount = 9;
		}

		ArrayList<PhotocontestVO> list = photocontestDao.getResultList(startCount, endCount);
		ArrayList<PhotocontestVO> list2 = photocontestDao.getResultList2(startCount2, endCount2);

		mv.addObject("list", list);
		mv.addObject("list2", list2);
		mv.addObject("dbCount", dbCount);
		mv.addObject("rpage", rpage);
		mv.addObject("pageSize", pageSize);
		mv.setViewName("/photocontest/photocontest.user");

		return mv;
	}

	/**
	 * ������ȸ �� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/photocontest_content.do", method = RequestMethod.GET)
	public ModelAndView photocontest_content(String pho_no, String page) {
		ModelAndView mv = new ModelAndView();
		
		PhotocontestVO vo = photocontestDao.getResultContent(pho_no);
		
		if (vo.getPho_title() != "" && vo.getPho_title() != null) {
			
			photocontestDao.getResultUpdatehits(pho_no);

			if (vo.getPho_explain() != "" && vo.getPho_explain() != null) {
				vo.setPho_explain(vo.getPho_explain().replace("\r\n", "<br>"));
				vo.setPho_uniqueness(vo.getPho_uniqueness().replace("\r\n", "<br>"));

				mv.addObject("vo", vo);
				mv.addObject("rpage", page);
				//mv.addObject("rlist", rlist);
				mv.setViewName("/photocontest/photocontest_content.user");
			} else {
				vo.setPho_explain("");
			}

		} else {
			mv.setViewName("errorPage");
		}

		return mv;
	}

	/**
	 * ������ȸ ��� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/photocontest_content_write.do", method = RequestMethod.GET)
	public String photocontest_content_write(String sid) {
		String regPage = "";
		if(sid != null && sid != "") {
			regPage= "/photocontest/photocontest_content_write.user";
		}else {
			regPage= "/member/login.user";
		}
		return regPage;
	}

	@RequestMapping(value = "/photocontest_content_write_proc.do", method = RequestMethod.POST)
	public String photocontest_content_write_proc(PhotocontestVO vo, HttpServletRequest request) throws Exception {
		String root_path = "", attach_path = "", pho_sfile = "";

		if (vo.getPho_cfile().getOriginalFilename() != null && vo.getPho_cfile().getOriginalFilename() != "") {
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path = "\\resources\\upload\\";

			UUID uuid = UUID.randomUUID();
			String pho_file = vo.getPho_cfile().getOriginalFilename();
			pho_sfile = uuid + "_" + vo.getPho_cfile().getOriginalFilename();

			vo.setPho_file(pho_file);
			vo.setPho_sfile(pho_sfile);
		}else {
			vo.setPho_sfile("");
			vo.setPho_file("");
		}
		
		boolean result = photocontestDao.getResultWrite(vo);
		String resPage = "";
		
		if(result) {
			if(vo.getPho_cfile().getOriginalFilename() != null && vo.getPho_cfile().getOriginalFilename() != "") {
				String upload_path = root_path+attach_path+pho_sfile;
				
				File file = new File(upload_path);
				vo.getPho_cfile().transferTo(file);
			}
			
			resPage = "redirect:/photocontest.do";
		}else {
			resPage = "errorPage";
		}

		return resPage;
	}
	
	/**
	 * ������ȸ ����
	 */
	@RequestMapping(value = "/photocontest_update.do", method = RequestMethod.GET)
	public ModelAndView photocontest_update(String pho_no) {
		ModelAndView mv = new ModelAndView();

		//BoardCheckService board = new BoardCheckService();
		PhotocontestVO vo = photocontestDao.getResultContent(pho_no);

		mv.addObject("vo", vo);
		mv.setViewName("/photocontest/photocontest_update.user");

		return mv;
	}
	
	/**
	 * ������ȸ ���� �Ϸ� ó��
	 */
	@RequestMapping(value = "/photocontest_update_proc.do", method = RequestMethod.POST)
	public ModelAndView photocontest_update_proc(PhotocontestVO vo, HttpServletRequest request, String del_pho_sfile) throws Exception {
		ModelAndView mv = new ModelAndView();

		boolean result = false;

		if (vo.getPho_cfile().getOriginalFilename() != null && vo.getPho_cfile().getOriginalFilename() != "") {

			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "\\resources\\upload\\";

			// �ߺ����� ó��
			UUID uuid = UUID.randomUUID();
			String pho_file = vo.getPho_cfile().getOriginalFilename();
			String pho_sfile = uuid + "_" + vo.getPho_cfile().getOriginalFilename();


			// db������ ���� ���ϸ� set
			vo.setPho_file(pho_file);
			vo.setPho_sfile(pho_sfile);
			result = photocontestDao.getResultUpdate(vo); // ��ü������ ������Ʈ

			if (result) {
				// ���ε������� ���� ����
				String upload_path = root_path + attach_path + pho_sfile;

				File file = new File(upload_path);
				vo.getPho_cfile().transferTo(file);

				// ���� ���� ����
				if (del_pho_sfile != null && del_pho_sfile != "") {
					String del_path = root_path + attach_path + del_pho_sfile;
					File delFile = new File(del_path);
					if (delFile.exists())
						delFile.delete();
				}
			}
		}

		if (result) {
			mv.setViewName("redirect:/photocontest.do"); // if(result) mv.setViewName("/board/board_list"); ------------->
		} // �̷��� ���� �ϴµ� null����Ʈ�� ��� board.do�κ�
			// ��Ʈ�ѷ����� ���� arraylist�������� ������ �ȵǼ�
			// �׷��� �׷��� �ٽ� board.do�κ� ��Ʈ�ѷ��� ȣ���ؾߵȴ�

		return mv;
	}
	
	/**
	 * ������ȸ ����
	 */
	@RequestMapping(value = "/photocontest_delete.do", method = RequestMethod.GET)
	public ModelAndView photocontest_delete(String pho_no) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("pho_no", pho_no);
		mv.setViewName("/photocontest/photocontest_delete.user");
		
		return mv;
	}
	
	@RequestMapping(value="/photocontest_delete_proc.do", method = RequestMethod.GET)
	public ModelAndView photocontest_delete_proc(String pho_no, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = photocontestDao.getResultDelete(pho_no, request);
		
		if(result) {
			mv.setViewName("redirect:/photocontest.do");
		}else {
			mv.setViewName("errorPage");	
		}

		return mv;
	}
	
	/**
	 * ������ȸ ajax
	 */
	@RequestMapping(value = "/photocontest_ajax.do", method = RequestMethod.GET , produces = "application/text; charset=utf8")
	@ResponseBody
	public String photocontest_ajax(String rpage, String category, String search) {
		// ����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 9; // ���������� �Խù� ��
		int reqPage = 1; // ��û������
		int pageCount = 1; // ��ü ������ ��
		int dbCount = photocontestDao.execTotalCount(search); // DB���� ������ ��ü ���

		// �� ������ �� ���
		if (dbCount % pageSize == 0) {
			pageCount = dbCount / pageSize;
		} else {
			pageCount = dbCount / pageSize + 1;
		}
		// ��û ������ ���
		if (rpage != null) {
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage - 1) * pageSize + 1;
			endCount = reqPage * pageSize;
		} else { // ���� ó�� ������ ��, 1���������� ���´�.
			startCount = 1;
			endCount = 9;
		}

		ArrayList<PhotocontestVO> list = photocontestDao.getResultList(startCount, endCount, category, search);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
	
	    
		for(PhotocontestVO vo: list){
			JsonObject obj = new JsonObject();
			obj.addProperty("pho_title", vo.getPho_title());
			obj.addProperty("pho_date", vo.getPho_date());
			obj.addProperty("pho_hits", vo.getPho_hits());
			obj.addProperty("pho_no", vo.getPho_no());
			obj.addProperty("pho_sfile", vo.getPho_sfile());
			
			jlist.add(obj);
		}	 

		jdata.add("list",jlist);
		jdata.addProperty("dbcount", String.valueOf(dbCount));
		jdata.addProperty("rpage", reqPage);
		jdata.addProperty("pagesize", pageSize);
		
		
		
		return String.valueOf(gson.toJson(jdata));
	}

}