package global.sesoc.www.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.www.dao.T_RequestRepository;
import global.sesoc.www.dto.T_Request;

@Controller
public class T_RequestController {
	@Autowired
	T_RequestRepository T_RequestRepository;
	
	@ResponseBody
	@RequestMapping(value="/calendarShare", method=RequestMethod.POST)
	public int calendarShare(@RequestBody T_Request request, HttpSession session) {
		String userId=(String)session.getAttribute("loginId");
		request.setRequester(userId);
		
		T_Request checkReq=new T_Request(); checkReq.setReqAccepter(userId);
		checkReq.setRequester(request.getReqAccepter());
		List<T_Request>list2=T_RequestRepository.checkShare(request);
		List<T_Request>list=T_RequestRepository.checkShare(checkReq);
		
		if(list != null || list2 !=null) {
			return 0;
		}
		
		
		int result=T_RequestRepository.calendarShare(request);
		return result; 
	}
}
