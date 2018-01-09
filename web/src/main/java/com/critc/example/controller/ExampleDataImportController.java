package com.critc.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.critc.core.pub.PubConfig;
import com.critc.example.model.ExampleStudent;
import com.critc.example.service.ExampleStudentService;
import com.critc.example.vo.ExampleStudentSearchVO;
import com.critc.util.code.GlobalCode;
import com.critc.util.json.JsonUtil;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;

/**
 * 
 * what: 数据导入Controller
 * 
 *
 * @author 李红 created on 2017年10月30日
 */
@RequestMapping("/example/dataimport")
@Controller
public class ExampleDataImportController {
	@Autowired
	private PubConfig pubConfig;
	@Autowired
	private ExampleStudentService exampleStudentService;

	@RequestMapping("/index")
	private ModelAndView index(HttpServletRequest request, HttpServletResponse response,
			ExampleStudentSearchVO exampleStudentSearchVO) {
		ModelAndView mv = new ModelAndView();
		List<ExampleStudent> list = exampleStudentService.list(exampleStudentSearchVO);
		mv.setViewName("/example/dataimport/index");
		// 把获取的记录放到mv里面
		mv.addObject("list", list);
		mv.addObject("listCollege", exampleStudentService.listCollege());
		mv.addObject("listMajor", exampleStudentService.listMajor(exampleStudentSearchVO.getCollegeNo()));
		String url = createUrl(exampleStudentSearchVO);
		// 设置返回url
		BackUrlUtil.createBackUrl(mv, request, url);
		return mv;
	}

	/**
	 * 
	 * what: 设置分页url，一般有查询条件的才会用到
	 * 
	 * @param exampleStudentSearchVO
	 * @return
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	private String createUrl(ExampleStudentSearchVO exampleStudentSearchVO) {
		String url = pubConfig.getDynamicServer() + "/example/dataimport/index.htm?";
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getNo()))
			url += "&no=" + exampleStudentSearchVO.getNo();
		// 如果为模糊查询，要把该字段encode
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getName()))
			url += "&name=" + exampleStudentSearchVO.getName();
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getCollegeNo()))
			url += "&collegeNo=" + exampleStudentSearchVO.getCollegeNo();
		if (StringUtil.isNotNullOrEmpty(exampleStudentSearchVO.getMajorNo()))
			url += "&majorNo=" + exampleStudentSearchVO.getMajorNo();
		return url;
	}

	/**
	 * 
	 * what: 二级联动，根据学院查询专业
	 * 
	 * @param request
	 * @param response
	 * @param collegeNo
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	@RequestMapping(value = "/listMajor")
	@ResponseBody
	private void listMajor(HttpServletRequest request, HttpServletResponse response, String collegeNo) {
		WebUtil.out(response, JsonUtil.toStr(exampleStudentService.listMajor(collegeNo)));
	}

	/**
	 * 
	 * what: 删除
	 * 
	 * @param request
	 * @param response
	 * @return
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		//删除isDelete='Y'的数据
		int flag = exampleStudentService.delete("Y");
		if (flag == 0){
			// 删除失败
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		}
		else{
			// 删除成功
			return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;
		}
	}

	/**
	 * 
	 * what:    校验文件
	 * 
	 * @param request
	 * @param response
	 * @param uploadFilePath
	 * @return
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	@RequestMapping(value = "/validateFile")
	public void validateFile(HttpServletRequest request, HttpServletResponse response, String uploadFilePath) {
		String ret = exampleStudentService.validateFile(uploadFilePath);
		Map<String, Object> map = new HashMap<>();
		if (StringUtil.isNullOrEmpty(ret)){
			map.put("success", true);
			map.put("msgText","校验成功");
		}
		else{
			map.put("success", false);
			map.put("msgText", ret);
		}
		WebUtil.out(response, JsonUtil.toStr(map));
	}

	/**
	 * 
	 * what:    导入文件
	 * 
	 * @param request
	 * @param response
	 * @param uploadFilePath
	 * @return
	 *
	 * @author 李红 created on 2017年10月30日
	 */
	@RequestMapping(value = "/importFile")
	public void importFile(HttpServletRequest request, HttpServletResponse response, ExampleStudentSearchVO exampleStudentSearchVO,String uploadFilePath) {
		Map<String,Object> map = exampleStudentService.importFile(exampleStudentSearchVO,uploadFilePath);
		WebUtil.out(response, JsonUtil.toStr(map));
	}
}
