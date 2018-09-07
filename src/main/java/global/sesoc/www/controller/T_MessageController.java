package global.sesoc.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.www.dao.T_MessageRepository;

@Controller
public class T_MessageController {

	@Autowired
	T_MessageRepository repository;
	
	@RequestMapping(value = "/messageList", method = RequestMethod.GET)
	public String messageList() {
		return "messenger/messageList";
	}
	
}
