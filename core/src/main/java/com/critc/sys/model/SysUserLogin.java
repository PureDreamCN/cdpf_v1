package com.critc.sys.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class SysUserLogin {
	 	private long id;//编号
	    private int userId;//用户id
	    private Date loginDate;//登录时间
	    private String loginIp;//登录IP
	    private String terminal;//登录终端
	    private String explorerType;//浏览器类型
	    private String explorerVersion;//浏览器版本
	    private String username;//登录账号
	    private String realname;//真实姓名
	    private String sessionid;//sessionId
	    
		public long getId() {
			return id;
		}
		public void setId(long id) {
			this.id = id;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public String getLoginIp() {
			return loginIp;
		}
		public void setLoginIp(String loginIp) {
			this.loginIp = loginIp;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getRealname() {
			return realname;
		}
		public void setRealname(String realname) {
			this.realname = realname;
		}
	    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
        public Date getLoginDate() {
			return loginDate;
		}
		public void setLoginDate(Date loginDate) {
			this.loginDate = loginDate;
		}
		public String getTerminal() {
			return terminal;
		}
		public void setTerminal(String terminal) {
			this.terminal = terminal;
		}
		public String getSessionid() {
			return sessionid;
		}
		public void setSessionid(String sessionid) {
			this.sessionid = sessionid;
		}
		public String getExplorerVersion() {
			return explorerVersion;
		}
		public void setExplorerVersion(String explorerVersion) {
			this.explorerVersion = explorerVersion;
		}
		public String getExplorerType() {
			return explorerType;
		}
		public void setExplorerType(String explorerType) {
			this.explorerType = explorerType;
		}
}
