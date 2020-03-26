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
import com.pettoday.dao.WalktogetherDAO;
import com.pettoday.vo.PhotocontestVO;
import com.pettoday.vo.WalktogetherReplyVO;
import com.pettoday.vo.WalktogetherVO;

@Controller
public class WalktogetherController {
	
	@Autowired
	private WalktogetherDAO walktogetherDao;

	/**
	 * ģ���� ��å ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/walktogether.do", method = RequestMethod.GET)
	public ModelAndView walktogether(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		// ����¡ ó�� - startCount, endCount ���ϱ�
				int startCount = 0;
				int endCount = 0;
				int pageSize = 8; // ���������� �Խù� ��
				int reqPage = 1; // ��û������
				int pageCount = 1; // ��ü ������ ��
				int dbCount = walktogetherDao.execTotalCount(); // DB���� ������ ��ü ���

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
					endCount = 8;
				}

				ArrayList<WalktogetherVO> list = walktogetherDao.getResultList(startCount, endCount);

				mv.addObject("list", list);
				mv.addObject("dbCount", dbCount);
				mv.addObject("rpage", rpage);
				mv.addObject("pageSize", pageSize);
				mv.setViewName("/walktogether/walktogether.user");

				return mv;
	}
	
	
	
	/**
	 * ģ���� ��å ajax
	 */
	@RequestMapping(value = "/walktogether_ajax.do",   method = RequestMethod.GET , produces = "application/text; charset=utf8")
	@ResponseBody
	public String walktogether_ajax(String rpage, String category, String search) {

		// ����¡ ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize =6; // ���������� �Խù� ��
		int reqPage = 1; // ��û������
		int pageCount = 1; // ��ü ������ ��
		int dbCount = walktogetherDao.execTotalCount(category, search); // DB���� ������ ��ü ���

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
			endCount = 6;
		}

		ArrayList<WalktogetherVO> list = walktogetherDao.getResultList(startCount, endCount, category, search);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
	
	    
		for(WalktogetherVO vo: list){
			JsonObject obj = new JsonObject();
			obj.addProperty("wal_no", vo.getWal_no());
			obj.addProperty("wal_sfile", vo.getWal_sfile());
			obj.addProperty("wal_name", vo.getWal_name());
			obj.addProperty("wal_dog", vo.getWal_dog());
			obj.addProperty("wal_address", vo.getWal_address());
			obj.addProperty("wal_favorite", vo.getWal_favorite());
			obj.addProperty("wal_date", vo.getWal_date());
			obj.addProperty("wal_hits", vo.getWal_hits());
			
			jlist.add(obj);
		}	 

		jdata.add("list",jlist);
		jdata.addProperty("dbcount", String.valueOf(dbCount));
		jdata.addProperty("rpage", reqPage);
		jdata.addProperty("pagesize", pageSize);
		
		
		
