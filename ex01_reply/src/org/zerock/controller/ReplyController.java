package org.zerock.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

@Controller
@RequestMapping("board/*")
public class ReplyController {

	@Inject
	private ReplyService service;
	
	@RequestMapping(value="/addreply", method=RequestMethod.GET)
	public String addReply(ReplyVO vo) throws Exception{
		service.addReply(vo);
		return "redirect:/board/listReply?bno="+vo.getBno();
	}
	
	@RequestMapping(value="/listReply", method=RequestMethod.GET)
	public String listReply(Model model, int bno, Criteria cri) throws Exception{
		cri.setPerPageNum(15);
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("bno", bno);
		hm.put("cri", cri);
		List<ReplyVO> list = service.listReply(hm);
		int count = service.count(bno);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(count);
		model.addAttribute("bno",bno);
		model.addAttribute("pm",pm);
		model.addAttribute("re",list);
		return "/board/replyList";
	}
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String deleteReply(int rno,int bno) throws Exception{
		service.deleteReply(rno);
		return "redirect:/board/listReply?bno="+bno;
	}
}
