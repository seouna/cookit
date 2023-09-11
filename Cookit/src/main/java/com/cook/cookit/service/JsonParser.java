package com.cook.cookit.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.cook.cookit.vo.MemberVO;




public class JsonParser {
	

	public MemberVO changeJson(String string) throws Exception {

		HashMap<String, Object> map = new HashMap<>();
		JSONParser jsonParser = new JSONParser();
		MemberVO vo = new MemberVO();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(string);

		jsonObject = (JSONObject) jsonObject.get("response");

		map.put("m_email", jsonObject.get("email"));
		map.put("m_name", jsonObject.get("name"));
		map.put("m_phoneNum", jsonObject.get("mobile"));
		
		System.out.println(jsonObject);
		
		
		
		//@앞에 String만 id로 저장
//		String naverId = MypageUtil.naverDomain((String)map.get("m_email"));
		
		//dto에 넣기
//		vo.setMember_id(naverId);
//		vo.setMember_name(map.get("m_name").toString());
//		vo.setMember_email(map.get("m_email").toString()); 
//		vo.setMember_tel(map.get("m_phoneNum").toString());
//		
//		System.out.println("json dto: " + vo);
		return vo;
	}
}