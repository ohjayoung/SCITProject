package global.sesoc.www.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.www.dto.T_Schedule;

@Repository
public class T_ScheduleRepository {
	@Autowired
	SqlSession session;
	
	public List<T_Schedule> selectCategory(HashMap<String, String> map) {
		T_ScheduleMapper mapper = session.getMapper(T_ScheduleMapper.class);
		List<T_Schedule> t = mapper.selectCategory(map);
		return t;
	}
	public List<T_Schedule> select(String userId, String checked) {
		T_ScheduleMapper mapper = session.getMapper(T_ScheduleMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("checked", checked);
		List<T_Schedule> ts = mapper.select(map);
		return ts;
	}
	public String selectCount(HashMap<String, String> map) {
		T_ScheduleMapper mapper = session.getMapper(T_ScheduleMapper.class);
		String t_count = mapper.selectCount(map);
		return t_count;
	}
	public String selectCountUnChecked(HashMap<String, String> map) {
		T_ScheduleMapper mapper = session.getMapper(T_ScheduleMapper.class);
		String t_count = mapper.selectCountUnChecked(map);
		return t_count;
	}

}
