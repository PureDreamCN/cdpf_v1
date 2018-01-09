package com.critc.sys.model;



import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.critc.util.model.BaseModel;

/**
 * 
 * what: 组织机构实体类
 * 
 *
 * @author 李红 created on 2017年10月30日
 */
public class SysDepartment extends BaseModel {
	private int id;// 编号
	@NotEmpty
	@Size(max=20)
	private String name;// 名称
	private Integer parentId;// 上级节点id
	private String parentName;// 上级节点名称
	@NotNull
	private int type;// 部门类型
	private String typeName;// 部门名称
	@Size(max=20)
	private String code;// 部门编码
	@NotNull
	@Digits(integer = 6,fraction = 0)
	private int displayOrder;// 排序
	@Size(max=100)
	private String note; // 备注
	private int cnt;// 子节点数量

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "SysDepartment {"+ 
				"id=" + id + 
				", name='" + name  + '\'' + 
				", parentId=" + parentId + 
				", parentName='" + parentName + '\'' +
				", type=" + type + 
				", typeName='" + typeName+ '\'' + 
				", code='" + code + '\'' +
				", displayOrder=" + displayOrder + 
				", note='" + note + '\'' + 
				", cnt="+ cnt +
				"}";
	}

}
