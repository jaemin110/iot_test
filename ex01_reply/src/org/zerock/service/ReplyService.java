package org.zerock.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.ReplyDAO;
@Service
public class ReplyService {
	
	@Inject
	private ReplyDAO dao;
	
	public void addReply(ReplyVO vo) throws Exception{
		dao.create(vo);
	}
	public List<ReplyVO> listReply(HashMap<String, Object> hm) throws Exception{
		return dao.list(hm);
	}
	public void modifyReply(ReplyVO vo) throws Exception{
		dao.update(vo);
	}
	public void deleteReply(int rno) throws Exception{
		dao.delete(rno);
	}
	
	public int count(int bno) throws Exception{
		return dao.count(bno);
	}
}
