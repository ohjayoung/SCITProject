package global.sesoc.www.dao;

import global.sesoc.www.dto.T_User;

public interface T_UserMapper {

	// 회원 가입
	public int insert(T_User tuser);

	// 회원정보 수정
	public int update(T_User tuser);

	// 로그인,id 중복확인
	public T_User selectOne(T_User tuser);

	// 회원탈퇴
	public int delete(T_User tuser);

}
