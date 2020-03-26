package com.pettoday.dao;

import java.io.File;
import java.util.ArrayList;  
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.pettoday.vo.VetVO;

@Repository
public class VetDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.vet";
	
	public int execTotalCount() {
		return sqlSession.selectOne(namespace + ".tip_count");
	}
	
	public int execTotalCount2() {
		return sqlSession.selectOne(namespace + ".ctip_count");
	}
	
	
	/**
	 * 전체 리스트 출력
	 */
	public ArrayList<VetVO> getResultList(int start, int end) {
		List<VetVO> list = null;
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));

		list = sqlSession.selectList(namespace + ".tip_list", param);

		return (ArrayList<VetVO>) list;
	}
	/**
	 * 전체 리스트 출력(main)
	 */
	public ArrayList<VetVO> getResultListMain() {
		List<VetVO> list = null;
		
		list = sqlSession.selectList(namespace + ".tip_list_main");

		return (ArrayList<VetVO>) list;
	}
	/**
	 * 전체 리스트2 출력
	 */
	public ArrayList<VetVO> getResultList2(int start, int end) {
		List<VetVO> list = null;
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));

		list = sqlSession.selectList(namespace + ".ctip_list", param);

		return (ArrayList<VetVO>) list;
	}
	
	public VetVO getResultContent(String tip_id) {
		return sqlSession.selectOne(namespace + ".content",tip_id);
	}
	
	
	/** 4단계 : 고양이 전문가 팁 등록 **/
	public boolean getResultWrite(VetVO vo) {
		System.out.println(vo.getTip_content());
		boolean result = false;
		int ins_result = sqlSession.insert(namespace + ".write", vo);
		if(ins_result != 0) {
			result = true;
		}
		
		return result;
		
	}
	
	/** 4단계 : 강아지 전문가 팁 등록 **/
	public boolean getResultWrite2(VetVO vo) {
		System.out.println(vo.getTip_content());
		boolean result = false;
		int ins_result = sqlSession.insert(namespace + ".dogwrite", vo);
		if(ins_result != 0) {
			result = true;
		}
		
		return result;
		
	}
	
	/** 전문가 팁 수정 **/
	public boolean getResultUpdate(VetVO vo) {
		boolean result = false;
		int update_result = sqlSession.update(namespace+".update",vo);
		if(update_result != 0) {
			result = true;
		}
		
		return result;
	}
	
	/** 전문가 팁 수정 파일 없음 **/
	public boolean getResultUpdateNofile(VetVO vo) {
		boolean result = false;
		int update_result =sqlSession.update(namespace+".Nofileupdate",vo);
		if(update_result != 0) {
			result = true;
		}
		return result;
	}
	
	/** 전문가 팁 삭제 **/
	public boolean getResultDelete(String tip_id,HttpServletRequest request) {
		boolean result = false;
		String resultFile = "";
		VetDAO dao = new VetDAO();
		String tip_mainimgs=sqlSession.selectOne(namespace+".tip_mainimgs",tip_id);
		int del_result = sqlSession.delete(namespace + ".delete", tip_id);
		
		if(del_result != 0) {
			result = true;
		}
		if(result) {
			
			if(tip_mainimgs != null && tip_mainimgs != "") {
				//파일 생성 삭제
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "\\resources\\upload\\";
				String delete_path = root_path + attach_path + tip_mainimgs;
				File file = new File(delete_path);
				
				if(file.exists()) {
					file.delete();
				}
			}
		}
		return result;
	}
	
	/** 조회수 업데이트 **/
	public void getResultUpdateHits(String tip_id) {
		sqlSession.selectOne(namespace + ".hits_update",tip_id);
	}
	
	

}

















