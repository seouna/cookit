package com.cook.cookit.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cook.cookit.service.MainService;
import com.cook.cookit.service.MemberService;


@Controller
public class MainController {
	


	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model,HttpSession session, HttpServletRequest request) {
		
		return "main";

	}
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}

	@GetMapping("/login")
	public String login() {
		return "member/login";
	}

	
}
