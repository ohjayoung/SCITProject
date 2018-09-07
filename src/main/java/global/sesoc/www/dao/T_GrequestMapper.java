package global.sesoc.www.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.www.dto.T_GrequestUser;
import global.sesoc.www.dto.T_Grequest;

public interface T_GrequestMapper {
	public int insertGrequest(T_Grequest gRequest);
	public List<T_Grequest> selectGrequest(T_Grequest gRequest);
	public List<T_Grequest> groupAccept(String accepter);
	public List<T_GrequestUser> selectGreqUsers(String userId);
	public int applySuccess(int greqNum);
	public T_Grequest selectGrequest2(T_Grequest gRequest);
	public int applyCancel(int greqNum);
}
