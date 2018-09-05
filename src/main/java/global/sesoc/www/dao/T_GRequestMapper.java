package global.sesoc.www.dao;

import java.util.List;

import global.sesoc.www.dto.T_GRequest;

public interface T_GRequestMapper {
	public int insertGrequest(T_GRequest gRequest);
	public List<T_GRequest> selectGrequest(T_GRequest gRequest);
	public List<T_GRequest> groupAccept(String accepter);
}
