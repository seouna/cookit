package com.cook.cookit.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.cookit.mapper.MarketMapper;

@Service
public class MarketService {
	
	@Autowired
	private MarketMapper marketMapper;

	public int insertProduct(HashMap<String, String> product) {
		return marketMapper.insertProduct(product);
	}

	public List<HashMap<String, String>> selectProduct() {
		return marketMapper.selectProduct();
	}

}
