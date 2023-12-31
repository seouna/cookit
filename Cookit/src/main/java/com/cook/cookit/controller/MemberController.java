package com.cook.cookit.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cook.cookit.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;


	@GetMapping("joinForm")
	public String joinForm() {
		return "member/join";
	}

	@GetMapping("MemberCheckDupId")
	@ResponseBody
	public boolean idCheck(String id) {
		boolean result = false;
		HashMap<String, String> dupId = memberService.checkDupId(id);
		if (dupId != null) {
			result = true;
		}
		System.out.println(result);
		return result;
	}

	@GetMapping("phoneCheck")
	@ResponseBody
	public String sendSMS(@RequestParam String phone) { // 휴대폰 문자보내기
		System.out.println("check" + phone);
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);// 난수 생성
		memberService.certifiedPhoneNumber(phone, randomNumber);
		return Integer.toString(randomNumber);
	}

	@PostMapping("joinPro")
	public String joinPro(@RequestParam HashMap<String, String> member, Model model, HttpSession session) {

		// 비밀번호암호화
		// 1) 암호화된 비밀번호 생성
		String securePasswd = new BCryptPasswordEncoder().encode(member.get("member_passwd"));
		member.put("member_passwd", securePasswd);

		String member_bday = member.get("member_birth_year") + "/" + member.get("member_birth_month") + "/"
				+ member.get("member_birth_day");
		member.put("member_bday", member_bday);

		String member_email = member.get("member_email1") + "@" + member.get("member_email2");
		member.put("member_email", member_email);
		System.out.println(member);
		System.out.println(member.get("member_tel"));

		int insertCount = memberService.registMember(member);

		// 가입성공했을때
		if (insertCount > 0) {
			model.addAttribute("member", member);
			return "member/join_success";
		}

		return "fail_back";
	}

	@GetMapping("/login")
	public String login(Model model, HttpSession session) {


		/* 생성한 인증 URL을 View로 전달 */
		return "member/login";

	}

	@PostMapping("loginPro")
	public String loginPro(@RequestParam String member_id, @RequestParam String member_pw, Model model,
			HttpSession session) {
		System.out.println(member_id);
		HashMap<String, String> member = memberService.getMember(member_id);

		if (member != null) {
			String hashedPassword = member.get("member_pw");
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

			if (passwordEncoder.matches(member_pw, hashedPassword)) {
				if (member.get("member_delete_status").equals("Y")) {
					model.addAttribute("msg", "탈퇴한 회원입니다.");
					return "fail_back";
				}
				session.setAttribute("sId", member.get("member_id"));
				session.setAttribute("member_name", member.get("member_name"));
				
				return "redirect:/main";
			}

		}
		model.addAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다.");
		return "fail_back";

	}

	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}

	// 카카오 로그인 확인
	@PostMapping("kakaoLogin")
	public String kakao(@RequestParam HashMap<String, String> kakao, Model model, HttpSession session) {

		HashMap<String, String> member = memberService.kakaoMember(kakao.get("email"));
		session.setAttribute("token", kakao.get("accessToken"));

		// 회원 판별
		if (member == null) {
			model.addAttribute("msg", "회원이 아닙니다. 회원가입 페이지로 이동합니다.");
			model.addAttribute("target", "joinForm?email=" + kakao.get("email"));

			return "member/success";

		} else {
			session.setAttribute("sId", member.get("member_id"));
			session.setAttribute("member_name", member.get("member_name"));
			return "redirect:/main";
		}

	}

	// 네이버 로그인 확인
	@RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String naver(@RequestParam HashMap<String, String> naver, Model model, HttpSession session,
			HttpServletRequest request) throws Exception {


		model.addAttribute("isClose", true);
		model.addAttribute("msg", "네이버 로그인 성공하였습니다.");
		model.addAttribute("target", "main");
		
		return "member/callback";
	}

	@GetMapping("myPage")
	public String myPage() {
		return "member/mypage";
	}
}
