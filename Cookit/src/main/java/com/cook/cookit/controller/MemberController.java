package com.cook.cookit.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cook.cookit.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "member/join";
	}
	
	@GetMapping("/MemberCheckDupId")
	@ResponseBody
	public boolean idCheck(String id) {
		boolean result =false;
		HashMap<String, String> dupId = service.checkDupId(id);
		if(dupId != null)	{
			result = true; 
		}
		System.out.println(result);
		return result;
	}
}
