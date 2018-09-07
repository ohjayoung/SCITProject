package global.sesoc.www.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.www.dto.GrequestUser;
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
	public List<GrequestUser> selectGreqUsers(String userId){
		T_GRequestMapper mapper=session.getMapper(T_GRequestMapper.class);
		List<GrequestUser> list=mapper.selectGreqUsers(userId);
		return list;
	}
	public int applySuccess(int greqNum) {
		T_GRequestMapper mapper=session.getMapper(T_GRequestMapper.class);
		int result=mapper.applySuccess(greqNum);
		return result;
	}
	public T_GRequest selectGrequest2(T_GRequest gRequest) {
		T_GRequestMapper mapper=session.getMapper(T_GRequestMapper.class);
		T_GRequest g=mapper.selectGrequest2(gRequest);
		return g;
	}
	public int applyCancel(int greqNum) {
		T_GRequestMapper mapper=session.getMapper(T_GRequestMapper.class);
		int result=mapper.applyCancel(greqNum);
		return result;
	}
}
