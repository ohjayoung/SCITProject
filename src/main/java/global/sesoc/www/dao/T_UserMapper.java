package global.sesoc.www.dao;

import global.sesoc.www.dto.T_User;

public interface T_UserMapper {

	// 회원 가입
	public int insert(T_User user);

	// 로그인,id 중복확인
	public T_User selectOne(T_User user);

	// 프로필 수정
	public int userUpdate(T_User user);
	
	// 회원탈퇴
	public int userDelete(String userId);

}
