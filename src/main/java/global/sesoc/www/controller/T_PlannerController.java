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

import global.sesoc.www.dao.T_PlannerRepository;
import global.sesoc.www.dao.T_PlistRepository;
import global.sesoc.www.dao.T_ScheduleRepository;
import global.sesoc.www.dto.T_Planner;
import global.sesoc.www.dto.T_Plist;

@Controller
public class T_PlannerController {
	@Autowired
	T_PlannerRepository T_PlannerRepository; 
	@Autowired
	T_PlistRepository T_PlistRepository; 
	@Autowired
	T_ScheduleRepository T_ScheduleRepository;
	
	@RequestMapping(value="/plannerList", method=RequestMethod.GET)
	public String plannerList(Model model, HttpSession session) {
		String userId=(String)session.getAttribute("loginId");
		List<T_Planner> plannerList=T_PlannerRepository.plannerList(userId);
		model.addAttribute("plannerList",plannerList);
		return "schedule/plannerList";
	}
	
	@RequestMapping(value="/insertPlanner", method=RequestMethod.GET)
	public String insertPlanner() {
		return "schedule/insertPlanner";
	}
	@RequestMapping(value="/insertPlanner", method=RequestMethod.POST)
	public String insertPlanner(T_Planner planner,HttpSession session){
		String userId=(String)session.getAttribute("loginId");
		
		int result=T_PlannerRepository.insertPlanner(planner);
		T_Planner planner1=T_PlannerRepository.selectOneplanner();
		T_Plist plist=new T_Plist();
		plist.setPlaNum(planner1.getPlaNum()); 	plist.setUserId(userId);//session의 userId;
		T_PlistRepository.insertPlist(plist);
		return "redirect:/plannerList";
	}
	@ResponseBody
	@RequestMapping(value="/deletePlanner", method=RequestMethod.POST)
	public int deletePlanner(@RequestBody T_Planner planner, Model model,HttpSession session) {
		String userId=(String)session.getAttribute("loginId");
	
		int result1=T_PlistRepository.deletePlanner_Plist(planner.getPlaNum());
		int result2=T_ScheduleRepository.deletePlanner_Schedule(planner.getPlaNum());
		int result=T_PlannerRepository.deletePlanner(planner.getPlaNum());

		
		return result;
	}
}
