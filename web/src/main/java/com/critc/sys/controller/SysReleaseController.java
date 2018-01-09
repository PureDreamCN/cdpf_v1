
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
import com.critc.sys.model.SysRelease;
import com.critc.sys.service.SysReleaseService;
import com.critc.sys.vo.SysReleaseSearchVO;
import com.critc.util.code.GlobalCode;
import com.critc.util.page.PageNavigate;
import com.critc.util.string.BackUrlUtil;
import com.critc.util.string.StringUtil;
import com.critc.util.web.WebUtil;

/**
 * 
 *  系统升级  Controller. <br/>
 * when:    (这里描述这个类的适用时机 – 可选).<br/>
 * how:     (这里描述这个类的使用方法 – 可选).<br/>
 * warning: (这里描述这个类的注意事项 – 可选).<br/>
 * 
 *
 * @author liuzr created on 2017年10月31日
 */
@Controller
@RequestMapping("/sys/release")
public class SysReleaseController {
	
	@Autowired
	private SysReleaseService sysReleaseService;
	
	@Autowired
	private PubConfig pubConfig;
	
	
	/**
	 * 
	 * what:    跳转到添加系统说明主页. <br/>
	 * when:    (这里描述这个方法适用时机 – 可选).<br/>
	 * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request
	 * @param sysReleaseSearchVO
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月31日
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request,SysReleaseSearchVO sysReleaseSearchVO){
		ModelAndView mv = new ModelAndView();
		String url = createUrl(sysReleaseSearchVO);
        List<SysRelease> list = sysReleaseService.list(sysReleaseSearchVO);
        int recordCount = sysReleaseService.count(sysReleaseSearchVO);// 获取查询总数
        PageNavigate pageNavigate = new PageNavigate(url, sysReleaseSearchVO.getPageIndex(), recordCount);//定义分页对象
        mv.addObject("list", list);// 把获取的记录放到mv里面
        mv.setViewName("/sys/release/index");// 跳转至指定页面
        BackUrlUtil.createBackUrl(mv, request, url);// 设置返回url
        mv.addObject("pageNavigate", pageNavigate);// 设置分页的变量
        BackUrlUtil.createBackUrl(mv, request, url);// 设置返回url
        return mv;
	}
	
	
	/**
	 * 
	 * what:    设置返回的url. <br/>
	 * when:    (这里描述这个方法适用时机 – 可选).<br/>
	 * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param sysReleaseSearchVO
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月31日
	 */
    private String createUrl(SysReleaseSearchVO sysReleaseSearchVO) {
        String url = pubConfig.getDynamicServer() + "/sys/release/index.htm?";
        if(StringUtil.isNotNullOrEmpty(sysReleaseSearchVO.getName())){
        	url +="&name=" +sysReleaseSearchVO.getName();
        }
        
        if(StringUtil.isNotNullOrEmpty(sysReleaseSearchVO.getVersion())){
        	url +="&version=" +sysReleaseSearchVO.getVersion();
        }
        
        if(StringUtil.isNotNullOrEmpty(sysReleaseSearchVO.getReleaseBy())){
        	url +="&releaseBy=" +sysReleaseSearchVO.getReleaseBy();
        }
        
        if(StringUtil.isNotNullOrEmpty(sysReleaseSearchVO.getReleaseDate())){
        	url +="&releaseDate=" +sysReleaseSearchVO.getReleaseDate();
        }
        return url;
    }
    
    
    
    
    /**
     * 
     * what:    跳转到添加系统说明. <br/>
     * when:    (这里描述这个方法适用时机 – 可选).<br/>
     * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
     * warning: (这里描述这个方法的注意事项 – 可选).<br/>
     * 
     * @param request
     * @return
     *
     * @author 刘正荣 created on 2017年10月31日
     */
	@RequestMapping("/toAdd")
	public ModelAndView toAdd(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/sys/release/add");
		BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
		return mv;
	}
	
	
	
	
	
	
	
