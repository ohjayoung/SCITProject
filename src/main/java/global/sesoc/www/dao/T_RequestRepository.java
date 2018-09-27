package global.sesoc.www.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.www.dto.T_Request;

@Repository
public class T_RequestRepository {
	@Autowired
	SqlSession session;
	
	public int calendarShare(T_Request request) {
		T_RequestMapper mapper=session.getMapper(T_RequestMapper.class);
		int result=mapper.calendarShare(request);
		return result;
	}
	
	public List<T_Request> checkShare(T_Request requester){
		T_RequestMapper mapper=session.getMapper(T_RequestMapper.class);
		List<T_Request> list=mapper.checkShare(requester);
		return list;
	}
}
