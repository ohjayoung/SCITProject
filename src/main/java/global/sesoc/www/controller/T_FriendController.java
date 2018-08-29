package global.sesoc.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.www.dao.T_FriendRepository;

@Controller
public class T_FriendController {
	
	@Autowired
	T_FriendRepository repository;
	
	@RequestMapping(value = "/friendList", method = RequestMethod.GET)
	public String friendList() {
		return "friend/friendList";
	}
}
