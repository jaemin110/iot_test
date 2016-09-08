package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.ReplyVO;
@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	private SqlSession session;
	
	@Override
	public List<ReplyVO> list(HashMap<String, Object> hm) throws Exception {
		return session.selectList("replyList", hm);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		session.insert("insertRe",vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		session.update("updateRe",vo);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		session.delete("deleteRe",rno);
	}

	@Override
	public int count(int bno) throws Exception {
		return session.selectOne("reCount",bno);
	}

}
