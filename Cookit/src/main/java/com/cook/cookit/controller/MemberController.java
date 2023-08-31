package com.cook.cookit.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cook.cookit.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "member/join";
	}
	
	@GetMapping("/MemberCheckDupId")
	@ResponseBody
	public boolean idCheck(String id) {
		boolean result =false;
		HashMap<String, String> dupId = memberService.checkDupId(id);
		if(dupId != null)	{
			result = true; 
		}
		System.out.println(result);
		return result;
	}
	
	@GetMapping("phoneCheck")
	@ResponseBody
	public String sendSMS(@RequestParam String phone) { // 휴대폰 문자보내기
		System.out.println("check"+phone);
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		memberService.certifiedPhoneNumber(phone, randomNumber);
		return Integer.toString(randomNumber);
	}

}
