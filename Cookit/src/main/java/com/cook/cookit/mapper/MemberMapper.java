package com.cook.cookit.mapper;

import java.util.HashMap;

public interface MemberMapper {

	HashMap<String, String> checkDupId(String id);

	int insertMember(HashMap<String, String> member);

}
