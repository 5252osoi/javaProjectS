package com.spring.javaProjectS.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.javaProjectS.vo.MemberVO;

public interface MemberDAO {

	MemberVO getMemberIdCheck(@Param("mid") String mid);

	MemberVO getMemberNickCheck(@Param("nickName") String nickName);

	int setMemberJoinOk(@Param("vo") MemberVO vo);
	
}
