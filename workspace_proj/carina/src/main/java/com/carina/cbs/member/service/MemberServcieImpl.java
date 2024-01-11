package com.carina.cbs.member.service;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.carina.cbs.member.dao.IMemberDAO;
import com.carina.cbs.member.vo.MemberVO;

import javassist.bytecode.DuplicateMemberException;



@Service
public class MemberServcieImpl implements MemberService{
	@Autowired
	IMemberDAO dao;
	
	 public void registMember(MemberVO member) throws Exception {
	        try {
	            int result = dao.registMember(member);
	            if (result == 0) {
	                throw new Exception("회원 가입 중에 문제 발생: 데이터베이스에 삽입된 행이 없습니다.");
	            }
	        } catch (Exception e) {
	            // 발생한 예외에 대한 로그를 출력
	            e.printStackTrace();
	            // 다시 예외를 던짐
	            throw e;
	        }
	        
	    }
	 @Override
	 @Transactional
	    public void insertKakaoMember(MemberVO kakaoMember) throws Exception {
		    // 기본 비밀번호 설정 등의 로직

		    // 중복 확인
		    if (isDuplicated(kakaoMember.getMemId())) {
//		        throw new DuplicateMemberException("이미 가입된 회원입니다.");
		    	System.out.println("이미 가입된 회원입니다.");
		    }else {
		    	// 데이터베이스에 저장
		    	memberDAO.insertKakaoMember(kakaoMember);
		    }
		}

		// 아이디 중복 확인 메서드
		private boolean isDuplicated(String memId) {
		    return memberDAO.getMemberById(memId) != null;
		}

	public MemberVO loginMember(MemberVO member) {
		MemberVO result = dao.loginMember(member);
		if (result == null ) {
			return null;
		}		
		return result;
		}
	
	@Autowired
    private IMemberDAO memberDAO;
	
	@Override
	public void updateProfile(MemberVO memberVO) {
		memberDAO.updateProfile(memberVO);
		
	}
	@Override
    public MemberVO getMemberById(String memId) {
        return dao.getMemberById(memId);
    }

    


	
	
	
}