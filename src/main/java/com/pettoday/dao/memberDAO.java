package com.pettoday.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pettoday.vo.JoinVO;
import com.pettoday.vo.LoginVO;
import com.pettoday.vo.SessionVO;

@Repository
public class memberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace = "mapper.member";
	
	public int getResultIdCheck(String mem_id) {
		return sqlSession.selectOne(namespace+".idcheck", mem_id);
	}
	
	/** 회원 가입 **/
	public int getResultJoin(JoinVO vo) {
		return sqlSession.insert(namespace + ".join", vo);
	}
	
	public SessionVO getResultLogin(LoginVO vo) {
		SessionVO svo = new SessionVO();
		return sqlSession.selectOne(namespace + ".login", vo);
	}
	
	public String getPw(JoinVO vo) {
		return sqlSession.selectOne(namespace+".login_Pw", vo);
	}
	
	public String getId(JoinVO vo) {
		return sqlSession.selectOne(namespace+".login_Id", vo);
	}
	
	/**
	 * 회원 삭제
	 */
	public boolean getDeleteMember(String mem_id) {
		boolean result = false;
		int del_result = sqlSession.delete(namespace + ".del_mem", mem_id);
		if (del_result != 0) {
			result = true;
		}
		return result;
	}
	
	public ArrayList<JoinVO> getAdminMemList() {
		List<JoinVO> list = null;
		list = sqlSession.selectList(namespace+".mem_list");
		return (ArrayList<JoinVO>)list;
	}
}
