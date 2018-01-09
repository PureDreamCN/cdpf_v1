/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:web
 */
package com.critc.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.core.pub.PubConfig;
import com.critc.example.model.ExampleUeditor;
import com.critc.example.service.ExampleUeditorService;
import com.critc.util.file.FileUploadUtil;
import com.critc.util.web.WebUtil;


/**
 * 
 * what:    UeditorController. <br/>
 * 
 *
 * @author 刘正荣 created on 2017年11月3日
 */
@Controller
@RequestMapping("/example/ueditor")
public class ExampleUeditorController {

	@Autowired
	private ExampleUeditorService exampleUeditorService;
	
	
	@Autowired
	private PubConfig pubConfig;

	/**
	 * 
	 * what: 进入ueditor主界面. <br/>
	 * 
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	@RequestMapping("/index")
	public ModelAndView index() {
		List<ExampleUeditor> ueditors = exampleUeditorService.list();
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ueditors);
		mv.setViewName("/example/ueditor/index");
		return mv;
	}

	/**
	 * 
	 * what: 保存或更新数据. <br/>
	 * 
	 * @param response
	 * @param exampleUeditor
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	@RequestMapping("/saveOrUpdate")
	public void saveOrUpdate(HttpServletResponse response, ExampleUeditor exampleUeditor,String content) {
		String basePath = pubConfig.getFileUploadPath();
		int flag = exampleUeditorService.saveOrUpdate(exampleUeditor,basePath,content);
		WebUtil.out(response, String.valueOf(flag));
	}

	/**
	 * 
	 * what: 删除指定id的记录. <br/>
	 * 
	 * @param id
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	@RequestMapping("/delete")
	public String delete(int id) {
		exampleUeditorService.delete(id);
		return "forward:index.htm";
	}

	
	/**
	 * 
	 * what:    从指定路径中读取文件. <br/>
	 * 
	 * @param request  
	 * @param path
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月30日
	 */
    @RequestMapping("/readFile")
	public void readFile(HttpServletRequest request,HttpServletResponse response,String path){
		WebUtil.out(response, exampleUeditorService.readFile(pubConfig.getFileUploadPath(),path,request));
		
	}
    
    
    /**
     * 
     * what:    上传图片. <br/>
     * @param request
     * @param response
     * @param path
     *
     * @author 刘正荣 created on 2017年11月10日
     */
    @RequestMapping("/uploadImg")
    public void uploadImg(HttpServletRequest request,HttpServletResponse response,String path){
    	//FileUploadUtil.upload(request, response, path);
    }
}
