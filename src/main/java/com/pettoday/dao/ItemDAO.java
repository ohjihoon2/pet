package com.pettoday.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.mapping.ParameterMapping;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pettoday.vo.DirectVO;
import com.pettoday.vo.ItemBoardVO;
import com.pettoday.vo.ItemLikeVO;
import com.pettoday.vo.ItemVO;
import com.pettoday.vo.PurchasesVO;

@Repository
public class ItemDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="mapper.item";
	
	/** �ٷΰ��� �󼼰������� �߰� **/
	public void getDirectDetailInsert(PurchasesVO vo) {
		sqlSession.insert(namespace + ".directorddetailinsert", vo);
	}
	
	/** �ٷΰ��� ������ ��ǰ����Ʈ **/
	public DirectVO getResultDirect(DirectVO vo){
		
		return sqlSession.selectOne(namespace + ".directlist", vo);
		
	}
	
	/** �ٷΰ��� �߰� **/
	public int getInsertDirect(DirectVO vo) {
		
		return sqlSession.insert(namespace + ".ins_direct",vo);
	}
	
	/***************** ��ٱ��� ����Ʈ ���� *****************/
	public void getResultListDelete(String sid) {
		sqlSession.delete(namespace + ".cartlistdelete", sid);
	}
	
	/** �󼼰������� �߰� **/
	public void getOrderDetailInsert(PurchasesVO vo) {
		sqlSession.insert(namespace + ".orddetailinsert", vo);
	}
	
	/** ��ٱ���, �ٷΰ������� �߰� **/
	public void getOrderInsert(PurchasesVO vo) {
		sqlSession.insert(namespace + ".orderinsert", vo);
	}
	
	
	/** ���� ������ ��ǰ����Ʈ **/
	public ArrayList<ItemLikeVO> getResultList(String sid){
		List<ItemLikeVO> list = null;
		
		list = sqlSession.selectList(namespace + ".orderlist", sid);
		
		return (ArrayList<ItemLikeVO>)list;
		
	}
	
	/** ������ �����̸���Ʈ - row count�� ��� **/
	public int execTotalCatCount() {
		return sqlSession.selectOne(namespace + ".icount_admin_cat");
	}
	
	/** ������ �����̸���Ʈ **/
	public ArrayList<ItemVO> getResultAdminCatList(int start, int end){
		List<ItemVO> list = null;
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		list = sqlSession.selectList(namespace + ".admin_cat_list", param);
		
		return (ArrayList<ItemVO>)list;
	}
	
	
	/** ������ ����������Ʈ ���� **/
	public boolean getResultDogDelete(String item_no, HttpServletRequest request) {
		boolean result = false;
		String item_simg= sqlSession.selectOne(namespace+ ".del_item_simg",item_no);
		String item_sdescription= sqlSession.selectOne(namespace+ ".del_item_sdescription",item_no);
		int del_result = sqlSession.delete(namespace +".admin_dog_delete",item_no);
		
		if(del_result != 0) {
			result = true;
		}
		
		if(result) {
			//resultFile = bsfile;
			if(item_simg != null && item_simg != ""){
				//���� ���� ����
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "\\resources\\upload\\";
				String delete_path = root_path + attach_path + item_simg;
				File file = new File(delete_path);
				
				if(file.exists()) {
					file.delete();
				}
			}
			
			if(item_sdescription != null && item_sdescription != ""){
				//���� ���� ����
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "\\resources\\upload\\";
				String delete_path = root_path + attach_path + item_sdescription;
				File file = new File(delete_path);
				
				if(file.exists()) {
					file.delete();
				}
			}
		}
		
		return result;
	}
	
	/** ������ ����������Ʈ  ���� ���� ���� **/
	public boolean gerResultAdminDogUpdateNofile(ItemVO vo) {
		boolean result = false;
		int up_result = sqlSession.update(namespace + ".admin_dog_update_nofile",vo);
		if(up_result != 0) {
			result = true;
		}
		return result;
	}
	
	/** ������ ����������Ʈ ��ǰ���� **/
	public boolean gerResultAdminDogUpdate(ItemVO vo) {
		boolean result = false;
		int up_result = sqlSession.update(namespace + ".admin_dog_update", vo);
		if(up_result != 0) {
			result = true;
		}
		
		return result;
	}
	
	
	/** ������ ������,�����̸���Ʈ - �������� **/
	public ItemVO getResultAdminDogContent(String item_no) {
		return sqlSession.selectOne(namespace + ".admin_dog_content", item_no);
	}
	
	/** ������ ����������Ʈ - ��ǰ��� **/
	public boolean getResultInsGood(ItemVO vo) {
		boolean result = false;
		int ins_result = sqlSession.insert(namespace + ".ins_good", vo);
		if(ins_result != 0) {
			result = true;
		}
		return result;
	}
	
	
	/** ������ ����������Ʈ - row count�� ��� **/
	public int execTotalDogCount() {
		return sqlSession.selectOne(namespace + ".icount_admin_dog");
	}
	
	/** ������ ����������Ʈ **/
	public ArrayList<ItemVO> getResultAdminDogList(int start, int end){
		List<ItemVO> list = null;
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		list = sqlSession.selectList(namespace + ".admin_dog_list", param);
		
		return (ArrayList<ItemVO>)list;
	}
	
	
	
	/** ������ ��������_�Խ��ǻ��� **/
	public boolean getResultDelete(String ITEM_BOARD_NO) {
		boolean result = false;
		int del_result = sqlSession.update(namespace + ".delete",ITEM_BOARD_NO);
		if(del_result != 0) {
			result = true;
		}
		return result;
	}
	
	/** ������ ��������_�Խ��Ǽ��� **/
	public boolean getResultUpdate(ItemBoardVO vo) {
		boolean result = false;
		int up_result = sqlSession.update(namespace + ".update",vo);
		if(up_result != 0) {
			result = true;
		}
		return result;
	}
	
	/** ������ ��������_�Խ��� ��ȸ�� ������Ʈ **/
	public void getResultReviewUpdateHits(String ITEM_BOARD_NO) {
		sqlSession.update(namespace + ".review_hits_update",ITEM_BOARD_NO);
	}
	
	/** ������ ��������_�Խ��ǳ��� **/
	public ItemBoardVO getResultContent(String ITEM_BOARD_NO) {
		return sqlSession.selectOne(namespace + ".content", ITEM_BOARD_NO);
	}
	
	/** ������ ��������_�Խ��� ����Ʈ **/
	public ArrayList<ItemBoardVO> getBoardResultList(int start, int end, String iid){
		List<ItemBoardVO> list = null;
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("iid", iid);
		
		list = sqlSession.selectList(namespace + ".boardlist", param);
		
		return (ArrayList<ItemBoardVO>)list;
	}
	
	/** �����ۻ�������_�Խ��� - row count�� ��� **/
	public int execTotalBoardCount(String iid) {
		return sqlSession.selectOne(namespace + ".icount_item_board",iid);
	}
	
	/** ������ ��������_�۾��� �Ϸ� **/
	public boolean getResultWrite(ItemBoardVO vo) {
		boolean result = false;
		int ins_result = sqlSession.insert(namespace + ".write", vo);
		if(ins_result != 0) {
			result = true;
		}
		
		return result;
	}
	
	/** ������ ��������_���ϱ����� **/
	public int getResultLike(String sid, String iid) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("sid", sid);
		param.put("iid", iid);
		System.out.println("���ϱ� ����="+sid+","+iid);
		
		return sqlSession.selectOne(namespace + ".item_like_keep",param);
		
	}
	
	/** ������ ��������_���ϱ���� **/
	public boolean getItemDelLike(String sid, String iid) {
		boolean result=false;
		Map<String, String> param = new HashMap<String, String>();
		param.put("sid", sid);
		param.put("iid", iid);
		
		int ins_item_like = sqlSession.delete(namespace + ".item_like_del",param);
		if(ins_item_like != 0) {
			result = true;
		}
		
		return result;
	}
	
	/** ������ ��������_���ϱ� **/
	public boolean getItemLike(String sid, String iid) {
		boolean result=false;
		Map<String, String> param = new HashMap<String, String>();
		param.put("sid", sid);
		param.put("iid", iid);
		
		int ins_item_like = sqlSession.insert(namespace + ".item_like",param);
		if(ins_item_like != 0) {
			result = true;
		}
		
		return result;
	}
	
	/** ������ �������� ��ȸ�� ������Ʈ **/
	public void getResultItemUpdateHits(String iid) {
		sqlSession.update(namespace + ".item_hits_update",iid);
	}
	
	/** ������ �������� **/
	public ItemVO getResultItemDetail(String iid) {
		return sqlSession.selectOne(namespace+".detailList",iid);
	}
	
	
	/** ����ī�װ��� ����Ʈ - row count�� ��� **/
	public int execTotalCount2(String[] chkList,String item_value2_cate) {
	
		Map<String, String> param = new HashMap<String, String>();
		/*	for(int i=0; i<chkList.length; i++) {
				param.put("item"+(i+1), chkList[i]);
				//System.out.println("item="+chkList[i]);
			}*/
			
			for(int i=0; i<chkList.length; i++) {
				if(i==0) {
					param.put("p_cate",chkList[0]);
				}else if(i==1) {
					param.put("p_brand",chkList[1]);
				}else if(i==2) {
					param.put("p_feature",chkList[2]);
				}else if(i==3) {
					param.put("p_material",chkList[3]);
				}
			}
			
			param.put("item_value2_cate", item_value2_cate);
			/*for(int i=0; i<chkList.length; i--) {
				param.put("item"+(i+1), chkList[i]);
				System.out.println("item="+chkList[i]);*/
	
		
		return sqlSession.selectOne(namespace + ".icount_item_detail",param);
	}
	
	/** ī�װ��� ����Ʈ - row count�� ��� **/
	public int execTotalCount(String item_cate) {
		return sqlSession.selectOne(namespace + ".icount_item_category",item_cate);
	}
	
	/** ��ü ����Ʈ - row count�� ��� **/
	public int execTotalCount() {
		return sqlSession.selectOne(namespace + ".icount");
	}
	
	
	/** ����ī�װ��� ��ü ����Ʈ, �α��,�ֽż�,�������ݼ�,�������ݼ� **/
	public ArrayList<ItemVO> getCateDetailResultList(int start, int end,String[] chkList,String item_value2_cate,String item_sequence){
		
		
		List<ItemVO> list = null;
		Map<String, String> param = new HashMap<String, String>();
		
		for(int i=0; i<chkList.length; i++) {
			if(i==0) {
				param.put("p_cate",chkList[0]);
			}else if(i==1) {
				param.put("p_brand",chkList[1]);
			}else if(i==2) {
				param.put("p_feature",chkList[2]);
			}else if(i==3) {
				param.put("p_material",chkList[3]);
			}
		}
		
		/*System.out.println(param.get("p_cate"));
		System.out.println(param.get("p_brand"));
		System.out.println(param.get("p_feature"));
		System.out.println(param.get("p_material"));
		System.out.println(param.get("p_sequence"));*/
		//param.put("array",chkList); //��ü�� �޾ƿ��� ������ Map<String,Object> ����� ��
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("item_value2_cate", item_value2_cate);
		param.put("item_sequence", item_sequence);
		 
	
		list = sqlSession.selectList(namespace + ".cate_detail_list", param);
		
		return (ArrayList<ItemVO>)list;
	}
		
	
	/** ī�װ����� ��ü ����Ʈ **/
	public ArrayList<ItemVO> getCateResultList(int start, int end, String item_cate, String item_sequence){
		List<ItemVO> list = null;
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("item_cate", item_cate);
		param.put("item_sequence", item_sequence);
		
		list = sqlSession.selectList(namespace + ".cate_list", param);
		
		return (ArrayList<ItemVO>)list;
		
	}
	
	
	/** ��ü ����Ʈ **/
	/*public ArrayList<ItemVO> getResultList(int start, int end){
		List<ItemVO> list = null;
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		list = sqlSession.selectList(namespace + ".list", param);
		
		return (ArrayList<ItemVO>)list;
		
	}*/
	
	/** ��ü ����Ʈ **/
	public ArrayList<ItemVO> getResultList(int start, int end,String item_sequence){
		List<ItemVO> list = null;
		
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("item_sequence", item_sequence);
		
		list = sqlSession.selectList(namespace + ".llist", param);
		
		return (ArrayList<ItemVO>)list;
		
	}
	
	/** ��õ��ǰ ����Ʈ **/
	public ArrayList<ItemVO> getGoodList(){
		List<ItemVO> list = null;
		list = sqlSession.selectList(namespace + ".goodlist");
		
		return (ArrayList<ItemVO>)list;
		
	}
	/** ��������õ��ǰ ����Ʈ **/
	public ArrayList<ItemVO> getDogGoodList(){
		List<ItemVO> list = null;
		list = sqlSession.selectList(namespace + ".doggoodlist");
		
		return (ArrayList<ItemVO>)list;
		
	}
	/** �������ֱٵ�ϻ�ǰ ����Ʈ **/
	public ArrayList<ItemVO> getRecentList(){
		List<ItemVO> list = null;
		list = sqlSession.selectList(namespace + ".recentlist");
		
		return (ArrayList<ItemVO>)list;
		
	}
	/** ��������õ��ǰ ����Ʈ **/
	public ArrayList<ItemVO> getCatGoodList(){
		List<ItemVO> list = null;
		
		list = sqlSession.selectList(namespace + ".catgoodlist");
		
		return (ArrayList<ItemVO>)list;
		
	}
	/** �������ֱٵ�ϻ�ǰ ����Ʈ **/
	public ArrayList<ItemVO> getRecentCatList(){
		List<ItemVO> list = null;
		list = sqlSession.selectList(namespace + ".recentcatlist");
		
		return (ArrayList<ItemVO>)list;
		
	}
	/** �ֱ� �� ��ǰ ����Ʈ **/
	public ArrayList<ItemVO> getNearList(String mem_id){
		List<ItemVO> list = null;
		list = sqlSession.selectList(namespace + ".neargoodlist",mem_id);
		
		return (ArrayList<ItemVO>)list;
		
	}
	/** ��õ(������) ��ǰ ����Ʈ **/
	public ArrayList<ItemVO> getRecommandList(String meat,String feature,String feel){
		List<ItemVO> list = null;
		System.out.println(meat);
		System.out.println(feature);
		System.out.println(feel);
		Map<String, String> param = new HashMap<String, String>();
		param.put("meat", meat);
		param.put("feature", feature);
		param.put("feel", feel);
		
		
		list = sqlSession.selectList(namespace + ".recommend",param);
		
		return (ArrayList<ItemVO>)list;
		
	}
	/** ��õ(������) ��ǰ ����Ʈ **/
	public ArrayList<ItemVO> getCatRecommandList(String meat,String feature,String feel){
		List<ItemVO> list = null;
		System.out.println(meat);
		System.out.println(feature);
		System.out.println(feel);
		Map<String, String> param = new HashMap<String, String>();
		param.put("meat", meat);
		param.put("feature", feature);
		param.put("feel", feel);
		
		
		list = sqlSession.selectList(namespace + ".catrecommend",param);
		
		return (ArrayList<ItemVO>)list;
		
	}
	
	
	/** �ֱ� �� ������ **/
	public void getReadItem(String item_no) {
		sqlSession.insert(namespace+".nearinsert",item_no);
	}
	
}