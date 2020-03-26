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


import com.pettoday.vo.NoticeVO;  

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.notice";
	
	
	public int execTotalCount() {
		return sqlSession.selectOne(namespace + ".notice_count");
	}
	public int execSearchCount(String search) {
		return sqlSession.selectOne(namespace + ".notice_search_count",search);
	}
	
	
	/**
	 * 전체 리스트 출력
	 */
	public ArrayList<NoticeVO> getResultList(int start, int end) {
		List<NoticeVO> list = null;
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));

		list = sqlSession.selectList(namespace + ".notice_list", param);

		return (ArrayList<NoticeVO>) list;
	}
	/**
	 * 검색리스트 출력
	 */
	public ArrayList<NoticeVO> getResultList(int start, int end,String search) {
		List<NoticeVO> list = null;
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("search", search);

		list = sqlSession.selectList(namespace + ".notice_search_list", param);

		return (ArrayList<NoticeVO>) list;
	}
	/**
	 * 전체 리스트 출력(5개)
	 */
	public ArrayList<NoticeVO> getMainResultList() {
		List<NoticeVO> list = null;
	

		list = sqlSession.selectList(namespace + ".main_notice_list");

		return (ArrayList<NoticeVO>) list;
	}
	
	/** 4단계 : 공지사항  등록 **/
	public boolean getResultWrite(NoticeVO vo) {
		
		boolean result = false;
		int ins_result = sqlSession.insert(namespace + ".write", vo);
		if(ins_result != 0) {
			result = true;
		}
		
		return result;
		
	}
	/** 4단계 : 공지사항 상세정보 **/
	public NoticeVO getResultContent(String not_no) {
		return sqlSession.selectOne(namespace + ".content",not_no);
	}
	
	
	
	/** 공지사항 수정 파일 없음 **/
	public boolean getResultUpdate(NoticeVO vo) {
		boolean result = false;
		int update_result =sqlSession.update(namespace+".Nofileupdate",vo);
		if(update_result != 0) {
			result = true;
		}
		return result;
	}
	
	/** 공지사항 삭제 **/
	public boolean getResultDelete(String not_no) {
		boolean result = false;
		int del_result = sqlSession.delete(namespace + ".delete", not_no);
		
		if(del_result != 0) {
			result = true;
		}
		
		return result;
	}
	
	/** 조회수 업데이트 **/
	public void getResultUpdateHits(String not_no) {
		sqlSession.selectOne(namespace + ".hits_update",not_no);
	}
	
	
}



