		return String.valueOf(gson.toJson(jdata));
	}
	
	/**
	 * ģ���� ��å �� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/walktogether_content.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public ModelAndView walktogether_content(String wal_no, String page) {
		ModelAndView mv = new ModelAndView();

		WalktogetherVO vo = walktogetherDao.getResultContent(wal_no);

		if (vo.getWal_name() != "" && vo.getWal_name() != null) {

			walktogetherDao.getResultUpdatehits(wal_no);

			if (vo.getWal_content() != "" && vo.getWal_content() != null) {

				mv.addObject("vo", vo);
				mv.addObject("rpage", page);
				mv.setViewName("/walktogether/walktogether_content.user");
				
				
			} else {
				vo.setWal_content("");
			}

		} else {
			mv.setViewName("errorPage");
		}

		return mv;
	}
	
	/**
	 * ģ���� ��å �۾��� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/walktogether_write.do", method = RequestMethod.GET)
	public String walktogether_write(String sid) {
		String regPage = "";
		if(sid != null && sid != "") {
			regPage= "/walktogether/walktogether_write.user";
		}else {
			regPage= "/member/login.user";
		}
		return regPage;
	}
	
	@RequestMapping(value = "/walktogether_write_proc.do", method = RequestMethod.POST)
	public String walktogether_write_proc(WalktogetherVO vo, HttpServletRequest request) throws Exception{
		String root_path = "", attach_path = "", wal_sfile = "";
		
		if (vo.getWal_cfile().getOriginalFilename() != null && vo.getWal_cfile().getOriginalFilename() != "") {
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path = "\\resources\\upload\\";

			UUID uuid = UUID.randomUUID();
			String wal_file = vo.getWal_cfile().getOriginalFilename();
			wal_sfile = uuid + "_" + vo.getWal_cfile().getOriginalFilename();

			vo.setWal_file(wal_file);
			vo.setWal_sfile(wal_sfile);
		}else {
			vo.setWal_sfile("");
			vo.setWal_file("");
		}
		
		boolean result = walktogetherDao.getResultWrite(vo);
		String resPage = "";
		
		if(result) {
			if(vo.getWal_cfile().getOriginalFilename() != null && vo.getWal_cfile().getOriginalFilename() != "") {
				String upload_path = root_path+attach_path+wal_sfile;
				
				File file = new File(upload_path);
				vo.getWal_cfile().transferTo(file);
			}
			
			resPage = "redirect:/walktogether.do";
		}else {
			resPage = "errorPage";
		}

		return resPage;
	}
	
	/**
	 * ģ���� ��å ����
	 */
	@RequestMapping(value = "/walktogether_delete.do", method = RequestMethod.GET)
	public ModelAndView walktogether_delete(String wal_no) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("wal_no", wal_no);
		mv.setViewName("/walktogether/walktogether_delete.user");
		
		return mv;
	}
	
	@RequestMapping(value="/walktogether_delete_proc.do", method = RequestMethod.GET)
	public ModelAndView walktogether_delete_proc(String wal_no, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = walktogetherDao.getResultDelete(wal_no, request);
		
		if(result) {
			mv.setViewName("redirect:/walktogether.do");
		}else {
			mv.setViewName("errorPage");	
		}

		return mv;
	}
	
	/**
	 * ģ���� ��å ����
	 */
	@RequestMapping(value = "/walktogether_update.do", method = RequestMethod.GET)
	public ModelAndView walktogether_update(String wal_no) {
		ModelAndView mv = new ModelAndView();

		//BoardCheckService board = new BoardCheckService();
		WalktogetherVO vo = walktogetherDao.getResultContent(wal_no);

		mv.addObject("vo", vo);
		mv.setViewName("/walktogether/walktogether_update.user");

		return mv;
	}
	
	/**
	 * ������ȸ ���� �Ϸ� ó��
	 */
	@RequestMapping(value = "/walktogether_update_proc.do", method = RequestMethod.POST)
	public ModelAndView walktogether_update_proc(WalktogetherVO vo, HttpServletRequest request, String del_wal_sfile) throws Exception {
		ModelAndView mv = new ModelAndView();

		boolean result = false;

		if (vo.getWal_cfile().getOriginalFilename() != null && vo.getWal_cfile().getOriginalFilename() != "") {

			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = "\\resources\\upload\\";

			// �ߺ����� ó��
			UUID uuid = UUID.randomUUID();
			String wal_file = vo.getWal_cfile().getOriginalFilename();
			String wal_sfile = uuid + "_" + vo.getWal_cfile().getOriginalFilename();


			// db������ ���� ���ϸ� set
			vo.setWal_file(wal_file);
			vo.setWal_sfile(wal_sfile);
			result = walktogetherDao.getResultUpdate(vo); // ��ü������ ������Ʈ

			if (result) {
				// ���ε������� ���� ����
				String upload_path = root_path + attach_path + wal_sfile;

				File file = new File(upload_path);
				vo.getWal_cfile().transferTo(file);

				// ���� ���� ����
				if (del_wal_sfile != null && del_wal_sfile != "") {
					String del_path = root_path + attach_path + del_wal_sfile;
					File delFile = new File(del_path);
					if (delFile.exists())
						delFile.delete();
				}
			}
		}

		if (result) {
			mv.setViewName("redirect:/walktogether.do"); // if(result) mv.setViewName("/board/board_list"); ------------->
		} // �̷��� ���� �ϴµ� null����Ʈ�� ��� board.do�κ�
			// ��Ʈ�ѷ����� ���� arraylist�������� ������ �ȵǼ�
			// �׷��� �׷��� �ٽ� board.do�κ� ��Ʈ�ѷ��� ȣ���ؾߵȴ�

		return mv;
	}
	
	/**
	 * ģ���� ��å ���
	 */
	@RequestMapping(value = "/walktogether_reply_write_proc.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String walktogether_reply_write_proc(WalktogetherReplyVO vo) {
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		boolean result = walktogetherDao.getResultReplyContent(vo);

		if(result) {
			ArrayList<WalktogetherReplyVO> list = walktogetherDao.getResultReplyList(String.valueOf(vo.getWal_no()));
			
			for(WalktogetherReplyVO vo2: list){
				JsonObject obj = new JsonObject();
				vo2.setWal_reply_content(vo2.getWal_reply_content().replace("\r\n", "<br>"));
				obj.addProperty("wal_reply_no", vo2.getWal_reply_no());
				obj.addProperty("wal_reply_content", vo2.getWal_reply_content());
				obj.addProperty("wal_reply_date", vo2.getWal_reply_date());
				obj.addProperty("wal_no", vo2.getWal_no());
				obj.addProperty("mem_id", vo2.getMem_id());
				
				jlist.add(obj);
			}	 
			jdata.add("list",jlist);
		}
		return String.valueOf(gson.toJson(jdata));
	}
	
	/**
	 * ģ���� ��å ��� ajax
	 */
	@RequestMapping(value="/walktogether_reply_ajax.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String walktogether_reply_ajax(String wal_no) {
		ArrayList<WalktogetherReplyVO> list = walktogetherDao.getResultReplyList(wal_no);
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		
		for(WalktogetherReplyVO vo: list){
			JsonObject obj = new JsonObject();
			vo.setWal_reply_content(vo.getWal_reply_content().replace("\r\n", "<br>"));
			obj.addProperty("wal_reply_no", vo.getWal_reply_no());
			obj.addProperty("wal_reply_content", vo.getWal_reply_content());
			obj.addProperty("wal_reply_date", vo.getWal_reply_date());
			obj.addProperty("wal_no", vo.getWal_no());
			obj.addProperty("mem_id", vo.getMem_id());
			
			jlist.add(obj);
		}	 

		jdata.add("list",jlist);
		
		return String.valueOf(gson.toJson(jdata));
	}
	
	
	@RequestMapping(value = "/wal_reply_delete_proc.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String wal_reply_delete_proc(String wal_reply_no, String wal_no) {
		walktogetherDao.getReplyDelete(wal_reply_no);
		
		ArrayList<WalktogetherReplyVO> list = walktogetherDao.getResultReplyList(wal_no);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
		
		
		for(WalktogetherReplyVO vo: list){
			JsonObject obj = new JsonObject();
			vo.setWal_reply_content(vo.getWal_reply_content().replace("\r\n", "<br>"));
			obj.addProperty("wal_reply_no", vo.getWal_reply_no());
			obj.addProperty("wal_reply_content", vo.getWal_reply_content());
			obj.addProperty("wal_reply_date", vo.getWal_reply_date());
			obj.addProperty("wal_no", vo.getWal_no());
			obj.addProperty("mem_id", vo.getMem_id());
			
			jlist.add(obj);
		}	 

		jdata.add("list",jlist);
		
		return String.valueOf(gson.toJson(jdata));
	}
}