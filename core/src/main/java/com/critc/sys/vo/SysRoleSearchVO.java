package com.critc.sys.vo;

import com.critc.util.page.PageSearchVO;

/**
 * 角色查询VO
 *
 * @author 孔垂云
 * @date 2017-06-13
 */
public class SysRoleSearchVO extends PageSearchVO {
    private Integer isBuildin = 0;//是否内置角色，默认为0
    private String name;//角色名称
    public Integer getIsBuildin() {
        return isBuildin;
    }

    public void setIsBuildin(Integer isBuildin) {
        this.isBuildin = isBuildin;
    }

    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	//角色名称模糊查询
    public String getNameStr() {
        return "%" + name + "%";
    }

	@Override
    public String toString() {
        return "SysRoleSearchVO{" +
                "isBuildin=" + isBuildin +
                "name='" + name +'\''+
                '}';
    }
}
