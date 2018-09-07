package global.sesoc.www.dao;

import java.util.List;
<<<<<<< HEAD
=======
import java.util.Map;
>>>>>>> feature

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

<<<<<<< HEAD
import global.sesoc.www.dto.T_Grequest;
import global.sesoc.www.dto.T_GrequestUser;
=======
import global.sesoc.www.dto.T_GrequestUser;
import global.sesoc.www.dto.T_Grequest;
>>>>>>> feature

@Repository
public class T_GrequestRepository {
	@Autowired
	SqlSession session;
	public int insertGrequest(T_Grequest gRequest) {
		T_GrequestMapper mapper=session.getMapper(T_GrequestMapper.class);
		int result=mapper.insertGrequest(gRequest);
		return result;
	}
	
	public List<T_Grequest> selectGrequest(T_Grequest gRequest) {
		T_GrequestMapper mapper=session.getMapper(T_GrequestMapper.class);
		List<T_Grequest> list=mapper.selectGrequest(gRequest);
		return list;
	}
	public List<T_Grequest> groupAccept(String accepter){
		T_GrequestMapper mapper=session.getMapper(T_GrequestMapper.class);
		List<T_Grequest> list=mapper.groupAccept(accepter);
		return list;
	}
	public List<T_GrequestUser> selectGreqUsers(String userId){
		T_GrequestMapper mapper=session.getMapper(T_GrequestMapper.class);
		List<T_GrequestUser> list=mapper.selectGreqUsers(userId);
		return list;
	}
	public int applySuccess(int greqNum) {
		T_GrequestMapper mapper=session.getMapper(T_GrequestMapper.class);
		int result=mapper.applySuccess(greqNum);
		return result;
	}
	public T_Grequest selectGrequest2(T_Grequest gRequest) {
		T_GrequestMapper mapper=session.getMapper(T_GrequestMapper.class);
		T_Grequest g=mapper.selectGrequest2(gRequest);
		return g;
	}
	public int applyCancel(int greqNum) {
		T_GrequestMapper mapper=session.getMapper(T_GrequestMapper.class);
		int result=mapper.applyCancel(greqNum);
		return result;
	}
}
