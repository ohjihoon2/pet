package com.pettoday.dao;

import org.mybatis.spring.SqlSessionTemplate; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pettoday.vo.PurchasesVO;

@Repository
public class CusDAO {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="mapper.cus";
	
	/**************** 주문제작 가격 불러오기 *********************/
	public String cus_price(String produce) {
		return sqlSession.selectOne(namespace+".cusprice",produce);
	}

	
	
	
	public boolean getResultWrite(PurchasesVO vo) {
		boolean result = false;
		int write_result =sqlSession.insert(namespace + ".write", vo);
		if(write_result != 0) {
			result = true;
		}
		return result;
	}
	

}
