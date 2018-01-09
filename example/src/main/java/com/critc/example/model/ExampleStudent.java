package com.critc.example.model;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * 
 * what: 学生实体类
 * 
 *
 * @author 李红 created on 2017年10月30日
 */
public class ExampleStudent {

	private int id;// 编号
	@NotEmpty
	@Size(max=12,min=12)
	private String no;// 学号
	@NotEmpty
	private String name;// 姓名
	private String sex;// 性别0-男，1-女
	private String idcardNo;// 身份证号
	private String collegeNo;// 学院编号
	private String collegeName;// 学院名称
	private String majorNo;// 专业编号
	private String majorName;// 专业名称
	private String collegenameMajorname;// 学院名称--专业名称
	private String remark;// 备注
	private String isDelete;// 是否删除,'N'不能删除，'Y'能删除，导入数据时赋值为'Y'
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIdcardNo() {
		return idcardNo;
	}

	public void setIdcardNo(String idcardNo) {
		this.idcardNo = idcardNo;
	}

	public String getCollegeNo() {
		return collegeNo;
	}

	public void setCollegeNo(String collegeNo) {
		this.collegeNo = collegeNo;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getMajorNo() {
		return majorNo;
	}

	public void setMajorNo(String majorNo) {
		this.majorNo = majorNo;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getCollegenameMajorname() {
		return collegenameMajorname;
	}

	public void setCollegenameMajorname(String collegenameMajorname) {
		this.collegenameMajorname = collegenameMajorname;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	@Override
	public String toString() {
		return "ExampleStudent {"
				+ "id=" + id + 
				", no='" + no + '\'' + 
				", name='" + name + '\'' + 
				", sex='" + sex + '\''+ 
				", idcardNo='"+ idcardNo +'\'' + 
				", collegeNo='" + collegeNo +  '\'' + 
				", collegeName='" + collegeName +'\'' +
				", majorNo='" + majorNo+ '\'' + 
				", majorName='" + majorName + '\'' + 
				", collegenameMajorname='" + collegenameMajorname + '\'' +
				", remark='" + remark+  '\'' + 
				", isDelete='" + isDelete+  '\'' + 
				'}';
	}

}
