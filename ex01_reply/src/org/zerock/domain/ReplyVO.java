package org.zerock.domain;

import java.util.Date;

public class ReplyVO {
	private int rno;
	private int bno;
	private String replytext;
	private String pelyer;
	private Date regdate;
	private Date updatedate;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getReplytext() {
		return replytext == null ? "" : replytext.trim();
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getPelyer() {
		return pelyer == null ? "" : pelyer.trim();
	}
	public void setPelyer(String pelyer) {
		this.pelyer = pelyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	
}
