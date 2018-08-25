package global.sesoc.www;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.www.dao.T_UserRepository;
import global.sesoc.www.dto.T_User;

@Controller
public class T_UserController {
	@Autowired
	T_UserRepository repository;
	@Autowired
	SqlSession sqlSession;
	//로그인
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String login(T_User user, HttpSession session, Model model) {
    	T_User t = repository.selectOne(user);
    	if(t != null) {
    		session.setAttribute("loginId", t.getUserId());
    		session.setAttribute("loginName", t.getUserName());
    		return "user/main";
    	}else {
    		model.addAttribute("islogined", "1");
    		return "index";
    	}
    }
    //내프로필 화면 요청
    @RequestMapping(value="/userDetail", method=RequestMethod.GET)
    public String userDetail(HttpSession session, Model model) {
    	String userId = (String) session.getAttribute("loginId");
    	T_User user = new T_User();
    	user.setUserId(userId);
    	    	
    	T_User t = repository.selectOne(user);
    	
    	String p1 = t.getPhone();
    	String[] p2 = p1.split(",");
    	String phone1 = p2[0];
    	String phone2 = p2[1];
    	model.addAttribute("phone1",phone1);
    	model.addAttribute("phone2",phone2);
    	model.addAttribute("user", t);
    	return "user/userDetail";
    }
    //회원 정보 수정 처리
    @ResponseBody
  	@RequestMapping(value="/userUpdate", method=RequestMethod.POST)
  	public int userUpdate(@RequestBody T_User user) {
  		int result = repository.userUpdate(user);
  		return result;
  	}
}
