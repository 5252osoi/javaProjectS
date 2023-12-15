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
			model.addAttribute("msg", "�����Ǿ����ϴ�.");
			model.addAttribute("url", "user/userList");
		}
		else if(msgFlag.equals("userDeleteNo")) {
			model.addAttribute("msg", "������ �����߽��ϴ�.");
			model.addAttribute("url", "user/userList");
		}
		else if(msgFlag.equals("user2DeleteOk")) {
			model.addAttribute("msg", "�����Ǿ����ϴ٤���.");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("user2DeleteNo")) {
			model.addAttribute("msg", "������ �����߽��ϴ٤���.");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("user2InputOk")) {
			model.addAttribute("msg", "���ԵǾ����ϴ٤���.");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("user2InputNo")) {
			model.addAttribute("msg", "���Կ� �����߽��ϴ٤���.");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("user2UpdateOk")) {
			model.addAttribute("msg", "�����Ǿ����ϴ٤���.");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("user2UpdateNo")) {
			model.addAttribute("msg", "������ �����߽��ϴ٤���.");
			model.addAttribute("url", "user2/user2List");
		}
		else if(msgFlag.equals("guestInputOk")) {
			model.addAttribute("msg", "���� ���� ��ϵǾ����ϴ�.");
			model.addAttribute("url", "guest/guestList");
		}
		else if(msgFlag.equals("guestInputNo")) {
			model.addAttribute("msg", "���� �� ����� �����߽��ϴ٤���.");
			model.addAttribute("url", "guest/guestInput");
		}
		else if(msgFlag.equals("adminLoginOk")) {
			model.addAttribute("msg", "������ ��������");
			model.addAttribute("url", "guest/guestList");
		}
		else if(msgFlag.equals("adminLoginNo")) {
			model.addAttribute("msg", "������ ��������");
			model.addAttribute("url", "guest/adminLogin");
		}
		else if(msgFlag.equals("guestDeleteOk")) {
			model.addAttribute("msg", "������ �� ���� �Ϸ�");
			model.addAttribute("url", "guest/guestList");
		}
		else if(msgFlag.equals("guestDeleteNo")) {
			model.addAttribute("msg", "������ �� ���� ����");
			model.addAttribute("url", "guest/guestList");
		}
		else if(msgFlag.equals("adminLogout")) {
			model.addAttribute("msg", "������ �α׾ƿ� ����");
			model.addAttribute("url", "guest/guestList");
		}
		
		return "include/message";
	}
}
