package com.spring.javaProjectS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageController {

	@RequestMapping(value="/message/{msgFlag}", method = RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, String mid, Model model) {
		if(msgFlag.equals("userDeleteOk")) {
			model.addAttribute("msg", "삭제되었습니다.");
			model.addAttribute("url", "user/userList");
		}
		else if(msgFlag.equals("userDeleteNo")) {
			model.addAttribute("msg", "삭제에 실패했습니다.");
			model.addAttribute("url", "user/userList");
		}
		else if(msgFlag.equals("user2DeleteOk")) {
			model.addAttribute("msg", "삭제되었습니다ㅋㅋ.");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("user2DeleteNo")) {
			model.addAttribute("msg", "삭제에 실패했습니다ㅋㅋ.");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("user2InputOk")) {
			model.addAttribute("msg", "가입되었습니다ㅋㅋ.");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("user2InputNo")) {
			model.addAttribute("msg", "가입에 실패했습니다ㅋㅋ.");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("user2UpdateOk")) {
			model.addAttribute("msg", "수정되었습니다ㅋㅋ.");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("user2UpdateNo")) {
			model.addAttribute("msg", "수정에 실패했습니다ㅋㅋ.");
			model.addAttribute("url", "user2/user2List");
		}
		
		return "include/message";
	}
}
