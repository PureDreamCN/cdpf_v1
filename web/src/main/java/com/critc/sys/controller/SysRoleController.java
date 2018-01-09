package com.critc.sys.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.critc.core.pub.PubConfig;
import com.critc.sys.model.SysResource;
import com.critc.sys.model.SysRole;
import com.critc.sys.service.SysResourceService;
import com.critc.sys.service.SysRoleService;
import com.critc.sys.vo.SysRoleSearchVO;
import com.critc.util.code.GlobalCode;
import com.critc.util.page.PageNavigate;
import com.critc.util.session.SessionUtil;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;

/**
 * 
 * what: 系统角色处理Controller
 * 
 *
 * @author 孔垂云 created on 2017年11月6日
 */
@RequestMapping("/sys/role")
@Controller
public class SysRoleController {
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private PubConfig pubConfig;
	@Autowired
	private SysResourceService sysResourceService;

	/**
	 * 
	 * what: 进入角色维护界面
	 * 
	 * @param request
	 * @param response
	 * @param sysRoleSearchVO
	 * @return
	 *
	 * @author 孔垂云 created on 2017年11月6日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response,
			SysRoleSearchVO sysRoleSearchVO) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/sys/role/index");
		// 获取查询总数
		int recordCount = sysRoleService.count(sysRoleSearchVO);
		String url = createUrl(sysRoleSearchVO);
		// 定义分页对象
		PageNavigate pageNavigate = new PageNavigate(url, sysRoleSearchVO.getPageIndex(), recordCount);
		List<SysRole> list = sysRoleService.list(sysRoleSearchVO);
		// 设置分页的变量
		mv.addObject("pageNavigate", pageNavigate);
		mv.addObject("list", list);
		// 设置返回url
		BackUrlUtil.createBackUrl(mv, request, url);
		return mv;
	}

	/**
	 * 
	 * what: 设置分页url，一般有查询条件的才会用到
	 * 
	 * @param sysRoleSearchVO
	 * @return
	 *
	 * @author 李红 created on 2017年11月6日
	 */
	private String createUrl(SysRoleSearchVO sysRoleSearchVO) {
		String url = pubConfig.getDynamicServer() + "/sys/role/index.htm?";
		// 如果为模糊查询，要把该字段encode
		if (StringUtil.isNotNullOrEmpty(sysRoleSearchVO.getName())) {
			url += "&name=" + sysRoleSearchVO.getName();
		}
		return url;
	}

	/**
	 * 
	 * what: 新增角色
	 * 
	 * @param request
	 * @param response
	 * @return
	 *
	 * @author 孔垂云 created on 2017年11月6日
	 */
	@RequestMapping("/toAdd")
	public ModelAndView toAdd(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/sys/role/add");
		// 设置资源父节点
		int parentId = 0;
		// 所有菜单
		List<SysResource> listResource = sysResourceService.listByIsbuildin(parentId);
		mv.addObject("listModule", listResource);
		// 所有功能按钮
		List<SysResource> listFunction = sysResourceService.listByType(2);
		mv.addObject("listFunction", listFunction);
		// 设置返回的url
		BackUrlUtil.setBackUrl(mv, request);
		return mv;
	}

	/**
	 * 
	 * what: 修改角色
	 * 
	 * @param request
	 * @param response
	 * @param id
	 * @return
	 *
	 * @author 孔垂云 created on 2017年11月6日
	 */
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(HttpServletRequest request, HttpServletResponse response, int id) {
		ModelAndView mv = new ModelAndView();
		SysRole sysRole = sysRoleService.get(id);
		mv.addObject("sysRole", sysRole);
		mv.setViewName("/sys/role/update");
		// 所有模块
		List<SysResource> listResource = sysResourceService.listByIsbuildin(0);
		mv.addObject("listModule", listResource);
		// 所有功能按钮
		List<SysResource> listFunction = sysResourceService.listByType(2);
		mv.addObject("listFunction", listFunction);
		String checkButton = sysRoleService.checkResourceAndFunction(sysRole.getId());
		mv.addObject("checkButton", checkButton);
		// 设置返回的url
		BackUrlUtil.setBackUrl(mv, request);
		return mv;
	}

	/**
	 * 
	 * what: 新增角色
	 * 
	 * @param request
	 * @param response
	 * @param sysRole
	 * @return
	 *
	 * @author 孔垂云 created on 2017年11月6日
	 */
	@RequestMapping("/add")
	public String add(HttpServletRequest request, HttpServletResponse response,@Valid SysRole sysRole) {
		// 创建人
		sysRole.setCreatedBy(SessionUtil.getRealname(request));
		// 修改人
		sysRole.setLastModifiedBy(SessionUtil.getRealname(request));
		String moduleArr = WebUtil.getSafeStr(request.getParameter("moduleArr"));
		String functionArr = WebUtil.getSafeStr(request.getParameter("functionArr"));
		// 创建人的id
		sysRole.setCreateUserId(SessionUtil.getUserSession(request).getUserId());
		// 是否可删除
		sysRole.setIsDelete(1);
		int flag = sysRoleService.add(sysRole, moduleArr, functionArr);
		if (flag == 0) {
			// 角色新增失败
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else if (flag == 2) {
			// msg=" + StringUtil.encodeUrl("角色名称已存在！");
			return "forward:/error.htm?resultCode=20004";
		} else {
			// 角色新增成功
			return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
		}
	}

	/**
	 * 
	 * what: 修改角色
	 * 
	 * @param request
	 * @param response
	 * @param sysRole
	 * @return
	 *
	 * @author 孔垂云 created on 2017年11月6日
	 */
	@RequestMapping("/update")
	public String update(HttpServletRequest request, HttpServletResponse response,@Valid SysRole sysRole) {
		// 修改人
		sysRole.setLastModifiedBy(SessionUtil.getRealname(request));
		String moduleArr = WebUtil.getSafeStr(request.getParameter("moduleArr"));
		String functionArr = WebUtil.getSafeStr(request.getParameter("functionArr"));
		int flag = sysRoleService.update(sysRole, moduleArr, functionArr);
		if (flag == 0) {
			// 角色修改失败
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		} else if (flag == 2) {
			// 存在相同的角色名称，不能修改
			return "forward:/error.htm?resultCode=20004";
		} else {
			// 角色修改成功
			return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;
		}
	}

	/**
	 * 
	 * what: 删除角色
	 * 
	 * @param request
	 * @param response
	 * @param id
	 * @return
	 *
	 * @author 孔垂云 created on 2017年11月6日
	 */
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, HttpServletResponse response, int id) {
		int flag = sysRoleService.delete(id);
		if (flag == 0){
			// 角色删除失败
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		}else if (flag == 2){
			// 存在用户，不能删除
			return "forward:/error.htm?resultCode=20108";
		}
		else{
			// 角色删除成功
			return "forward:/success.htm?resultCode=" + GlobalCode.DELETE_SUCCESS;
		}
	}
}
