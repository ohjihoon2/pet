package com.myspring.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;

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
import com.pettoday.dao.ItemDAO;
import com.pettoday.dao.MypageDAO;
import com.pettoday.vo.DirectVO;
import com.pettoday.vo.ItemBoardVO;
import com.pettoday.vo.ItemLikeVO;
import com.pettoday.vo.ItemVO;
import com.pettoday.vo.PhotocontestVO;
import com.pettoday.vo.PurchasesVO;
import com.pettoday.vo.SessionVO;

@Controller
public class ItemController {
	
	@Autowired
	private ItemDAO itemDao;
	
	/**
	 * īī������
	 */
	@RequestMapping(value = "/kakaoPay3.do", method = RequestMethod.POST)
	public ModelAndView kakaoPay3(HttpSession session, PurchasesVO vo) {
		ModelAndView mv =new ModelAndView();
		//System.out.println("��ǰ����"+vo.getQty());
		String sid = (String)session.getAttribute("sid");
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i=0; i<=6; i++) {
			subNum += (int)(Math.random()*10);
		}
		
		String pc_no = ymd + "_" + subNum;
		
		vo.setPc_no(pc_no);
		vo.setMem_id(sid);
		//System.out.println(vo.getItem_no());
		
		itemDao.getOrderInsert(vo);
		itemDao.getDirectDetailInsert(vo);
		
		//System.out.println(vo.getTotal());
		mv.addObject("total",vo.getTotal());
		mv.setViewName("/allitem/kakaoPay3.none");
		
