package com.critc.example.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.example.model.Series;
import com.critc.example.model.SeriesData;
import com.critc.util.date.DateUtil;
import com.critc.util.json.JsonUtil;
import com.critc.util.web.WebUtil;


/**
 *  EchartsController
 * @author: 刘正荣
 * @date: 2017年9月27日
 */
@Controller
@RequestMapping("/example/echarts")
public class ExampleEchartsController {

	
	/**
	 * 跳转到echarts入门示例主页
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/index");
		return mv;
	}
	
	/**
	 * 跳转到快速入门示例页面
	 * @return
	 */
	@RequestMapping("/toSimpleStart")
	public ModelAndView simpleStart(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/simpleStart");
		return mv;
	}
	
	
	@RequestMapping("/toAsyncData")
	public ModelAndView toAsyncData(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/asyncData");
		return mv;
	}
	
	
	/**
	 * 异步加载数据
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getAsyncData")
	public void getData(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> dataMap = new HashMap<>();
		List<SeriesData> lineData = new ArrayList<>(); 
		List<String> categorys = new ArrayList<>();
		
		for(int i=0;i<100;i++){
			Calendar calendar = Calendar.getInstance();
			calendar.set(1968+i, 3, 2+i);
			SeriesData seriesData = new SeriesData();
			String name = DateUtil.dateToString(calendar.getTime(), "yyyy-MM-dd");
			String value[] = {name,String.valueOf(Math.random()%100)};
			seriesData.setName(name);
			seriesData.setValue(value);
			categorys.add(name);
			lineData.add(seriesData);
		}
		
		Series<SeriesData> series = new Series<>();
		series.setName("测试数据");
		series.setType("line");
		series.setData(lineData);
		
		dataMap.put("category", categorys);
		dataMap.put("lineData", series);
		WebUtil.out(response, JsonUtil.toStr(dataMap));	
	}
	
	/**
	 * 跳转到柱状图页面
	 * @return
	 */
	@RequestMapping("/toBarChart")
	public ModelAndView toBarChart(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/barChart");
		return mv;
	}
	
	/**
	 * 跳转到饼图页面
	 * @return
	 */
	@RequestMapping("/toPieChart")
	public ModelAndView toPieChart(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/pieChart");
		return mv;
	}
	
	/**
	 * 跳转到折线图页面
	 * @return
	 */
	@RequestMapping("/toLineChart")
	public ModelAndView tolineChart(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/lineChart");
		return mv;
	}
	
	
	/**
	 * 跳转到仪表盘页面
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/toGauge")
	public ModelAndView toGauge(HttpServletRequest request,HttpServletResponse response) throws IOException{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/gauge");
		return mv;
	}
	
	
	/**
	 * 跳转到雷达图页面
	 * @return
	 */
	@RequestMapping("/toRadar")
	public ModelAndView toRadar(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/radar");
		return mv;
	}
	
	
	/**
	 * 跳转到常用配置页面
	 * @return
	 */
	@RequestMapping("/toCustom")
	public ModelAndView toCustom(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/example/echarts/customChart");
		return mv;
	}
	
	
	  
}
