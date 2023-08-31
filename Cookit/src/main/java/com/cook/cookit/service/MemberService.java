package com.cook.cookit.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.cookit.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;
	public HashMap<String, String> checkDupId(String id) {
		return mapper.checkDupId(id);
	}

	
}














