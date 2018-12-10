package kr.co.nextlab.test.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import kr.co.nextlab.annotation.security.Access;
import kr.co.nextlab.comm.controller.BaseController;
import kr.co.nextlab.comm.model.CodeVo;
import kr.co.nextlab.comm.model.FileVo;
import kr.co.nextlab.component.CodeComponent;
import kr.co.nextlab.component.FileComponent;
import kr.co.nextlab.component.MailComponent;
import kr.co.nextlab.excel.CommonExcelParser;
import kr.co.nextlab.excel.ExcelDownloadView;
import kr.co.nextlab.excel.ExcelHeader;
import kr.co.nextlab.excel.ExcelResource;
import kr.co.nextlab.excel.model.TestUpload;
import kr.co.nextlab.test.model.TestCriteria;
import kr.co.nextlab.test.model.TestVo;
import kr.co.nextlab.test.service.TestService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController extends BaseController {
	
	@Autowired
	private MessageSourceAccessor messageSourceAccessor;
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private CodeComponent codeComponent;
	
	@Autowired
	private FileComponent fileComponent;
	
	@Autowired
	private MailComponent mailComponent;
	
	@Access
	@RequestMapping("/test")
	public String test(Model model, TestCriteria criteria) {
		log.debug("test controller");
		log.debug("message lang test : " + messageSourceAccessor.getMessage("test"));
		
		// 임시테이블 조회
		TestVo testVo = testService.selectTestTran();
		model.addAttribute("testVo", testVo);
		
		// 코드 리스트 가져오기
		model.addAttribute("codeList", codeComponent.getCodeList("C100"));
		
		// 페이징리스트
		model.addAttribute("pageList", testService.selectPageList(criteria));
		
		super.getSession().setAttribute("testCriteria", criteria);
		return "test/test";
	}
	
	@RequestMapping("/test/testExcel")
	public ExcelDownloadView testExcel(Model model, TestCriteria criteria) {
		// 엑셀다운로드
		criteria.setPagingType("excel");
		List<TestVo> list = testService.selectList(criteria);
		
		ExcelHeader[] headers = new ExcelHeader[] {
			new ExcelHeader("codeId", "코드아이디")
			, new ExcelHeader("codeNm", "코드명") 
			, new ExcelHeader("str", "구분", "useYnboolean")
			, new ExcelHeader("codeId", "aaaa", "", "C100")
		};
		
		return new ExcelDownloadView(new ExcelResource(list, headers),"테스트.xlsx");
	}
	
	@RequestMapping("/test/excelUpload")
	public View excelUpload(Model model, HttpServletRequest request, HttpServletResponse response){
		boolean save = false;
		String message = "";
		List<TestUpload> uploadList = null;

		MultipartFile excelFile = ((MultipartHttpServletRequest) request).getFile("uploadExcel");
		if(excelFile != null){
			CommonExcelParser<TestUpload> parser = new CommonExcelParser<TestUpload>(TestUpload.class, 0, 1, 3000);
			parser.setExcelFile(excelFile);
			
			// 엑셀파일 유효성체크
			if(parser.isValidExcelFile()){
				uploadList = parser.validResultList(TestUpload.class, parser.getDataList());
				log.debug(uploadList.toString());
				save = true;
				model.addAttribute("uploadList", uploadList);
			}
			else {
				message = "파일형식이 올바르지 않습니다.";
			}
		}
		model.addAttribute("save", save);
		model.addAttribute("message", message);
		return new MappingJackson2JsonView();
	}

	@RequestMapping("/test/testJson")
	public View testJson(Model model) {
		log.debug("json controller");
		model.addAttribute("abcd", "abcd");
		return new MappingJackson2JsonView();
	}
	
	@PostMapping("/test/testFile")
	public View testFile(Model model, MultipartHttpServletRequest multipartRequest) {
		MultipartFile file = multipartRequest.getFile("uploadFile");
		FileVo fileVo = fileComponent.saveFile(file, "test");
		log.debug(fileVo.toString());
		model.addAttribute("fileVo", fileVo);
		return new MappingJackson2JsonView();
	}
	
	@Access
	@RequestMapping("/test/vue")
	public void testVue(Model model) {
		log.debug("test vue controller");
	}
	
	@Access
	@RequestMapping("/test/message")
	public void testMessage(Model model) {
		log.debug("test message controller");
	}
	
	@RequestMapping("/test/testListJson")
	public View testListJson(Model model, String code) {
		log.debug("testListJson controller");
		List<CodeVo> codeList = codeComponent.getCodeList();
		List<CodeVo> tempList = new ArrayList<CodeVo>();
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		tempList.addAll(codeList);
		model.addAttribute("codeList", tempList);
		return new MappingJackson2JsonView();
	}
	
	@RequestMapping("/test/testPagingListJson")
	public View testPagingListJson(Model model, TestCriteria criteria) {
		log.debug("testPagingListJson controller");
		model.addAttribute("pageList", testService.selectPageList(criteria));
		return new MappingJackson2JsonView();
	}
	
	@RequestMapping("/test/testSendMail")
	public View testSendMail(Model model, TestVo testVo, HttpServletRequest request, HttpServletResponse response) {
		mailComponent.sendMailUser("/mail/testForm", "U0056", "테스트메일", "");
		return new MappingJackson2JsonView();
	}
	
	@RequestMapping("/test/testSendMail2")
	public View testSendMail2(Model model, TestVo testVo, HttpServletRequest request, HttpServletResponse response) {
		File file = fileComponent.saveFileFromFileStr(request.getParameter("img"), "pdf", "tmp");
		mailComponent.sendMailUser("/mail/testForm", "U0056", "테스트메일", "", file, "테스트파일.pdf");
		return new MappingJackson2JsonView();
	}
	/**
	 * table + report 화면 샘플 페이지
	 */
	@Access
	@RequestMapping("/test/testMain")
	public void testMain(Model model) {
		log.debug("test testMain controller");
	}
}
