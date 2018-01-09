/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:core
 */
package com.critc.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.sys.model.SysDic;
import com.critc.util.model.ComboboxVO;

/**
 * 
 * what: SysDicDao. <br/>
 * 
 *
 * @author 刘正荣 created on 2017年11月3日
 */
@Repository
public class SysDicDao extends BaseDao<SysDic, SysDic> {

	/**
	 * 
	 * what: 新增. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param sysDic
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public int add(SysDic sysDic) {
		String sql = "insert into t_sys_dic(id,category,category_name,code,name,display_order)"
				+ " values(seq_t_sys_dic.nextval,:category,:categoryName,:code,:name,:displayOrder)";
		return insert(sql, sysDic);
	}

	/**
	 * 
	 * what: 修改. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param sysDic
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public int update(SysDic sysDic) {
		String sql = "update t_sys_dic set category=:category,category_name=:categoryName,code=:code,name=:name,display_order=:displayOrder where id=:id";
		return update(sql, sysDic);
	}

	/**
	 * 
	 * what: 删除字典. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param id
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public int delete(int id) {
		String sql = "delete from t_sys_dic where id=? ";
		return delete(sql, id);
	}

	/**
	 * 
	 * what: 删除类别下所有字典信息. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param category
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public int deleteCategory(String category) {
		String sql = "delete from t_sys_dic where category=? ";
		return update(sql, category);
	}

	/**
	 * 
	 * what: 根据分类查找. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param category
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public List<SysDic> getByCategory(String category) {
		String sql = "select t.id,t.category,t.category_name,t.code,t.name,t.display_order from t_sys_dic t where "
				+ "category=?  and code is not null";
		return list(sql, category);
	}

	/**
	 * 
	 * what: 根据字典类别查找. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param category
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public List<SysDic> getAllCategory(String category) {
		String sql = "select t.id,t.category,t.category_name,t.code,t.name,t.display_order from t_sys_dic t where "
				+ "category=? order by t.display_order";
		return list(sql, category);
	}

	/**
	 * 
	 * what: 根据字典代码查找. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param code
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public List<SysDic> getByCode(String code) {
		String sql = "select t.id,t.category,t.category_name,t.code,t.name,t.display_order from t_sys_dic t where code=? ";
		return list(sql, code);
	}

	/**
	 * 
	 * what: 根据id获取字典信息. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param id
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public SysDic get(int id) {
		String sql = "select t.id,t.category,t.category_name,t.code,t.name,t.display_order from t_sys_dic t where id=? ";
		return get(sql, id);
	}

	/**
	 * 
	 * what: 根据类别名称获取字典信息. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param categoryName
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public List<SysDic> getByCategoryName(String categoryName) {
		String sql = "select t.id,t.category,t.category_name,t.code,t.name,t.display_order from t_sys_dic t where category_name=? ";
		return list(sql, categoryName);
	}

	/**
	 * 
	 * what: 根据字典名称获取字典信息. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param name
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public List<SysDic> getByName(String name) {
		String sql = "select t.id,t.category,t.category_name,t.code,t.name,t.display_order from t_sys_dic t where name=? ";
		return list(sql, name);
	}

	/**
	 * 
	 * what: 字典列表. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public List<SysDic> listAll() {
		String sql = "select t.id,t.category,t.category_name,t.code,t.name,t.display_order from t_sys_dic t  order by t.category, t.display_order ";
		return list(sql);
	}

	/**
	 * 
	 * what: 字典下拉框. <br/>
	 * when: (这里描述这个方法适用时机 – 可选).<br/>
	 * how: (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月1日
	 */
	public List<ComboboxVO> listCombo() {
		String sql = "select category value,category_name content from t_sys_dic where code is null order by id ";
		return listCombobox(sql);
	}

	/**
	 * what:    根据类别和字典代码查询. <br/>
	 * when:    (这里描述这个方法适用时机 – 可选).<br/>
	 * how:     (这里描述这个方法的执行流程或使用方法 – 可选).<br/>
	 * warning: (这里描述这个方法的注意事项 – 可选).<br/>
	 * 
	 * @param code   字典代码
	 * @param category  字典类别  
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月8日
	 */
	public List<SysDic> getByCodeAndCategory(String category, String code) {
		String sql = "select t.id,t.category,t.category_name,t.code,t.name,t.display_order from t_sys_dic t where code=? and category=? ";
		return list(sql,code,category);
	}

}
