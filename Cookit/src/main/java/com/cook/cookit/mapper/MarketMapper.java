package com.cook.cookit.mapper;

import java.util.HashMap;
import java.util.List;

public interface MarketMapper {

	int insertProduct(HashMap<String, String> product);

	List<HashMap<String, String>> selectProduct();

}
