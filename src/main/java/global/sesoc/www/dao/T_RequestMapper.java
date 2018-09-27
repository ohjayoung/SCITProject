package global.sesoc.www.dao;

import java.util.List;

import global.sesoc.www.dto.T_Request;

public interface T_RequestMapper {
	public int calendarShare(T_Request request);
	
	public List<T_Request> checkShare(T_Request requester);
}
