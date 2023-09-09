package com.cook.cookit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.cookit.mapper.MarketMapper;

@Service
public class MarketService {
	
	@Autowired
	private MarketMapper marketMapper;

	// 상품 업로드
	public int insertProduct(HashMap<String, String> product) {
		return marketMapper.insertProduct(product);
	}

	// 상품리스트 조회
	public List<HashMap<String, String>> selectProduct() {
		return marketMapper.selectProduct();
	}

	// 파일 업로드
	public void insertFile(Map<String, Object> map) {
		marketMapper.insertFile(map);
	}

}
