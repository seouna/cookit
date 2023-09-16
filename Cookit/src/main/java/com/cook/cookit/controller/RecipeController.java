package com.cook.cookit.controller;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RecipeController {
	
	
	@GetMapping("recipe")
	public String logout(HttpSession session) {
		
		String url = "https://www.10000recipe.com/recipe/list.html"; 
		Document doc = null;     

		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println(doc);
		//select를 이용하여 원하는 태그를 선택한다. select는 원하는 값을 가져오기 위한 중요한 기능이다.
//		Elements element = doc.select("div.sect-movie-chart");    

//		System.out.println("============================================================");

		//Iterator을 사용하여 하나씩 값 가져오기
//		Iterator<Element> ie1 = element.select("strong.rank").iterator();
//		Iterator<Element> ie2 = element.select("strong.title").iterator();
		        
//		while (ie1.hasNext()) {
			
		
		return "recipe/recipeList";
	}

}
