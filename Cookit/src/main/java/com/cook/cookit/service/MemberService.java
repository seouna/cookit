package com.cook.cookit.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.cookit.mapper.MemberMapper;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class MemberService {

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

	
}














