package com.pettoday.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pettoday.vo.AnswerVO;
import com.pettoday.vo.WonderAnswerReplyVO;
import com.pettoday.vo.WonderReplyVO;
import com.pettoday.vo.WonderVO;

@Repository
public class CommunityDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="mapper.community";
	
	
	public String NearHospital(String mem_id) {
		
		String place ="";
		place = sqlSession.selectOne(namespace+".nearHospital", mem_id);
		System.out.println("place= " +place);
		return place;
	}
	
	/**
	 * wonder list - paging
	 * @param start
	 * @param end
	 * @return
	 */
	public ArrayList<WonderVO> wonderList(int start, int end) {
		List list = null;
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		list = sqlSession.selectList(namespace+".wonderList", param);
		return (ArrayList<WonderVO>) list;
	}
	
	/**
	 * search 
	 * @param start
	 * @param end
	 * @param search
	 * @return
	 */
	public ArrayList<WonderVO> wonderList(int start, int end, String search, String sort) {
		List list = null;
		System.out.println("dao입니다.");
		
		
		Map param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("search", search);
		param.put("sort", sort);
		
		
		
		System.out.println("end = "+param.get("end"));
		
		list = sqlSession.selectList(namespace+".wonderSearchList", param);
		return (ArrayList<WonderVO>) list;
	}
	
	/**
	 * wonder-list count 
	 * @return
	 */
	public int execTotalCount(){
		return sqlSession.selectOne(namespace+".wcount");
	}
	
	/**
	 * wonder 검색 count
	 * @param search
	 * @param sort
	 * @return
	 */
	public int execSearchCount(String search, String sort){
		Map<String, String> param = new HashMap<String, String>();
		param.put("search", search);
		param.put("sort", sort);
		
		return sqlSession.selectOne(namespace+".wSearchcount", param);
	}
	
	/**
	 * wonder-write
	 * @param vo
	 * @return
	 */
	public int wonderWrite(WonderVO vo) {
		return sqlSession.insert(namespace+".wonderWrite", vo);
	}
	
	/**
	 * wonderContent view
	 * @param wonder_no
	 * @return
	 */
	public WonderVO WonderContent(String wonder_no) {
		return sqlSession.selectOne(namespace+".wonderContent", wonder_no);
	}
	
	/**
	 * wonderView update
	 * @param wonder_no
	 * @return
	 */
	public int WonderViewUpdate(String wonder_no) {
		return sqlSession.update(namespace+".wonderViewUpdate", wonder_no);
	}
	
	
	/**
	 * 답변 내용 리스트
	 * @param wonder_no
	 * @return
	 */
	public ArrayList<AnswerVO> AnswerContentList(String wonder_no) {
		
		List list = sqlSession.selectList(namespace+".answerList", wonder_no);
		return (ArrayList<AnswerVO>) list;
	}
	
	/**
	 * 답변 추가
	 * @param vo
	 * @return
	 */
	public int AnswerInsert(AnswerVO vo) {

		return sqlSession.insert(namespace+".answerInsert", vo);
	}
	
	/**
	 * 답변 댓글 개수
	 * @param wonder_no
	 * @return
	 */
	public int AnswerReplyCount(String wonder_no) {
		return sqlSession.selectOne(namespace+".answerReplyCount", wonder_no);
	}
	/**
	 * 답변 댓글 리스트
	 * @param wonder_answer_no
	 * @return
	 */
	public ArrayList<WonderAnswerReplyVO> AnswerReplyList(String wonder_answer_no) {
		List<WonderAnswerReplyVO> list = null;
		list = sqlSession.selectList(namespace+".answerReplyList", wonder_answer_no);
		return (ArrayList<WonderAnswerReplyVO>) list;
	}
	/**
	 * 답변 댓글 추가
	 * @param vo
	 * @return
	 */
	public int AnswerReplyInsert(WonderAnswerReplyVO vo) {
		return sqlSession.insert(namespace+".answerReplyInsert", vo);
	}
	
	/**
	 * 질문 댓글 개수
	 * @param wonder_no
	 * @return
	 */
	public int WonderReplyCount(String wonder_no) {
		return sqlSession.selectOne(namespace+".wonderReplyCount", wonder_no);
	}
	
	/**
	 * 질문 댓글 리스트 
	 * @param wonder_no
	 * @return
	 */
	public ArrayList<WonderReplyVO> WonderReplyList(String wonder_no) {
		List<WonderReplyVO> list = null;
		list = sqlSession.selectList(namespace+".wonderReplyList", wonder_no);
		return (ArrayList<WonderReplyVO>) list;
	}
	/**
	 * 질문 댓글 추가
	 * @param vo
	 * @return
	 */
	public int WonderReplyInsert(WonderReplyVO vo) {
		return sqlSession.insert(namespace+".wonderReplyInsert", vo);
	}
	
	public int WonderReplyDelete(String wonder_reply_no) {
		return sqlSession.delete(namespace+".wonderReplyDelete", wonder_reply_no);
	}
	
	public int AnswerReplyDelete(String wonder_answer_reply_no) {
		return sqlSession.delete(namespace+".answerReplyDelete", wonder_answer_reply_no);
	}
	
	public int WonderDelete(String wonder_no) {
		return sqlSession.delete(namespace+".wonderDelete", wonder_no);
	}
	
	public int WonderAnswerDelete(String wonder_answer_no) {
		return sqlSession.delete(namespace+".wonderAnswerDelete", wonder_answer_no);
	}
	
	public AnswerVO AnswerContent(String wonder_no, String wonder_answer_no) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("wonder_no", wonder_no);
		param.put("wonder_answer_no", wonder_answer_no);
		
		return sqlSession.selectOne(namespace+".answerContent", param);
	}
	
	public int AnswerUpdate(String wonder_answer_title, String wonder_answer_content, String wonder_answer_no) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("wonder_answer_title", wonder_answer_title);
		param.put("wonder_answer_content", wonder_answer_content);
		param.put("wonder_answer_no", wonder_answer_no);
		
		return sqlSession.update(namespace+".answerUpdate", param);
	}
	
	public int WonderUpdate(String wonder_title, String wonder_content, String wonder_no) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("wonder_title", wonder_title);
		param.put("wonder_content", wonder_content);
		param.put("wonder_no", wonder_no);
		
		return sqlSession.update(namespace+".wonderUpdate", param);
	}

	public int selectAnswerCount(int wonder_answer_no) {
		return sqlSession.selectOne(namespace+".selectAnswerCount", wonder_answer_no);
	}
	
	
	public boolean getResultDelete(String wonder_no) {
		boolean result = false; 
		int resultInt = sqlSession.delete(namespace+".getResultDelete", wonder_no);
		
		if(resultInt != 0) {
			result = true;
		}
		return result;
	}
	
}

