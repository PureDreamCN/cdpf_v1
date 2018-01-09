/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:core
 */
package com.critc.sys.vo;

import com.critc.util.page.PageSearchVO;

/**
 * 
 * what:   用户登录查询VO
 * 
 *
 * @author ycf created on 2017年10月23日
 */
public class SysUserLoginSearchVO extends PageSearchVO {
	private String username;// 登录账号
	private String loginIp;// 登录IP
	private String startDate;// 起始日期
	private String endDate;// 终止日期
	private Integer userId;//用户编号

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSearchusername() {
		return "%" + username + "%";
	}

	public String getSearchIP() {
		return "%" + loginIp + "%";
	}

	@Override
	public String toString() {
		return "SysLoginSearchVO [username=" + username + ", loginIp=" + loginIp + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
