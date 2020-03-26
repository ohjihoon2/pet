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

import com.pettoday.vo.JoinVO;
import com.pettoday.vo.WalktogetherReplyVO;
import com.pettoday.vo.WalktogetherVO;

@Repository
public class WalktogetherDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace = "mapper.walktogether";

	public int execTotalCount(String category, String search) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("category", String.valueOf(category));
		param.put("search", String.valueOf(search));
		return sqlSession.selectOne(namespace + ".wal_count1", param);
	}
	
	public int execTotalCount() {
		return sqlSession.selectOne(namespace + ".wal_count2");
	}

	/**
	 * ��ü ����Ʈ ���
	 */
	public ArrayList<WalktogetherVO> getResultList(int start, int end) {
		List<WalktogetherVO> list = null;
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));

		list = sqlSession.selectList(namespace + ".wal_list", param);

		return (ArrayList<WalktogetherVO>) list;
	}

	/**
	 * ��ü ����Ʈ ���(ī�װ���)
	 */
	public ArrayList<WalktogetherVO> getResultList(int start, int end, String category, String search) {
		List<WalktogetherVO> list = null;
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("category", category);
		param.put("search",search);

		list = sqlSession.selectList(namespace + ".wal_list_category", param);
		return (ArrayList<WalktogetherVO>) list;
	}
	
	/**
	 * ģ���� ��å �ۼ�
	 */
	public boolean getResultWrite(WalktogetherVO vo) {
		boolean result = false;
		int ins_result = sqlSession.insert(namespace + ".wal_write", vo);
		if (ins_result != 0) {
			result = true;
		}
		return result;
	}
	
	/**
	 * ģ���� ��å ��� �ۼ�
	 */
	public boolean getResultReplyContent(WalktogetherReplyVO vo) {
		boolean result = false;
		int ins_result = sqlSession.insert(namespace + ".wal_reply_write", vo);
		if (ins_result != 0) {
			result = true;
		}
		return result;
	}
	
	/**
	 * ģ���� ��å ��
	 */
	public WalktogetherVO getResultContent(String wal_no) {
		return sqlSession.selectOne(namespace + ".wal_content", wal_no);
	}
	
	/**
	 * ģ���� ��å ���
	 */
	public ArrayList<WalktogetherReplyVO> getResultReplyList(String wal_no) {
		List<WalktogetherReplyVO> list = null;
		list = sqlSession.selectList(namespace+".wal_reply_list",wal_no);
		return (ArrayList<WalktogetherReplyVO>)list;
	}
	
	/**
	 *ģ���� ��å ��ȸ��
	 */
	public void getResultUpdatehits(String wal_no) {
		sqlSession.update(namespace + ".hits_update", wal_no);
	}
	
	/**
	 * ģ���� ��å ����
	 */
	public boolean getResultDelete(String wal_no, HttpServletRequest request) {
		boolean result = false;
		String wal_sfile = sqlSession.selectOne(namespace + ".del_wal_sfile", wal_no);// �̰� ���� ���;���
		int del_result = sqlSession.delete(namespace + ".wal_delete", wal_no);

		if (del_result != 0) {
			result = true;
		}

		if (result) {

			if (wal_sfile != null && wal_sfile != "") {
				// ���� ���� ����
				String root_path = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "\\resources\\upload\\";
				String delete_path = root_path + attach_path + wal_sfile;
				File file = new File(delete_path);

				if (file.exists()) {
					file.delete();
				}
			}
		}
		return result;
	}
	
	/**
	 * ģ���� ��å ����
	 */
	public boolean getResultUpdate(WalktogetherVO vo) {
		boolean result = false;
		int up_result = sqlSession.update(namespace + ".wal_update", vo);
		if (up_result != 0) {
			result = true;
		}
		return result;
	}
	
	public int getReplyDelete(String wal_reply_no) {
		return sqlSession.delete(namespace+".wal_reply_delete", wal_reply_no);
	}
}
