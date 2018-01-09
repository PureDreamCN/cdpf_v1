package com.critc.example.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.example.model.ExampleUeditor;

/**
 * 
 * what:    fontawesome示例
 * 
 *
 * @author 郭飞 created on 2017年10月31日
 */
@Controller
@RequestMapping("/example/fontawesome")
public class ExampleFontAwesomeController {
	/**
	 * 
	 * what:    进入首页
	 * 
	 * @return
	 *
	 * @author 郭飞 created on 2017年10月31日
	 */
	@RequestMapping("/index")
    public ModelAndView index(){		
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("/example/fontawesome/index");
    	return mv;
    }
}
