package global.sesoc.www.dao;

import java.util.List;
import java.util.Map;

import global.sesoc.www.dto.T_Schedule;

public interface T_ScheduleMapper {
	public int insertSchedule(T_Schedule schedule);
	public List<T_Schedule> selectUserSchedule(String userId);
	public T_Schedule selectOneUserSchedule(T_Schedule schedule);
	public List<T_Schedule>  selectPlannerSchedule(int plaNum);
	public int updateSchedule(T_Schedule schedule);
	public int deletePlanner_Schedule(int plaNum);
	public int deleteSchedule(int schNum);
	public List<T_Schedule> selectUserAllSchedule(String userId);
	public List<T_Schedule> selectUserPlannerSchedule(T_Schedule schedule);
	public List<T_Schedule> selectMixSchedule(Map<String,String> map);
}
