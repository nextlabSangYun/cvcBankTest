/**
 * @title	: 파일 컨트롤러
 * @package	: kr.co.nextlab.comm.controller
 * @file	: FileController.java
 * @author	: jnlee
 * @date	: 2017. 11. 14.
 * @desc	: 
 */
package kr.co.nextlab.comm.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.comm.model.FileVo;
import kr.co.nextlab.component.FileComponent;
import kr.co.nextlab.util.PropertyUtil;

@Controller
public class FileController extends BaseController {
	
	@Autowired
	private FileComponent fileComponent;

	/**
	 * 파일 다운로드
	 * @param savePath 저장경로 (rootPath 제외)
	 * @param saveName 저장파일명
	 * @param realName 실제파일명
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping("/file/download")
	public ResponseEntity<?> download(@RequestParam String savePath
			, @RequestParam String saveName,  @RequestParam String realName
			, HttpServletResponse response) throws Exception {
		
		Resource res = null;
		try {
			res = fileComponent.loadAsResource(savePath, saveName);
			realName = URLEncoder.encode(realName, PropertyUtil.getProperty("site.charset", "UTF-8"));
			
			if (res==null) {
				return ResponseEntity.ok()
						.header(HttpHeaders.CONTENT_TYPE, "text/html; charset=UTF-8")
						.header(HttpHeaders.SET_COOKIE, "filedown=true; path=/")
						.body("<script>alert('첨부파일을 찾을 수 없습니다.');history.back();</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("File not found..");
		}
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + realName + "\"")
				.header(HttpHeaders.SET_COOKIE, "filedown=true; path=/")
				.body(res);
	}
	
	/**
	 * 파일업로드
	 * @param model
	 * @param multipartRequest
	 * @return
	 */
	@RequestMapping("/file/regFilePrc")
	public View regFilePrc(Model model, HttpServletRequest request, FileVo fileVo) {
		boolean save = false;
		String message = "";
		
		long maxSize = Long.parseLong(PropertyUtil.getProperty("file.max-size"));
		if (fileVo.getMaxSize()>0) 
			maxSize = fileVo.getMaxSize();
		
		MultipartFile file = ((MultipartHttpServletRequest) request).getFile("file");
		String fileExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		if (file.getSize() > maxSize) {
			message = (maxSize / 1024 / 1024) + "MB까지 업로드 가능합니다.";
		} 
		else if (StringUtils.isNotEmpty(fileVo.getAcceptExtension())
				&& fileVo.getAcceptExtension().indexOf(fileExtension) == -1) {
			message = "확장자가 '" + fileVo.getAcceptExtension() + "' 파일만 업로드 가능합니다.";
		}
		else {
			fileVo = fileComponent.saveFile(file, fileVo.getSaveFilePath());
			save = true;
		}
		
		model.addAttribute("message", message);
		model.addAttribute("save", save);
		model.addAttribute("fileVo", fileVo);
		return new MappingJackson2JsonView();
	}
}