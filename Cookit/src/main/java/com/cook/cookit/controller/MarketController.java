package com.cook.cookit.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cook.cookit.service.MarketService;

@Controller
public class MarketController {
	
	@Autowired
	private MarketService marketService;
	
//	@Autowired
//	FileUpload fileUpload;
	
	// 마켓 페이지로 이동
	@GetMapping("/market")
	public String market(@RequestParam Map<String, String> map, Model model) {
		List<HashMap<String, String>> productList = marketService.selectProduct();
		model.addAttribute("productList", productList);
		return "market/market_list";
	}
	
	// 마켓 상품등록 페이지 이동
	@GetMapping("/marketRegisterForm")
	public String marketRegister(HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
//		if(sId == null || !sId.equals("admin")) {
//			model.addAttribute("msg", "권한이 없습니다.");
//			return "fail_back";
//		}
		
		return "market/market_register";
	}
	
	// 마켓 상품등록 업로드
	@PostMapping("/marketRegisterPro")
	public String marketRegisterPro(HttpSession session, Model model, @RequestParam HashMap<String, String> product) {
		String sId = (String)session.getAttribute("sId");
//		if(sId == null || !sId.equals("admin")) {
//		model.addAttribute("msg", "권한이 없습니다.");
//		return "fail_back";
//	}
		
		int insertCount = marketService.insertProduct(product);
//		String uploadDir = "/resources/upload"; // 프로젝트 상의 업로드 경로
//		String saveDir = session.getServletContext().getRealPath(uploadDir); //실제 업로드 경로
//		String file_path = "";
//		try {
//			Date date = new Date();
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//			file_path = "/" + sdf.format(date);
//			saveDir = saveDir + file_path;	// 기본 업로드 경로와 서브 디렉토리 경로 결합하여 저장
//			Path path = Paths.get(saveDir);
//			Files.createDirectories(path);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		MultipartFile mFile = product.
//		String originalFileName = f.getOriginalFilename();
//		String uuid = UUID.randomUUID().toString(); //파일명 중복 방지를 위한 코드
//		String UUIDpath = uuid.substring(0, 8) + "_" + originalFileName;
		
		if(insertCount > 0) {
//			model.addAttribute("msg", "등록이 완료되었습니다.");
//			model.addAttribute("target", "market");
//			return "success";
			return "redirect:/market";
		} else {
			model.addAttribute("msg", "등록이 실패하였습니다.");
			return "fail_back";
		}
	}


}
