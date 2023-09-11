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

import com.cook.cookit.bo.NaverLoginBO;
import com.cook.cookit.service.MemberService;
import com.cook.cookit.vo.MemberVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Primary
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	
	@GetMapping("joinForm")
	public String joinForm() {
		return "member/join";
	}
	
	@GetMapping("MemberCheckDupId")
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
	
	
	@PostMapping("joinPro")
	public String joinPro(@RequestParam HashMap<String, String> member, Model model, HttpSession session) {
		
		//비밀번호암호화
		// 1) 암호화된 비밀번호 생성 
		String securePasswd = new BCryptPasswordEncoder().encode(member.get("member_passwd"));
		member.put("member_passwd", securePasswd);

		String member_bday = member.get("member_birth_year") + "/" + member.get("member_birth_month") + "/" + member.get("member_birth_day") ;
		member.put("member_bday", member_bday);
		
		String member_email = member.get("member_email1") + "@" + member.get("member_email2");
		member.put("member_email", member_email);
		System.out.println(member);
		System.out.println(member.get("member_tel"));
		
		int insertCount = memberService.registMember(member);
		
		// 가입성공했을때
		if(insertCount > 0) { 
			model.addAttribute("member", member);
			return "member/join_success";
		} 
		
		return "fail_back";
	}
	
	
	@GetMapping("/login")
	public String login(Model model, HttpSession session) {
		
		  /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
//        model.addAttribute("naverurl", naverAuthUrl);
 
        /* 생성한 인증 URL을 View로 전달 */
		return "member/login";
		
	}
	
	@PostMapping("loginPro")
	public String loginPro(@RequestParam String member_id, @RequestParam String member_pw
							, Model model, HttpSession session) {
		System.out.println(member_id);
		HashMap<String, String> member = memberService.getMember(member_id);
		
		  if (member != null) {
		        String hashedPassword = member.get("member_pw");
			    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

			    if (passwordEncoder.matches(member_pw, hashedPassword)) {
			    	if(member.get("member_delete_status").equals("Y")) {
			    		model.addAttribute("msg", "탈퇴한 회원입니다.");
			    		return "fail_back";
			    	}
			        session.setAttribute("sId", member.get("member_id"));
					
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
		if(member == null) {
			model.addAttribute("msg", "회원이 아닙니다. 회원가입 페이지로 이동합니다.");
			model.addAttribute("target", "joinForm?email=" + kakao.get("email"));
			
			return "member/success";
			
		} else {
			session.setAttribute("sId", member.get("member_id"));
			
			return "redirect:/main";
		}
		
	}
	

	
	
	//네이버 로그인 확인
	@RequestMapping(value = "naverLogin", method = {RequestMethod.GET, RequestMethod.POST})
	public String naver(@RequestParam HashMap<String, String> naver,Model model,HttpSession session,HttpServletRequest request, MemberVO memberVO) throws Exception {
//			@RequestParam String code, @RequestParam String state,
		System.out.println(naver);
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//		System.out.println(naverAuthUrl);
		 	
		 	

//			JsonParser json = new JsonParser();
			
//			 System.out.println("여기는 callback");
	        
//	        OAuth2AccessToken oauthToken;
//	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	        //로그인 사용자 정보를 읽어온다.
//	        String apiResult = naverLoginBO.getUserProfile(oauthToken);
	        
//	        memberVO = json.changeJson(apiResult); // dto에 저장
	        
	        
//	        if (memberService.getNaverMember(memberVO) != null) { // 세션만들기 (이미 한번이라도 로그인한 정보가 있으면~)
//				session.setAttribute("login", memberVO);
//			}else { //로그인을 한번도 안했다면 가입!
//				
//				memberService.joinNaverMember(memberVO);
//				session.setAttribute("login", memberVO);
//			}
//	        
//	        
//	        model.addAttribute("result", apiResult);
//	        
//	        System.out.println(apiResult);
		
		model.addAttribute("isClose", true);
		model.addAttribute("msg", "네이버 로그인 성공하였습니다.");
		model.addAttribute("target", "main");
			
		return "member/success";
	}
	
	//네이버 로그인 확인
//	@RequestMapping(value = "NaverLoginCallback", method = {RequestMethod.GET, RequestMethod.POST})
//	public @ResponseBody String NaverLoginCallback(@RequestParam Map<String, String> resValue){
//
//        // code 를 받아오면 code 를 사용하여 access_token를 발급받는다.
//        final NaverLoginVo naverLoginVo = memberService.requestNaverLoginAccessToken(resValue, "authorization_code");
//
//        // access_token를 사용하여 사용자의 고유 id값을 가져온다.
//        final NaverLoginProfile naverLoginProfile = memberService.requestNaverLoginProfile(naverLoginVo);
//
//        return naverLoginProfile.toString();
//    }
	
}

