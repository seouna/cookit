package com.cook.cookit.mapper;

import java.util.HashMap;

public interface MemberMapper {

	HashMap<String, String> checkDupId(String id);

	int insertMember(HashMap<String, String> member);

	HashMap<String, String> selectMem_id(String member_id);

}
