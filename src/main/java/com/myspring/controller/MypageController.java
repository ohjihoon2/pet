package com.myspring.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.pettoday.dao.MypageDAO;
import com.pettoday.vo.ItemLikeVO;
import com.pettoday.vo.JoinVO;
import com.pettoday.vo.MyPostVO;
import com.pettoday.vo.MyReviewVO;
import com.pettoday.vo.PagingVO;
import com.pettoday.vo.PurchasesVO;

/**
 * @author sist.jihoon
 * 
 */
@Controller
public class MypageController {
	
	@Autowired
	private MypageDAO mypageDao;
	
	   
	   @RequestMapping(value = "/mypageMain.do", method = RequestMethod.GET)
	   public String mypageMain() {
	      return "/mypage/mypageMain.user";
	   } 
	   
	   @RequestMapping(value = "/updateInfo.do", method = RequestMethod.GET)
	   public ModelAndView updateInfo(HttpSession session) {
	      ModelAndView mv = new ModelAndView();
	      String phones[] =new String[3];
	      
	      String sid = (String) session.getAttribute("sid");
	      JoinVO vo = mypageDao.getMemberInfo(sid);
	      String pass = vo.getMem_pass();
	      String email =vo.getMem_email();
	      System.out.println("vo.getMem_phone() = "+vo.getMem_phone());
	      System.out.println("vo.getMem_email() = "+vo.getMem_email());
	      String mem_phone =vo.getMem_phone();
	      System.out.println("mem_phone= "+mem_phone);
	      
	      String address =vo.getMem_address();
	      String mem_email[] = email.split("@");
	      phones[0] =mem_phone.substring(0, 3);
	      System.out.println("mem_phone[0] ="+phones[0]);
	      phones[1] =mem_phone.substring(3, 7);
	      System.out.println("mem_phone[1] ="+phones[1]);
	      phones[2] =mem_phone.substring(7, 11);
	      System.out.println("mem_phone[2] ="+phones[2]);
	   
	      String mem_address[] = address.split("/");
	      
	      
	      String email1 = null, email2 =null;
	      String phone1 = null, phone2 =null , phone3 = null;
	      String address1 = null, address2 =null , address3 = null;
	      for(int i=0;i<mem_email.length;i++) {
	         
	         if(i == 0) {
	            email1 =mem_email[i];
	         }else if(i ==1){
	            email2 = mem_email[i];
	         }
	      }
	      
	      for(int i=0;i<phones.length;i++) {
	         
	         if(i == 0) {
	            phone1 =phones[i];
	         }else if(i ==1){
	            phone2 = phones[i];
	         }else if(i ==2) {
	            phone3 = phones[i];
	         }
	      }
	      
	      for(int i=0;i<mem_address.length;i++) {
	         
	         if(i == 0) {
	            address1 =mem_address[i];
	         }else if(i ==1){
	            address2 = mem_address[i];
	         }else if(i ==2) {
	            address3 = mem_address[i];
	         }
	      }

	      mv.addObject("pass",pass);
	      mv.addObject("email1",email1);
	      mv.addObject("email2",email2);
	      mv.addObject("phone1",phone1);
	      mv.addObject("phone2",phone2);
	      mv.addObject("phone3",phone3);
	      mv.addObject("address1",address1);
	      mv.addObject("address2",address2);
	      mv.addObject("address3",address3);
	      mv.addObject("sid",sid);
	      mv.addObject("vo",vo);
	      
	      mv.setViewName("/mypage/updateInfo.user");
	      return mv;
	   } 
	   /**
	    * 비밀번호 수정
	    * @param pass
	    * @param session
	    * @return
	    */
	   @RequestMapping(value = "/passUpdate.do", method = RequestMethod.GET)
	   public ModelAndView passUpdate(String pass, HttpSession session) {
	      ModelAndView mv = new ModelAndView();
	      String sid = (String) session.getAttribute("sid");
	      
	      
	      int result = mypageDao.updatePassUpdate(pass, sid);
	      if(result != 0) {
	         mv.setViewName("/mypage/updateInfo.user");
	      }else {
	         mv.setViewName("errorPage.user");
	      }
	      
	      return mv;
	   } 
	   
