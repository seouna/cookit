package com.cook.cookit.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {
	
	@RequestMapping(value = "main", method = { RequestMethod.GET, RequestMethod.POST })
	public String main(Model model,HttpSession session, HttpServletRequest request) {
		String email = request.getParameter("email");
		
		String username = request.getParameter("username");
		if(email != null) {
			String id = email.split("@")[0];
			session.setAttribute("sId", id);
		}
		session.setAttribute("member_name", username);
		session.setAttribute("email", email);
		return "main";

	}
	
	
}
