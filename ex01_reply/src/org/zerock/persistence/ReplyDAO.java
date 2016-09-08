package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.domain.ReplyVO;
@Repository
public interface ReplyDAO {
	public List<ReplyVO> list(HashMap<String, Object> hm) throws Exception;
	public void create(ReplyVO vo) throws Exception;
	public void update(ReplyVO vo) throws Exception;
	public void delete(Integer rno) throws Exception;
	public int count(int bno) throws Exception;
}