	   /**
	    * 회원 정보 수정
	    * @param vo
	    * @return
	    */
	   @RequestMapping(value = "/infoUpdate_proc.do", method = RequestMethod.POST)
	   public ModelAndView infoUpdate(JoinVO vo) {
	      ModelAndView mv = new ModelAndView();
	      
	      int result = mypageDao.infoUpdate(vo);
	      
	      if(result != 0) {
	         
	         mv.setViewName("redirect:/updateInfo.do");
	      }else {
	         mv.setViewName("errorPage.user");
	      }
	      
	      return mv;
	   } 
	   /**
	    * 계정 탈퇴
	    * @param sid
	    * @return
	    */
	   @RequestMapping(value = "/delMember_proc.do", method = RequestMethod.GET)
	   public ModelAndView delMember(HttpSession session) {
	      String sid = (String)session.getAttribute("sid");
	      ModelAndView mv = new ModelAndView();
	      int result = mypageDao.delMember(sid);
	      if(result != 0) {
	         session.invalidate();
	         mv.setViewName("index.user");
	      }
	      return mv;
	   }
	   
	   
	   @ResponseBody
	   @RequestMapping(value = "/purchaseInfoAjax.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	   public String purchaseInfoAjax(HttpSession session, String start, String end) {
	      String sid = (String)session.getAttribute("sid");
	      System.out.println("start = " +start);
	      System.out.println("end = " +end);
	      ArrayList<PurchasesVO> list = null;
	      
	      if(start.equals("전체") && end.equals("전체")) {
	         return "reload";
	      }else {
	         list =  mypageDao.selectPurchaseInfoAjax(sid,start,end);
	      }
	      
	      Gson gson = new Gson();
	      JsonArray jlist = new JsonArray();
	      JsonObject jdata = new JsonObject();
	      
	      
	      for(PurchasesVO vo :list) {
	         JsonObject obj = new JsonObject();
	         obj.addProperty("rno",vo.getRno());
	         obj.addProperty("pc_no",vo.getPc_no());
	         obj.addProperty("payname",vo.getPayname() );
	         obj.addProperty("pc_date",vo.getPc_date() );
	         obj.addProperty("total",vo.getTotal());
	         obj.addProperty("mem_id",vo.getMem_id());
	         
	         jlist.add(obj);
	      }
	      jdata.add("list", jlist);
	      
	      return String.valueOf(gson.toJson(jdata));
	   } 
	   
	   
	   /**
	    * 내가 쓴 글
	    * @return
	    */
	   @RequestMapping(value = "/myPosts.do", method = RequestMethod.GET)
	   public ModelAndView myPosts(String rpage, HttpSession session) {
	      
	      String sid = (String)session.getAttribute("sid");
	      ModelAndView mv = new ModelAndView();
	      
	      PagingVO pvo = paging(sid, "myPost", rpage);
	      PagingVO rvo = paging(sid, "myReview", rpage);
	      
	      mv.addObject("list",(ArrayList<MyPostVO>)pvo.getList());
	      mv.addObject("rlist",(ArrayList<MyReviewVO>)rvo.getList());
	      mv.addObject("rvo",rvo);
	      mv.addObject("pvo",pvo);
	      mv.setViewName("/mypage/myPosts.user");
	      
	      return mv;
	   } 
	   
	   
	   @ResponseBody
	   @RequestMapping(value = "/myPostsSearchAjax.do", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	   public String myPostsSearchAjax(HttpSession session, String rpage, String startdate, String enddate, String category, String pid) {
	      System.out.println("rpage ="+ rpage);
	      System.out.println("startdate ="+startdate);
	      System.out.println("enddate = "+enddate);
	      System.out.println("category ="+ category);
	      System.out.println("pid ="+ pid);
	      
	      String sid = (String)session.getAttribute("sid");
	      ArrayList<MyPostVO> list = null;
	      
	      int startCount = 0;
	      int endCount = 0;
	      int pageSize = 5;   
	      int reqPage = 1;   
	      int pageCount = 1;   
	      int dbCount = 0;
	      PagingVO pvo = null;
	      //dbCount = mypageDao.getMyPostcount(sid, startdate, enddate, category);   
	      if(pid.equals("#ampaginationsm")) {
	         pvo = paging(sid, "myPost", rpage, category, startdate, enddate); 
	         dbCount = pvo.getDbcount();
	      }else if(pid.equals("#ampaginationsm2")) {
	         pvo = paging(sid, "myReview", rpage);
	         dbCount = pvo.getDbcount();
	      }
	      System.out.println("pvo.getDbcount() ="+pvo.getDbcount());
	      /*PagingVO rvo = paging(sid, "myReview", rpage, category, startdate, enddate); */
	      
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
	      System.out.println("dbCount = "+dbCount);
	      
	      if(category.equals("all") && startdate.equals("전체") && enddate.equals("전체")) {
	         return "reload";
	      }else{
	         if(pid.equals("#ampaginationsm")) {
	            System.out.println("#ampaginationsm pid");
	            list =  mypageDao.selectMypostAjax(sid, startCount, endCount,startdate, enddate, category);
	         }else if(pid.equals("#ampaginationsm2")) {
	            System.out.println("#ampaginationsm2 pid");
	            list = mypageDao.selectMyReviewAjax(sid, startCount, endCount);
	         }
	      }
	      
	      Gson gson = new Gson();
	      JsonArray jlist = new JsonArray();
	      JsonObject jdata = new JsonObject();
	      
	      if(pid.equals("#ampaginationsm")) {
	         
	         for(MyPostVO vo :list) {
	            JsonObject obj = new JsonObject();
	            obj.addProperty("title",vo.getTitle());
	            obj.addProperty("wsort",vo.getWsort());
	            obj.addProperty("wdate",vo.getWdate());
	            obj.addProperty("rno",vo.getRno());
	            
	            jlist.add(obj);
	         }
	      }else if(pid.equals("#ampaginationsm2")) {
	         for(MyPostVO vo :list) {
	            JsonObject obj = new JsonObject();
	            obj.addProperty("rname",vo.getRname());
	            obj.addProperty("rgrade",vo.getRgrade());
	            obj.addProperty("rcontent",vo.getRcontent());
	            obj.addProperty("wdate",vo.getRdate());
	            
	            jlist.add(obj);
	         }
	      }
	      
	      
	      jdata.add("list", jlist);
	      jdata.addProperty("dbcount", pvo.getDbcount());
	      jdata.addProperty("rpage", rpage);
	      jdata.addProperty("pagesize", pageSize);
	      
	      
	      return String.valueOf(gson.toJson(jdata));
	   }    
	      
	   @RequestMapping(value = "/myReviewModal.do", method = RequestMethod.GET)
	   public String myReviewModal() {
	      return "/mypage/myReviewModal.user";
	   }    
	   
	   
	   
	   public PagingVO paging(String sid, String tname, String rpage) {
	      PagingVO pvo = new PagingVO();
	      System.out.println("tname = "+tname);
	      
	      int startCount = 0;
	      int endCount = 0;
	      int pageSize = 5;   
	      int reqPage = 1;   
	      int pageCount = 1;
	      int dbCount = mypageDao.getMyPostcount(sid, tname);   
	      System.out.println("paging-dbCOunt ="+dbCount);
	      
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
	      
	      List list = mypageDao.getMyPost(sid, startCount, endCount, tname);
	      //ArrayList<MyReviewVO> rlist = mypageDao.getMyReview(sid, startCount, endCount);
	      
	      pvo.setList(list);
	      pvo.setSid(sid);
	      pvo.setDbcount(dbCount);
	      pvo.setPagesize(pageSize);
	      pvo.setRpage(reqPage);
	      
	      return pvo;
	   }
	   
	   public PagingVO paging(String sid, String tname, String rpage, String category, String startdate, String enddate) {
	      PagingVO pvo = new PagingVO();
	      System.out.println("tname = "+tname);
	      
	      int startCount = 0;
	      int endCount = 0;
	      int pageSize = 5;   
	      int reqPage = 1;   
	      int pageCount = 1;
	      int dbCount = mypageDao.getMyPostcount(sid, startdate, enddate, category);   
	      
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
	      
	      List list = mypageDao.getMyPost(sid, startCount, endCount, tname);
	      //ArrayList<MyReviewVO> rlist = mypageDao.getMyReview(sid, startCount, endCount);
	      
	      pvo.setList(list);
	      pvo.setSid(sid);
	      pvo.setDbcount(dbCount);
	      pvo.setPagesize(pageSize);
	      pvo.setRpage(reqPage);
	      
	      return pvo;
	   }
	   
	   
	/**
	 * 구매상세내역 보기
	 * @return
	 */
	@RequestMapping(value = "/orderView.do", method = RequestMethod.GET)
	public ModelAndView oderView(HttpSession session,String pc_no) {
		ModelAndView mv = new ModelAndView();
		
		String sid = (String)session.getAttribute("sid");
		
		ArrayList<PurchasesVO> list =  mypageDao.getOrderDetailList(sid,pc_no);
		
		mv.addObject("list", list);
		mv.setViewName("/mypage/orderView.user");
		
		return mv;
	}
	
	/**
	 * 구매내역 보기
	 * @return
	 */
	@RequestMapping(value = "/purchaseInfo.do", method = RequestMethod.GET)
	public ModelAndView purchaseInfo(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		String sid = (String)session.getAttribute("sid");
		ArrayList<PurchasesVO> list =  mypageDao.getOrderList(sid);
		
		mv.addObject("list", list);
		mv.setViewName("/mypage/purchaseInfo.user");
		return mv;
	}

	
	
	/** 찜하기 삭제 **/
	@ResponseBody
	@RequestMapping(value = "/cart_delete.do", method = RequestMethod.GET)
	public String cart_delete(String[] checkList,HttpSession session, ItemLikeVO vo){
		
		String sid = (String)session.getAttribute("sid");
		int item_like_no = 0;
		int result=0;
		
		if(sid != null) {
			vo.setMem_id(sid);
			for(String i : checkList) {
				item_like_no = Integer.parseInt(i);
				//System.out.println(item_like_no);
				vo.setItem_like_no(item_like_no);
				result = mypageDao.cartDelete(vo);
			}
		}
		
	
		return String.valueOf(result);
	}
	
	/** 찜하기 수량변경 **/
	@ResponseBody
	@RequestMapping(value = "/cart_proc.do", method = RequestMethod.GET)
	public String cart_proc(String qty,String item_like_no) {
		
		
		int result = mypageDao.cartUpdate(qty,item_like_no);
		
		
		return String.valueOf(result);
	}
	
	
	/** 찜하기 **/
	@RequestMapping(value = "/shoppingCart.do", method = RequestMethod.GET)
	public ModelAndView shoppingCart(String rpage, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String sid = (String)session.getAttribute("sid");
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;	//한페이지당 게시물 수
		int reqPage = 0;	//요청페이지	, rpage를 대체
		int pageCount = 1;	//전체 페이지 수
		int dbCount = mypageDao.execTotalCount(sid);	//DB에서 가져온 전체 행수
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}

		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
	 		endCount = reqPage *pageSize;
		}else{
			reqPage = 1;
			startCount = 1;
			endCount = 10;
		}

		ArrayList<ItemLikeVO> list = mypageDao.getResultList(startCount, endCount,sid);
		
		mv.addObject("list",list);
		mv.addObject("dbcount",dbCount);
		mv.addObject("rpage",reqPage);
		mv.addObject("pagesize",pageSize);
		mv.setViewName("/mypage/shoppingCart.user");
		
		
		return mv;
	}
	
	
	
}
