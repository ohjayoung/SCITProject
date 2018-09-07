package global.sesoc.www.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.www.dto.GrequestUser;
import global.sesoc.www.dto.T_GRequest;

public interface T_GRequestMapper {
	public int insertGrequest(T_GRequest gRequest);
	public List<T_GRequest> selectGrequest(T_GRequest gRequest);
	public List<T_GRequest> groupAccept(String accepter);
	public List<GrequestUser> selectGreqUsers(String userId);
	public int applySuccess(int greqNum);
	public T_GRequest selectGrequest2(T_GRequest gRequest);
	public int applyCancel(int greqNum);
}
