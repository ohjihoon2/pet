package com.pettoday.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pettoday.vo.ItemLikeVO;
import com.pettoday.vo.JoinVO;
import com.pettoday.vo.MyPostVO;
import com.pettoday.vo.MyReviewVO;
import com.pettoday.vo.PurchasesVO;

@Repository
public class MypageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="mapper.mypage";
	
	 
	   public JoinVO getMemberInfo(String sid) {
	      return sqlSession.selectOne(namespace+".info", sid);
	      
	   }

	   public int updatePassUpdate(String pass, String sid) {
	      Map<String, String> map = new HashMap<String,String>();
	      map.put("sid", sid);
	      map.put("pass", pass);
	      
	      return sqlSession.update(namespace+".passUpdate", map);
	   }

	   public int infoUpdate(JoinVO vo) {
	      
	      return sqlSession.update(namespace+".infoUpdate", vo);
	   }

	   public int delMember(String sid) {
	      
	      return sqlSession.update(namespace+".delMember", sid);
	   }

	   public ArrayList<PurchasesVO> selectPurchaseInfo(String sid) {
	      List list = null;
	      list = sqlSession.selectList(namespace+".selectPurchaseInfo", sid);
	      return (ArrayList<PurchasesVO>) list;
	   }
	   
	   public ArrayList<PurchasesVO> selectPurchaseInfoAjax(String sid, String start, String end) {
	      Map<String,String> map = new HashMap<String, String>();
	      
	      map.put("sid", sid);
	      map.put("start", start);
	      map.put("end", end);
	      
	      List list = null;
	      list = sqlSession.selectList(namespace+".selectPurchaseInfoAjax", map);
	      
	      return (ArrayList<PurchasesVO>) list;
	   }

	   public List getMyPost(String sid, int start, int end, String tname) {
	      
	      List list = null;
	      Map<String, String> param = new HashMap<String, String>();
	      param.put("start", String.valueOf(start));
	      param.put("end", String.valueOf(end));
	      param.put("sid", sid);
	      
	      if(tname.equals("myPost")) {
	         list = sqlSession.selectList(namespace+".getMyPost", param);
	      }else if(tname.equals("myReview")){
	         list = sqlSession.selectList(namespace+".getMyReview", param);
	      }
	      
	      
	      return list;
	   }
	   
	   public int getMyPostcount(String sid, String tname){
	      int count =0;
	      if(tname.equals("myPost")) {
	         count = sqlSession.selectOne(namespace+".getMyPostcount", sid);
	      }else if(tname.equals("myReview")){
	         count = sqlSession.selectOne(namespace+".getMyReviewcount", sid);
	      }
	      return count;
	   }
	   
	   public int getMyPostcount(String sid, String startdate, String enddate, String category){
	      System.out.println("getMyPostcount-category ="+ category);
	      Map<String,String> map = new HashMap<String, String>();
	      
	      map.put("sid", sid);
	      map.put("startdate", startdate);
	      map.put("enddate", enddate);
	      map.put("category", category);
	      
	      return sqlSession.selectOne(namespace+".getMyPostcount2", map);
	   }

	   public ArrayList<MyPostVO> selectMypostAjax(String sid, int startCount, int endCount, String startdate,String enddate, String category) {
	      Map<String,String> map = new HashMap<String, String>();
	      
	      map.put("sid", sid);
	      map.put("startCount", String.valueOf(startCount));
	      map.put("endCount", String.valueOf(endCount));
	      map.put("startdate", startdate);
	      map.put("enddate", enddate);
	      map.put("category", category);
	      
	      List list = null;
	      list = sqlSession.selectList(namespace+".selectMypostAjax", map);
	      
	      return (ArrayList<MyPostVO>) list;
	   }
	   
	   public ArrayList<MyPostVO> selectMyReviewAjax(String sid, int startCount, int endCount) {
	      Map<String,String> map = new HashMap<String, String>();
	      
	      map.put("sid", sid);
	      map.put("startCount", String.valueOf(startCount));
	      map.put("endCount", String.valueOf(endCount));
	      
	      List list = null;
	      list = sqlSession.selectList(namespace+".selectMyReviewAjax", map);
	      
	      return (ArrayList<MyPostVO>) list;
	   }

	   public ArrayList<MyReviewVO> getMyReview(String sid, int startCount, int endCount) {
	      List list = null;
	      Map<String, String> param = new HashMap<String, String>();
	      param.put("startCount", String.valueOf(startCount));
	      param.put("endCount", String.valueOf(endCount));
	      param.put("sid", sid);
	      list = sqlSession.selectList(namespace+".getMyReview", param);
	      return (ArrayList<MyReviewVO>) list;
	   }
	   
	   
   /********************************************************************************************************/
	   
	/***************** 구매상세내역 리스트 *****************/
	public ArrayList<PurchasesVO> getOrderDetailList(String sid,String pc_no){
		List<PurchasesVO> list = null;
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("sid", sid);
		param.put("pc_no", pc_no);
		
		list = sqlSession.selectList(namespace + ".ordDetailList",param);
		
		return (ArrayList<PurchasesVO>)list;
	}
	
	/***************** 구매내역 리스트 *****************/
	public ArrayList<PurchasesVO> getOrderList(String sid){
		List<PurchasesVO> list = null;
		
		list = sqlSession.selectList(namespace + ".ordList",sid);
		
		return (ArrayList<PurchasesVO>)list;
	}
	
	/***************** 장바구니 선택 삭제 *****************/
	public int cartDelete(ItemLikeVO vo){
		
		return sqlSession.delete(namespace + ".cartdelete",vo);
	}
	
	/***************** 장바구니 수량변경 출력 *****************/
	public int cartUpdate(String qty, String item_like_no){
		Map<String, String> param = new HashMap<String, String>();
		param.put("qty", qty);
		param.put("item_like_no", item_like_no);
		
		return sqlSession.update(namespace + ".cartupdate",param);
	}
	
	/***************** 장바구니 전체 row count 출력 *****************/
	public int execTotalCount(String sid){
		return sqlSession.selectOne(namespace + ".cartcount",sid);
	}
	
	/***************** 장바구니 리스트 - 페이징 처리 start-end *****************/
	public ArrayList<ItemLikeVO> getResultList(int start, int end, String sid){
		List<ItemLikeVO> list = null;
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("sid", sid);
		
		list = sqlSession.selectList(namespace + ".cartlist", param);
		
		return (ArrayList<ItemLikeVO>)list;
		
	}
	
	
}
