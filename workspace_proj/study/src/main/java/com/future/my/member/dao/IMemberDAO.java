package com.future.my.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.future.my.board.vo.BoardVO;
import com.future.my.member.vo.MemberVO;

@Mapper
public interface IMemberDAO {
	public int registMember(MemberVO member);
	public MemberVO loginMember(MemberVO member);
	public int updateMember(MemberVO member);
	public int deleteMember(MemberVO member);
	
	public int profileUpload(MemberVO member);
	
	
}
