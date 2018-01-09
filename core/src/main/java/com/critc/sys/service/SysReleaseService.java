/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:core
 */
package com.critc.sys.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.critc.sys.dao.SysReleaseDao;
import com.critc.sys.model.SysRelease;
import com.critc.sys.vo.SysReleaseSearchVO;
import com.critc.util.file.FileUtil;
import com.critc.util.string.StringUtil;

/**
 * 
 * what: 系统升级说明 Service. <br/>
 * when: (这里描述这个类的适用时机 – 可选).<br/>
 * how: (这里描述这个类的使用方法 – 可选).<br/>
 * warning: (这里描述这个类的注意事项 – 可选).<br/>
 * 
 *
 * @author 刘正荣 created on 2017年10月31日
 */
@Service
public class SysReleaseService {

	@Autowired
	private SysReleaseDao sysReleaseDao;

	/**
	 * 
	 * what: 新增系统升级信息. <br/>
	 * when: 新增页面点击保存.<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param sysRelease
	 * @param basePath
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月31日
	 * @param content 
	 */
	public int add(SysRelease sysRelease, String basePath, String content) {
		String path = "\\sys\\release\\\\" +sysRelease.getReleaseDate().replaceAll("-", "") + "-" + sysRelease.getVersion() + ".txt";
		int flag = FileUtil.writeFile(basePath + path, content);
		sysRelease.setReleaseContent(path);

		if (flag == 1 && sysReleaseDao.add(sysRelease) == 1) {
			return 1;
		}

		return 0;

	}

	/**
	 * 
	 * what: 修改系统升级信息. <br/>
	 * when: 修改页面点击保存.<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param sysRelease
	 * @param basePath
	 * @param content
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月31日
	 */
	public int update(SysRelease sysRelease, String basePath, String content) {
		int flag = FileUtil.writeFile(basePath + sysRelease.getReleaseContent(), content);

		if (flag == 1 && sysReleaseDao.update(sysRelease) == 1) {
			return 1;
		}

		return 0;
	}

	/**
	 * 
	 * what: 删除系统升级信息. <br/>
	 * when: 删除系统信息.<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param id
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月31日
	 */
	public int delete(int id) {
		return sysReleaseDao.delete(id);
	}

	/**
	 * 
	 * what: 根据id获取系统升级信息. <br/>
	 * when: 修改系统信息时.<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param id
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月31日
	 */
	public SysRelease get(int id) {
		return sysReleaseDao.get(id);
	}

	/**
	 * 
	 * what: 系统升级信息列表. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param sysReleaseSearchVO
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月31日
	 */
	public List<SysRelease> list(SysReleaseSearchVO sysReleaseSearchVO) {
		return sysReleaseDao.list(sysReleaseSearchVO);
	}

	/**
	 * 
	 * what: 查询系统升级信息记录条数 <br/>
	 * when: 分页时.<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param sysReleaseSearchVO
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月31日
	 */
	public int count(SysReleaseSearchVO sysReleaseSearchVO) {
		return sysReleaseDao.count(sysReleaseSearchVO);
	}

	/**
	 * what: 判断新添加的版本号是否唯一. <br/>
	 * when: 添加时使用.<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request
	 * @param name
	 * @param version
	 * @return 0表示与修改前的相同,1表示数据库中不存在,2表示数据库中存在
	 *
	 * @author 刘正荣 created on 2017年10月30日
	 */
	public int checkVersionExist(String preName, String preVersion, String name, String version) {
		List<SysRelease> sysReleasesList = null;
		if (StringUtil.isNullOrEmpty(name) || StringUtil.isNullOrEmpty(version)) {
			return 1;
		}

		// 判断与修改前的是否相同
		if (StringUtil.isNotNullOrEmpty(preName) && StringUtil.isNotNullOrEmpty(preVersion)) {
			if (preName.equals(name) && preVersion.equals(version)) {
				return 0;
			}
		}

		sysReleasesList = sysReleaseDao.getByNameAndVesion(name, version);

		// 数据库中是否存在
		if (sysReleasesList != null && !sysReleasesList.isEmpty()) {
			return 2;
		}

		return 1;

	}

	/**
	 * what:  读取文件. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how:  (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param path
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 * @param request 
	 */
	public String readFile(String base,String path, HttpServletRequest request) {
		String basePath = null;
		if (StringUtil.isNullOrEmpty(path)) {
			return "NOT EXIST";
		}

		if (!path.equals("template.txt")) {
			basePath = base + "\\"+ path ;
		}else{
			basePath = request.getServletContext().getRealPath("/template/sys/release/template.txt");
		}

		return FileUtil.readFile(basePath);
	}

}
