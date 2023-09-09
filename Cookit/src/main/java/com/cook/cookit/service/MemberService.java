package com.cook.cookit.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.cookit.mapper.MemberMapper;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class MemberService {
	
//	@Autowired
//    private WebClient webClient;
//
//    @Value("${api.naver.client_id}")
//    private String client_id;
//
//    @Value("${api.naver.client_secret}")
//    private String client_secret;

	@Autowired
	private MemberMapper mapper;
	public HashMap<String, String> checkDupId(String id) {
		return mapper.checkDupId(id);
	}
	public void certifiedPhoneNumber(String phone, int randomNumber) {
		String api_key = "NCSWTSDHI3RHA6MK";
	    String api_secret = "ZB2Q0JSBCUNEWY7EHOQ7MWEOJRS55AUC";
	    Message coolsms = new Message(api_key, api_secret);

	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);    // 수신전화번호
	    params.put("from", "01057887223");    // 발신전화번호
	    params.put("type", "SMS");
	    params.put("text", "[쿠킷] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); 

	    try {
	        org.json.simple.JSONObject obj = (org.json.simple.JSONObject)coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
		
		
	}
	public int registMember(HashMap<String, String> member) {
		return mapper.insertMember(member);
	}
	public HashMap<String, String> getMember(String member_id) {
		return mapper.selectMem_id(member_id);
	}
	public HashMap<String, String> kakaoMember(String email) {
		return mapper.selectKakao(email);
	}

//	// 로그인 엑세스 토큰
//	public NaverLoginVo requestNaverLoginAccessToken(Map<String, String> resValue, String grant_type){
//        final String uri = UriComponentsBuilder
//                .fromUriString("https://nid.naver.com")
//                .path("/oauth2.0/token")
//                .queryParam("grant_type", grant_type)
//                .queryParam("client_id", this.client_id)
//                .queryParam("client_secret", this.client_secret)
//                .queryParam("code", resValue.get("code"))
//                .queryParam("state", resValue.get("state"))
//                .queryParam("refresh_token", resValue.get("refresh_token")) // Access_token 갱신시 사용
//                .build()
//                .encode()
//                .toUriString();
//
//        return webClient
//                .get()
//                .uri(uri)
//                .retrieve()
//                .bodyToMono(NaverLoginVo.class)
//                .block();
//    }
//	
//	// ----- 프로필 API 호출 (Unique한 id 값을 가져오기 위함) -----
//    public NaverLoginProfile requestNaverLoginProfile(NaverLoginVo naverLoginVo){
//        final String profileUri = UriComponentsBuilder
//                .fromUriString("https://openapi.naver.com")
//                .path("/v1/nid/me")
//                .build()
//                .encode()
//                .toUriString();
//
//        return webClient
//                .get()
//                .uri(profileUri)
//                .header("Authorization", "Bearer " + naverLoginVo.getAccess_token())
//                .retrieve()
//                .bodyToMono(NaverLoginProfileResponse.class)
//                .block()
//                .getResponse(); // NaverLoginProfile 은 건네준다.
//    }

	
}