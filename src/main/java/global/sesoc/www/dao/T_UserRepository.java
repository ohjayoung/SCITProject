package global.sesoc.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.www.dto.T_User;

@Repository
public class T_UserRepository {
	
	@Autowired
	SqlSession session;
	
	//로그인, 아이디체크
	public T_User selectOne(T_User user) {
		T_UserMapper mapper = session.getMapper(T_UserMapper.class);
		T_User t = mapper.selectOne(user);
		return t;
	}
	//회원가입
	public int signUp(T_User user) {
		T_UserMapper mapper = session.getMapper(T_UserMapper.class);
		System.out.println(user);
		int result = mapper.insert(user);
		
		return result;
	}
	//프로필 수정
	public int userUpdate(T_User user) {
		T_UserMapper mapper = session.getMapper(T_UserMapper.class);
		int t = mapper.userUpdate(user);
		return t;
	}
}
