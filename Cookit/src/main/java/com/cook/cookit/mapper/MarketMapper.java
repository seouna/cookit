package com.cook.cookit.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MarketMapper {

	int insertProduct(HashMap<String, String> product);

	List<HashMap<String, String>> selectProduct();

//	Object insertFile(Map<String, Object> map);
	void insertFile(Map<String, Object> map);

}
