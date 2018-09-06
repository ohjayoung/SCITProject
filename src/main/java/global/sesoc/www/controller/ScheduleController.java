package global.sesoc.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.www.dao.T_ScheduleRepository;
import global.sesoc.www.dto.T_Schedule;
import global.sesoc.www.dto.T_User;

@Controller
public class ScheduleController {
	@Autowired
	T_ScheduleRepository T_ScheduleRepository; 
	
	@RequestMapping(value="/scheduleList", method=RequestMethod.GET)
	public String scheduleList(Model model,T_Schedule schedule) {
		
		List<T_Schedule> list=T_ScheduleRepository.selectPlannerSchedule(schedule.getPlaNum()); //userId를 session의 loginId로
		model.addAttribute("plaNum",schedule.getPlaNum());
		model.addAttribute("schdulelist",list);
		return "schedule/scheduleList";		
	}
	@ResponseBody
	@RequestMapping(value="/selectContent", method=RequestMethod.POST)
	public T_Schedule selectContent(@RequestBody T_Schedule s) {

		T_Schedule schedule=T_ScheduleRepository.selectOneUserSchedule(s);
		return schedule;
	}
	@RequestMapping(value="/scheduleDetail" , method=RequestMethod.GET)
	public String scheduleDetail(T_Schedule schedule,Model model) {
		T_Schedule s=T_ScheduleRepository.selectOneUserSchedule(schedule);
		model.addAttribute("schedule",s);
		return "schedule/scheduleDetail";
	}
	
	//schedule insert
	@RequestMapping(value="/insertSchedule", method=RequestMethod.GET)
	public String insertSchedule(Model model,T_Schedule s) {	//화면요청
		model.addAttribute("plaNum",s.getPlaNum());
		return "schedule/insertSchedule";
	}
	@RequestMapping(value="/insertSchedule", method=RequestMethod.POST)
	public String insertSchedule(T_Schedule s,Model model) {	//schedule insert -- db
		int result= T_ScheduleRepository.insertSchedule(s);
		List<T_Schedule> list=T_ScheduleRepository.selectPlannerSchedule(s.getPlaNum());
		model.addAttribute("plaNum",s.getPlaNum());
		model.addAttribute("schdulelist",list);
		return "redirect:/scheduleList";
	}
	
	
	//schedule update
	@RequestMapping(value="/scheduleUpdate" , method=RequestMethod.GET)
	public String scheduleUpdate(T_Schedule schedule,Model model) { 	//화면 요청
		T_Schedule s=T_ScheduleRepository.selectOneUserSchedule(schedule);
		model.addAttribute("schedule",s);
		return "schedule/scheduleUpdate";
	}
	@RequestMapping(value="/scheduleUpdate" , method=RequestMethod.POST)
	public String scheduleUpdate(Model model,T_Schedule schedule) {		//schedule update -- db
			
		int result=T_ScheduleRepository.updateSchedule(schedule);
		
		List<T_Schedule> list=T_ScheduleRepository.selectPlannerSchedule(schedule.getPlaNum()); //userId를 session의 loginId로
		model.addAttribute("plaNum",schedule.getPlaNum());
		model.addAttribute("schdulelist",list);
		return "redirect:/scheduleList";
	}
	@ResponseBody
	@RequestMapping(value="/selectUserAllSchedule" , method=RequestMethod.POST)
	public List<T_Schedule> selectUserAllSchedule(HttpSession session){
	
		List<T_Schedule> schduleList=T_ScheduleRepository.selectUserAllSchedule("aaa");
		return schduleList;
		
	}
	@ResponseBody
	@RequestMapping(value="/selectFriendAllSchedule" , method=RequestMethod.POST)
	public List<T_Schedule> selectFriendAllSchedule(@RequestBody T_User user){
		
		List<T_Schedule> schduleList=T_ScheduleRepository.selectUserAllSchedule(user.getUserId());
		return schduleList;
	}
	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public String Calendar(Model model) {
		List<T_Schedule> list=T_ScheduleRepository.selectUserAllSchedule("aaa");
		model.addAttribute("schedule",list);
		return "schedule/calendar";
	}
	@ResponseBody
	@RequestMapping(value="/deleteSchedule", method=RequestMethod.POST)
	public String deleteSchedule(@RequestBody T_Schedule schedule) {
		int result=T_ScheduleRepository.deleteSchedule(schedule.getSchNum());
		return "삭제했습니다.";
	}
	@ResponseBody
	@RequestMapping(value="/selectMixSchedule", method=RequestMethod.POST)
	public List<T_Schedule> selectMixSchedule(@RequestBody String friendId){
		friendId="osh";//친구 id

		List<T_Schedule> list=T_ScheduleRepository.selectMixSchedule("aaa", friendId);
		return list;
		
	}
}