	/**
	 * 
	 * what:    跳转到系统升级信息更新页面. <br/>
	 * when:    点击修改时.<br/>
	 * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request
	 * @param id
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月31日
	 */
	@RequestMapping("/toUpdate")
	public ModelAndView toUpdate(HttpServletRequest request,int id){
		ModelAndView mv = new ModelAndView();
		SysRelease sysRelease = sysReleaseService.get(id);
		mv.setViewName("/sys/release/update");
		mv.addObject("sysRelease", sysRelease);
		BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
		return mv;
	}
	
	
	/**
	 * 
	 * what:    跳转到查看升级信息详情页面. <br/>
	 * when:    点击查看时.<br/>
	 * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request
	 * @param id
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月31日
	 */
	@RequestMapping("/toDetail")
	public ModelAndView toDetail(HttpServletRequest request,int id){
		ModelAndView mv = new ModelAndView();
		SysRelease sysRelease = sysReleaseService.get(id);
		mv.setViewName("/sys/release/detail");
		mv.addObject("sysRelease", sysRelease);
		BackUrlUtil.setBackUrl(mv, request);// 设置返回的url
		return mv;
	}
	
	
	
	/**
	 * 
	 * what:    添加系统升级信息. <br/>
	 * when:    添加系统升级信息时，点击保存.<br/>
	 * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request
	 * @param sysRelease
	 * @return
	 *
	 * @author liuzr created on 2017年10月31日
	 */
	@RequestMapping("/add")
	public String add(HttpServletRequest request, @Valid SysRelease sysRelease,String content){
		String basePath = pubConfig.getFileUploadPath();
		int flag = sysReleaseService.add(sysRelease,basePath,content);
		
		if (flag == 0){
	        return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;//字典信息新增失败;
		}
	    else{
	        return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;//字典信息新增成功;
	    }
	}
	
	 /**
	  * 
	  * what:    更新系统升级信息. <br/>
	  * when:    修改页面中，点击保存.<br/>
	  * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	  * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	  * 
	  * @param request
	  * @param response
	  * @param sysRelease
	  * @param content
	  * @return
	  *
	  * @author 刘正荣 created on 2017年10月31日
	  */
	 @RequestMapping("/update")
     public String update(HttpServletRequest request, HttpServletResponse response, @Valid SysRelease sysRelease,String content) {
	    String basePath = pubConfig.getFileUploadPath();
        int flag = sysReleaseService.update(sysRelease,basePath,content);
        if (flag == 0){
            return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;//用户信息修改失败;
        }
        else{
            return "forward:/success.htm?resultCode=" + GlobalCode.SAVE_SUCCESS;//用户信息修改成功;
        }
     }
	
	
    /**
     * 	
     * what:    删除系统升级信息. <br/>
     * when:    点击删除.<br/>
     * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
     * warning: (这里描述这个方法的注意事项 – 可选).<br/>
     * 
     * @param id
     * @return
     *
     * @author liuzr created on 2017年10月31日
     */
	@RequestMapping("/delete")
	public String delete(int id){
		int flag = sysReleaseService.delete(id);
		if (flag == 0){
			return "forward:/error.htm?resultCode=" + GlobalCode.OPERA_FAILURE;
		}
		else{
			return "forward:/success.htm?resultCode=" + GlobalCode.OPERA_SUCCESS;
		}
	}
	
	
    
	
	
	
	/**
	 * 
	 * what:    从指定路径中读取文件. <br/>
	 * when:    添加，修改，查看系统详情时使用 .<br/>
	 * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param request  
	 * @param path
	 * @return
	 *
	 * @author 刘正荣 created on 2017年10月30日
	 */
    @RequestMapping("/readFile")
	public void readFile(HttpServletRequest request,HttpServletResponse response,String path){
    	
		WebUtil.out(response, sysReleaseService.readFile(pubConfig.getFileUploadPath(),path,request));
		
	}
    
    /**
     * 
     * what:    检查系统版本号是否唯一. <br/>
     * when:    添加和修改系统升级信息时使用.<br/>
     * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
     * warning: (这里描述这个方法的注意事项 – 可选).<br/>
     * 
     * @param request
     * @param response
     * @param name
     * @param version
     *
     * @author 刘正荣 created on 2017年10月30日
     */
    @RequestMapping("/checkVersionExist")
    public void checkVersionExist(HttpServletRequest request,HttpServletResponse response,String preName,String preVersion, String name,String version){
    	
    	
    	int flag = sysReleaseService.checkVersionExist(preName,preVersion,name, version);
    	
	    if(flag ==0){
		    WebUtil.out(response, "{\"result\":" + 0 + ",\"message\":\"" + "与修改前相同" + "\"}");
	    }else if(flag ==1){
		    WebUtil.out(response, "{\"result\":" + 1 + ",\"message\":\"" + "数据库中不存在" + "\"}");
	    } else {
	    	WebUtil.out(response, "{\"result\":" + 2 + ",\"message\":\"" + "数据库中已存在" + "\"}");
	    }
    }
	
    

}
