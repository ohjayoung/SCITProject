package global.sesoc.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.www.dao.T_UserRepository;
import global.sesoc.www.dto.T_User;
import global.sesoc.www.util.FileService;

@Controller
public class T_UserController {
	@Autowired
	T_UserRepository repository;

	final String uploadPath = "/workspace/uploadPath";

	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp() {
		return "user/signUp";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(T_User user, HttpSession session, Model model) {

		T_User t = repository.selectOne(user);
		if (t != null) {
			session.setAttribute("loginId", t.getUserId());
			session.setAttribute("loginName", t.getUserId());
		} else {
			model.addAttribute("islogined", "1");
			return "index";
		}
		return "main";
	}

	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String signUp(T_User user, Model model, MultipartFile upload) {

		System.out.println("업로드여부 : " + upload + ", 파일의 크기" + upload.getSize() + ", 파일이 비었는지 여부 : " + upload.isEmpty());

		String savedImage = null;
		String originalImage = null;
		if (!upload.isEmpty()) {
			savedImage = FileService.saveFile(upload, uploadPath);
			originalImage = upload.getOriginalFilename();
		}
		user.setOriginalImage(originalImage);
		user.setSavedImage(savedImage);
		System.out.println("저장 이름 : " + savedImage);
		System.out.println("업로드시 이름: " + originalImage);

		System.out.println("처리 전 모습 : " + user);

		int result = repository.signUp(user);
		System.out.println(user + "확인");

		if (result != 1) {			// 무조건 message가 나오게 변경
			model.addAttribute("message", "회원가입이 실패하였습니다. 다시 회원가입을 해주세요.");
		} else {
			model.addAttribute("message", "회원가입이 성공하였습니다.");
		}
		return "message";
	}

	@RequestMapping(value = "duplicateCheck", method = RequestMethod.POST)
	public @ResponseBody int duplicateCheck(String userId) {
		T_User user = new T_User();
		user.setUserId(userId);
		System.out.println(user);

		if (userId.length() < 3) {
			return 3;
		}
		if (repository.selectOne(user) != null) {
			return 1;
		} else {
			return 0;
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}
	
	@RequestMapping(value = "/userDelete", method = RequestMethod.GET)
	public String userDelete() {
		return "user/userDelete";
	}
	
	@ResponseBody
	@RequestMapping(value = "/pwdCheck", method = RequestMethod.POST)
	public T_User pwdCheck(@RequestBody T_User user, HttpSession session) {
		String userId = (String) session.getAttribute("loginId");
		user.setUserId(userId);
		System.out.println(user);
		T_User t = repository.pwdCheck(user);
		return t;
	}
	
	
}
