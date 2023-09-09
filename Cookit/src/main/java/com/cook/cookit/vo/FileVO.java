package com.cook.cookit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileVO {
	private int file_idx;
	private String file_div;
	private String file_exe;
	private String file_size;
	private String file_name;
	private String file_path;
	private MultipartFile file;
}
