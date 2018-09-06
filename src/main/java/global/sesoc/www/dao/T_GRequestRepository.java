package global.sesoc.www.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.www.dto.T_GRequest;

@Repository
public class T_GRequestRepository {
	@Autowired
	SqlSession session;
	public int insertGrequest(T_GRequest gRequest) {
		T_GRequestMapper mapper=session.getMapper(T_GRequestMapper.class);
		int result=mapper.insertGrequest(gRequest);
		return result;
	}
	
	public List<T_GRequest> selectGrequest(T_GRequest gRequest) {
		T_GRequestMapper mapper=session.getMapper(T_GRequestMapper.class);
		List<T_GRequest> list=mapper.selectGrequest(gRequest);
		return list;
	}
	public List<T_GRequest> groupAccept(String accepter){
		T_GRequestMapper mapper=session.getMapper(T_GRequestMapper.class);
		List<T_GRequest> list=mapper.groupAccept(accepter);
		return list;
	}
}
