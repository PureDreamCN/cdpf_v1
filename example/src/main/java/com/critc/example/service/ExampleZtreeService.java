/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:example
 */
package com.critc.example.service;

import org.springframework.stereotype.Service;

import com.critc.util.file.FileUtil;


/**
 * 
 * what:     Ztree示例Service. <br/>
 * when:    (这里描述这个类的适用时机 – 可选).<br/>
 * how:     (这里描述这个类的使用方法 – 可选).<br/>
 * warning: (这里描述这个类的注意事项 – 可选).<br/>
 * 
 *
 * @author 刘正荣 created on 2017年11月3日
 */
@Service
public class ExampleZtreeService {
	

	/**
	 * 
	 * what:    从asyncData.json中读取节点数据 <br/>
	 * when:    (这里描述这个方法适用时机 – 可选).<br/>
	 * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public String getAsyncData() {
	    String realPath = FileUtil.class.getResource("/file/example/ztree/asyncData.json").getPath();
		return FileUtil.readFile(realPath);     //所有节点;
	}




	
	
	

}
