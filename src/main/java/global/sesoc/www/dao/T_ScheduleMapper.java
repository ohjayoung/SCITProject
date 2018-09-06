package global.sesoc.www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import global.sesoc.www.dto.T_Schedule;

public interface T_ScheduleMapper {
	public List<T_Schedule> selectCategory(HashMap<String, String> map);

	public List<T_Schedule> select(Map<String, Object> map);

	public String selectCount(HashMap<String, String> map);
	
	public String selectCountUnChecked(HashMap<String, String> map);
}
