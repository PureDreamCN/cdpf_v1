package com.critc.sys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.critc.core.pub.PubConfig;
import com.critc.sys.model.SysDic;
import com.critc.sys.service.SysDicService;
import com.critc.sys.vo.SysDicVO;
import com.critc.util.code.GlobalCode;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.web.WebUtil;

/**
 * 
 * 字典信息 Controller
 * @author: 刘正荣
 * @date: 2017年10月19日
 */

/**
 * 
 * what: 字典信息 Controller. <br/>
 * when: (这里描述这个类的适用时机 – 可选).<br/>
 * how: (这里描述这个类的使用方法 – 可选).<br/>
 * warning: (这里描述这个类的注意事项 – 可选).<br/>
 * 
 *
 * @author 刘正荣 created on 2017年10月31日
 */
@Controller
@RequestMapping("/sys/dic")
public class SysDicController {

	@Autowired
	private SysDicService sysDicService;

	@Autowired
	private PubConfig pubConfig;

	/**
	 * 
	 * what: 跳转到字典信息首页. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月31日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<SysDicVO> list = sysDicService.listAll();
		String url = pubConfig.getDynamicServer() + "/sys/dic/index.htm";
		mv.addObject("list", list);// 把获取的记录放到mv里面
		mv.setViewName("/sys/dic/index");// 跳转至指定页面
		BackUrlUtil.createBackUrl(mv, request, url);// 设置返回url
		return mv;
	}

	/**
	 * 
	 * what: 跳转到添加字典页面. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	@RequestMapping("/toAdd")
	public ModelAndView toAdd(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("sysDic", new SysDic());
		mv.addObject("listCategory", sysDicService.listCombo());
		mv.setViewName("/sys/dic/add");
		BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
		return mv;
	}

	/**
	 * 
	 * what: 跳转到添加类别页面. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	@RequestMapping("/toAddCategory")
	public ModelAndView toAddCategory(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("sysDic", new SysDic());
		mv.setViewName("/sys/dic/addCategory");
		BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
		return mv;
	}

	/**
	 * 
	 * what: 跳转到更新字典页面. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request
	 * @param id
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(HttpServletRequest request, int id) {
		ModelAndView mv = new ModelAndView();
		SysDic sysDic = sysDicService.get(id);
		mv.setViewName("/sys/dic/update");
		mv.addObject("sysDic", sysDic);
		BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
		return mv;
	}

	/**
	 * 
	 * what: 跳转到更新类别页面. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request
	 * @param id
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	@RequestMapping("/toUpdateCategory")
	public ModelAndView toUpdateCategory(HttpServletRequest request, int id) {
		ModelAndView mv = new ModelAndView();
		SysDic sysDic = sysDicService.get(id);
		mv.setViewName("/sys/dic/updateCategory");
		mv.addObject("sysDic", sysDic);
		BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
		return mv;
	}

	/**
	 * 
	 * what: 跳转到字典明细. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request
	 * @param category
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	@RequestMapping("/toMaintenance")
	public ModelAndView toMaintenance(HttpServletRequest request, String category) {
		ModelAndView mv = new ModelAndView();
		List<SysDic> sysDicList = sysDicService.getAllCategory(category);
		mv.setViewName("/sys/dic/maintenance");
		BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
		mv.addObject("sysDicList", sysDicList);
		return mv;
	}

	/**
	 * 
	 * what: 添加字典. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how:  (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param sysDic
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	@RequestMapping("/add")
	public String add(@Valid SysDic sysDic) {
		int flag = sysDicService.add(sysDic);

		if (flag == 0){
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;// 字典信息新增失败;
		}
		else{
			return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;// 字典信息新增成功;
		}
	}

	/**
	 * 
	 * what: 处理字典维护请求. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param sysDicList
	 * @param response
	 * @param request
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	@RequestMapping("/maintenanceSysDic")
	@ResponseBody
	public void maintenanceSysDic(@RequestBody List<List<SysDic>> sysDicList, HttpServletResponse response,
			HttpServletRequest request) {
		String msg = null;
		int flag = sysDicService.maintenanceSysDic(sysDicList);
		if (flag == 1) {
			msg = GlobalCode.OPERA_SUCCESS;
			WebUtil.out(response, "{\"result\":" + true + ",\"message\":\"" + msg + "\"}");
		} else {
			msg = GlobalCode.OPERA_FAILURE;
			WebUtil.out(response, "{\"result\":" + false + ",\"message\":\"" + msg + "\"}");
		}
	}

	/**
	 * 
	 * what: 删除字典信息. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param category
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	@RequestMapping("/delete")
	public String delete(String category) {
		int flag = sysDicService.deleteCategory(category);
		if (flag == 0){
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		}
		else{
			return "forward:/success.htm?resultCode=" + GlobalCode.OPERA_SUCCESS;
		}
	}

	/**
	 * 
	 * what: 用于判断字典类别或字典类别信息是否唯一. <br/>
	 * when: 修改或添加字典明细时使用.<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param response
	 * @param param  有两个值：category或categoryName
	 * @param prev   修改前的值
	 * @param value  category或categoryName修改后的值
	 * @param category 字典信息的类别           
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	@RequestMapping("/checkDicExist")
	public void checkDicExist(HttpServletResponse response, String param, String prev, String value,String category) {
		int flag = sysDicService.checkCategoryExist(param, prev, value,category);

		if (flag == 0) {
			WebUtil.out(response, "{\"result\":" + 0 + ",\"message\":\"" + "与修改前相同" + "\"}");
		} else if (flag == 1) {
			WebUtil.out(response, "{\"result\":" + 1 + ",\"message\":\"" + "数据库中不存在" + "\"}");
		} else {
			WebUtil.out(response, "{\"result\":" + 2 + ",\"message\":\"" + "数据库中已存在" + "\"}");
		}
	}

	/**
	 * 
	 * what: 用于判断类别下是否存在字典信息. <br/>
	 * when: 删除时使用 .<br/>
	 * how:  (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param response
	 * @param category
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	@RequestMapping("/checkCateoryExistDic")
	public void checkCateoryExistDic(HttpServletResponse response, String category) {
		boolean flag = sysDicService.checkCateoryExistDic(category);

		if (flag) {
			WebUtil.out(response, "{\"result\":" + true + ",\"message\":\"" + "可以删除" + "\"}");
		} else {
			WebUtil.out(response, "{\"result\":" + false + ",\"message\":\"" + "不能删除" + "\"}");
		}
	}

}