		return mv;
	}
	
	/**
	 * īī������
	 */
	@RequestMapping(value = "/kakaoPay2.do", method = RequestMethod.POST)
	public ModelAndView kakaoPay2(HttpSession session, PurchasesVO vo) {
		ModelAndView mv =new ModelAndView();
		
		String sid = (String)session.getAttribute("sid");
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i=0; i<=6; i++) {
			subNum += (int)(Math.random()*10);
		}
		
		String pc_no = ymd + "_" + subNum;
		
		vo.setPc_no(pc_no);
		vo.setMem_id(sid);
		//System.out.println(vo.getItem_no());
		
		itemDao.getOrderInsert(vo);
		itemDao.getOrderDetailInsert(vo);
		itemDao.getResultListDelete(sid);
		
		
		//System.out.println(vo.getTotal());
		mv.addObject("total",vo.getTotal());
		mv.setViewName("/allitem/kakaoPay2.none");
		
		return mv;
	}
	
	/**
	 * �ٷΰ��� �ֹ� ���� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/item_pay2.do", method = RequestMethod.GET)
	public ModelAndView item_pay2(HttpSession session,DirectVO vo) {
		//System.out.println(vo.getQty()+","+vo.getMem_id()+","+vo.getItem_no()+","+vo.getItem_simg());
		ModelAndView mv = new ModelAndView();

		mv.addObject("item_no",vo.getItem_no());
		mv.addObject("item_simg",vo.getItem_simg());
		mv.addObject("item_name",vo.getItem_name());
		mv.addObject("item_price",vo.getItem_price());
		mv.addObject("qty",vo.getQty());
		mv.addObject("mem_id",vo.getMem_id());
		mv.setViewName("/allitem/item_pay2.user");
		
		return mv;
	}
	
	/**
	 * �ֹ� ���� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/item_pay.do", method = RequestMethod.GET)
	public ModelAndView item_pay(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String)session.getAttribute("sid");

		ArrayList<ItemLikeVO> list = itemDao.getResultList(sid);
		
		mv.addObject("list",list);
		mv.setViewName("/allitem/item_pay.user");
		
		return mv;
	}
	
	
	/**
	 * �ٷα��� ��Ʈ�ѷ�
	 */
	@ResponseBody
	@RequestMapping(value = "/direct_cart_proc.do", method = RequestMethod.GET)
	public String direct_cart_proc(DirectVO vo) {
		//System.out.println(vo.getItem_no()+","+vo.getQty());
		int result = itemDao.getInsertDirect(vo);
		
		return String.valueOf(result);
	}
	
	/**
	 * ������ ��������_�� �����Ϸ�
	 */
	@RequestMapping(value="/item_review_delete_proccess.do", method=RequestMethod.GET,produces = "application/text; charset=utf8")
	public String item_review_delete_proccess(String ITEM_BOARD_NO,String ITEM_NO) {
		ModelAndView mv = new ModelAndView();
		boolean result = itemDao.getResultDelete(ITEM_BOARD_NO);
		String respage="";
		
		if(result) {
			respage="redirect:/itemDetail.do?iid="+ITEM_NO;
		}
		
		return respage;
	}
	
	/**
	 * ������ ��������_�� ����
	 */
	@RequestMapping(value="/item_review_delete.do", method=RequestMethod.GET,produces = "application/text; charset=utf8")
	public ModelAndView item_review_delete(String ITEM_BOARD_NO,String ITEM_NO) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("ITEM_BOARD_NO",ITEM_BOARD_NO);
		mv.addObject("ITEM_NO",ITEM_NO);
		mv.setViewName("/allitem/item_review_delete.user");
		
		return mv;
	}
	
	/**
	 * ������ ��������_�� �����Ϸ�
	 */
	@RequestMapping(value="/item_review_update_proccess.do", method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String item_review_update_proccess(ItemBoardVO vo) {
		boolean result = false;
		result = itemDao.getResultUpdate(vo);
		String respage= "";
		//System.out.println(vo.getITEM_NO());
		
		if(result) {
			respage="redirect:/itemDetail.do?iid="+vo.getITEM_NO();
		}
		
		return respage;
	}
	
	/**
	 * ������ ��������_�� ����
	 */
	@RequestMapping(value="/item_review_update.do", method=RequestMethod.GET,produces = "application/text; charset=utf8")
	public ModelAndView item_review_update(String ITEM_BOARD_NO) {
		ModelAndView mv = new ModelAndView();
		
		ItemBoardVO vo = itemDao.getResultContent(ITEM_BOARD_NO);
		
		mv.addObject("vo",vo);
		mv.setViewName("/allitem/item_review_update.user");
		
		return mv;
	}
	
	
	/**
	 * ������ ��������_�۾��� ��
	 */
	@RequestMapping(value="/item_review_content.do", method=RequestMethod.GET,produces = "application/text; charset=utf8")
	public ModelAndView item_review_content(String rpage, String ITEM_BOARD_NO,String item_no) {
		ModelAndView mv = new ModelAndView();
		
		ItemBoardVO vo = itemDao.getResultContent(ITEM_BOARD_NO);
		
		if(vo.getITEM_BOARD_TITLE() != null && vo.getITEM_BOARD_TITLE() != "") {
			itemDao.getResultReviewUpdateHits(ITEM_BOARD_NO);
			mv.addObject("vo",vo);
			mv.addObject("rpage",rpage);
			mv.setViewName("/allitem/item_review_content.user");
		}else {
			mv.setViewName("errorPage.user");
		}
		
		return mv;
	}
	
	
	/**
	 * ������ ��������_�۾��� �Ϸ�
	 */
	@RequestMapping(value="/item_review_write_process.do", method=RequestMethod.POST)
	public String item_review_write_process(ItemBoardVO vo) {
		
		boolean result = itemDao.getResultWrite(vo);
		String respage="";
		
		if(result) {
			respage="redirect:/itemDetail.do?iid="+vo.getITEM_NO();
		}
		
		/*System.out.println("** �۾��� �Ϸ� **");
		System.out.println("���̵�="+vo.getMEM_ID());
		System.out.println("����="+vo.getITEM_BOARD_TITLE());
		System.out.println("����="+vo.getITEM_BOARD_GRADE());
		System.out.println("����="+vo.getITEM_BOARD_CONTENT());*/
		
		
		return respage;
	}
	
	/**
	 * ������ ��������_�۾���
	 */
	@RequestMapping(value="/item_review_write.do", method=RequestMethod.GET,produces = "application/text; charset=utf8")
	public ModelAndView item_review_write(String item_no, String item_name) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("item_no",item_no);
		mv.addObject("item_name",item_name);
		mv.setViewName("/allitem/item_review_write.user");
		return mv;
	}
	
	/**
	 * ������ ��������_���ϱ����
	 */
	@ResponseBody
	@RequestMapping(value="itemDetail_like_del_process.do", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String itemDetail_like_del_process(String sid, String iid) {
		boolean result = false;
		result = itemDao.getItemDelLike(sid,iid);
		String resPage="";
		
		if(result) {
			resPage="���ϱ����";
		}else {
			resPage="���ϱ���� ����";
		}
		
		return resPage;
	}
	
	/**
	 * ������ ��������_���ϱ�
	 */
	@ResponseBody
	@RequestMapping(value="itemDetail_like_process.do", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public String itemDetail_like_process(String sid, String iid) {
		boolean result = false;
		result = itemDao.getItemLike(sid,iid);
		String resPage="";
		
		if(result) {
			resPage="���ϱ�";
		}else {
			resPage="���ϱ� ����";
		}
		
		
		return resPage;
	}
	
	
	
	/**
	 * ������ �������� �ı� ����¡����Ʈ
	 */
	@ResponseBody
	@RequestMapping(value = "/itemDetail_review.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String itemDetail_review(String rpage,String iid) {
		ModelAndView mv = new ModelAndView();
		
		//����¡ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;	//���������� �Խù� ��
		int reqPage = 0;	//��û������	, rpage�� ��ü
		int pageCount = 1;	//��ü ������ ��
		int dbCount = itemDao.execTotalBoardCount(iid);	//DB���� ������ ��ü ��� 
		
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
			endCount = 10;
		}
		
		//System.out.println(startCount+","+ endCount+","+check_text);			
		ArrayList<ItemBoardVO> list = itemDao.getBoardResultList(startCount, endCount,iid);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
	
	    
		for(ItemBoardVO vo: list){
			JsonObject obj = new JsonObject();
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("ITEM_BOARD_NO", vo.getITEM_BOARD_NO());
			obj.addProperty("ITEM_BOARD_GRADE", vo.getITEM_BOARD_GRADE());
			obj.addProperty("ITEM_BOARD_TITLE", vo.getITEM_BOARD_TITLE());
			obj.addProperty("MEM_ID", vo.getMEM_ID());
			obj.addProperty("ITEM_BOARD_DATE", vo.getITEM_BOARD_DATE());
			obj.addProperty("ITEM_BOARD_HITS", vo.getITEM_BOARD_HITS());
			obj.addProperty("ITEM_NO", vo.getITEM_NO());
			
			jlist.add(obj);
		}	 

		jdata.add("list",jlist);
		jdata.addProperty("dbcount", String.valueOf(dbCount));
		jdata.addProperty("rpage", reqPage);
		jdata.addProperty("pagesize", pageSize);
		
		//System.out.println("���丮��Ʈ="+jdata);
		return String.valueOf(gson.toJson(jdata));
	}
	
	/**
	 * ������ ��������
	 */
	@RequestMapping(value="itemDetail.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public ModelAndView itemDetail(String iid,String rpage,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String)session.getAttribute("sid");
		ItemVO vo = itemDao.getResultItemDetail(iid);
		
		if(vo.getItem_name() != null && vo.getItem_name() != "") {
			itemDao.getResultItemUpdateHits(iid);
		}
		
		itemDao.getReadItem(iid);
		
		if(sid != null && sid != "") {
			int rs_like = itemDao.getResultLike(sid,iid);
			//System.out.println(rs_like);
			mv.addObject("rs_like",rs_like);
		}
		
		mv.addObject("vo",vo);
		mv.setViewName("/allitem/itemDetail.user");
		
		
		return mv;
	}
	
	
	/**
	 * AllItem ����������_�� ī�װ�����_����¡����Ʈ(ajax), �α��, �ֽż�, �������ݼ�, �������ݼ�(ajax)
	 */
	@ResponseBody
	@RequestMapping(value = "/item_list_detail.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String item_list_detail(String rpage,String[] chkList,String item_value2_cate,String item_sequence,String item_cate_name) {
		ModelAndView mv = new ModelAndView();
		//System.out.println("��ī�װ�����="+rpage+","+chkList.length+","+item_value2_cate+","+item_sequence+","+item_cate_name);
		
		for(String item : chkList) {
			if(item != null || item != "") {
				//System.out.println(item+",");
				
			}else {
				//System.out.println("00000");
			}
			
		}
		
		String item_cate_name2 = item_cate_name;
		
		//����¡ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 12;	//���������� �Խù� ��
		int reqPage = 0;	//��û������	, rpage�� ��ü
		int pageCount = 1;	//��ü ������ ��
		int dbCount = itemDao.execTotalCount2(chkList,item_value2_cate);	//DB���� ������ ��ü ��� 
		
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
			endCount = 12;
		}
		//System.out.println(startCount+","+ endCount+","+check_text);			
		ArrayList<ItemVO> list = itemDao.getCateDetailResultList(startCount, endCount,chkList,item_value2_cate,item_sequence);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
	
	    
		for(ItemVO vo: list){
			JsonObject obj = new JsonObject();
			obj.addProperty("item_no", vo.getItem_no());
			obj.addProperty("item_img", vo.getItem_img());
			obj.addProperty("item_simg", vo.getItem_simg());
			obj.addProperty("item_name", vo.getItem_name());
			obj.addProperty("item_price", vo.getItem_price());
			
			jlist.add(obj);
		}	 

		jdata.add("list",jlist);
		jdata.addProperty("dbcount", String.valueOf(dbCount));
		jdata.addProperty("rpage", reqPage);
		jdata.addProperty("pagesize", pageSize);
		jdata.addProperty("item_cate_name", item_cate_name2);
		
		//System.out.println("item_cate="+jdata);
		return String.valueOf(gson.toJson(jdata));
	}
	
	/**
	 * AllItem ����������_���̵�޴�_����¡����Ʈ(ajax)
	 */
	@ResponseBody
	@RequestMapping(value = "/item_list.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String item_list(String rpage,String item_cate,String item_sequence, String item_cate_name) {
		ModelAndView mv = new ModelAndView();
		//System.out.println("ī�װ�����="+rpage+","+item_cate+","+item_sequence);
		
		String item_cate_name2 = item_cate_name;
		
		//����¡ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 12;	//���������� �Խù� ��
		int reqPage = 0;	//��û������	, rpage�� ��ü
		int pageCount = 1;	//��ü ������ ��
		int dbCount = itemDao.execTotalCount(item_cate);	//DB���� ������ ��ü ��� 
		
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
			endCount = 12;
		}
		//System.out.println(startCount+","+ endCount+","+item_cate);			
		ArrayList<ItemVO> list = itemDao.getCateResultList(startCount, endCount,item_cate,item_sequence);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
	
	    
		for(ItemVO vo: list){
			JsonObject obj = new JsonObject();
			obj.addProperty("item_no", vo.getItem_no());
			obj.addProperty("item_img", vo.getItem_img());
			obj.addProperty("item_simg", vo.getItem_simg());
			obj.addProperty("item_name", vo.getItem_name());
			obj.addProperty("item_price", vo.getItem_price());
			
			jlist.add(obj);
		}	 

		jdata.add("list",jlist);
		jdata.addProperty("dbcount", String.valueOf(dbCount));
		jdata.addProperty("rpage", reqPage);
		jdata.addProperty("pagesize", pageSize);
		jdata.addProperty("item_cate_name", item_cate_name2);
		
		//System.out.println(jdata);
		return String.valueOf(gson.toJson(jdata));
	}
	
	/**
	 * AllItem ���������� ����¡,�α��,�ֽż�,�������ݼ�,�������ݼ� ajax
	 */
	@ResponseBody
	@RequestMapping(value = "/item_all_list.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String item_all_list(String rpage,String item_sequence) {
		ModelAndView mv = new ModelAndView();
		//System.out.println("��ü="+rpage+","+item_sequence);
		
		
		//����¡ó�� - startCount, endCount ���ϱ�
		int startCount = 0;
		int endCount = 0;
		int pageSize = 12;	//���������� �Խù� ��
		int reqPage = 0;	//��û������	, rpage�� ��ü
		int pageCount = 1;	//��ü ������ ��
		int dbCount = itemDao.execTotalCount();	//DB���� ������ ��ü ��� 
		
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
			endCount = 12;
		}
		//System.out.println(startCount+","+ endCount+","+item_cate);			
		ArrayList<ItemVO> list = itemDao.getResultList(startCount, endCount,item_sequence);
		
		Gson gson = new Gson();
		JsonArray jlist = new JsonArray();
		JsonObject jdata = new JsonObject();
	
	    
		for(ItemVO vo: list){
			JsonObject obj = new JsonObject();
			obj.addProperty("item_no", vo.getItem_no());
			obj.addProperty("item_img", vo.getItem_img());
			obj.addProperty("item_simg", vo.getItem_simg());
			obj.addProperty("item_name", vo.getItem_name());
			obj.addProperty("item_price", vo.getItem_price());
			
			jlist.add(obj);
		}	 

		jdata.add("list",jlist);
		jdata.addProperty("dbcount", String.valueOf(dbCount));
		jdata.addProperty("rpage", reqPage);
		jdata.addProperty("pagesize", pageSize);
		
		//System.out.println(jdata);
		return String.valueOf(gson.toJson(jdata));
	}
	
	
	/**
	 * AllItem ����������
	 */
	@RequestMapping(value = "/item.do", method = RequestMethod.GET)
	public String item(String rpage) {
		
		return "/allitem/item.user";
	}
	
	
	
	
}