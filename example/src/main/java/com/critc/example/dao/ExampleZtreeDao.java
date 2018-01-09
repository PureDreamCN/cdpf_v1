/**
 * Copyright 2017 弘远技术研发中心. All rights reserved
 * Project Name:cdpf_v1
 * Module Name:example
 */
package com.critc.example.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.critc.core.dao.BaseDao;
import com.critc.example.model.ExampleUeditor;
import com.critc.example.model.ZtreeNode;

/**
 * 
 * what: ExampleZtreeDao. <br/>
 * 
 *
 * @author 刘正荣 created on 2017年11月3日
 */
@Repository
public class ExampleZtreeDao extends BaseDao<ZtreeNode, ZtreeNode> {

	/**
	 * 
	 * what: 获取所有记录. <br/>
	 * 
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public List<ZtreeNode> list() {
		String sql = "select *" + " from t_example_ztreenode order by id";
		return list(sql);
	}

	/**
	 * 
	 * what: 新增. <br/>
	 * 
	 * @param ztreeNode
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public int add(ZtreeNode ztreeNode) {
		String sql = "insert into t_example_ztreenode(id,pId,name)"
				+ " values(seq_t_example_ztreenode.nextval,:pId,:name)";
		return insert(sql, ztreeNode);
	}

	/**
	 * 
	 * what: 获取指定id的记录. <br/>
	 * 
	 * @param id
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public ZtreeNode get(int id) {
		String sql = "select * from t_example_ztreenode t where id=?";
		return get(sql, id);
	}

	/**
	 * 
	 * what: 更新. <br/>
	 * 
	 * @param exampleUeditor
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public int update(ExampleUeditor exampleUeditor) {
		String sql = "update t_example_ztreenode set pid=:pid,name=:name where id=:id";
		return update(sql, exampleUeditor);
	}

	/**
	 * 
	 * what: 删除. <br/>
	 * 
	 * @param id
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public int delete(int id) {
		String sql = "delete from t_example_ztreenode where id=?";
		return delete(sql, id);
	}

	/**
	 * 
	 * what: 查数量. <br/>
	 * 
	 * @return
	 *
	 * @author 刘正荣 created on 2017年11月3日
	 */
	public int count() {
		String sql = "select count(*) from t_example_ztreenode where 1=1";
		return count(sql);
	}

}
