package com.tutor.entity;

import java.io.File;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.context.annotation.Scope;

import com.google.gson.annotations.Expose;


@Entity
@Scope("prototype")
@Table(name="student")
public class Student implements Serializable
{
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id" , nullable=false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name="student_id",nullable=false)
	private String studentId;
	@Column(name="name")
	private String name;
	@Column(name="password")
	private String password;
	@Column(name="phone")
	private String phone;
	@Column(name="mail")
	private String mail;
	@Column(name="address")
	private String address;
	@Column(name="detailed_address")
	private String detailedAddress;
	@Column(name="grade")
	private String grade;
	@Column(name="instroduction")
	private String introduction;
	@Column(name="reg_time")
	private String regTime;
	@Column(name="last_visit_time")
	private String lastVisitTime;
	@Column(name="status",nullable=false)
	private Integer status;
	@Column(name="statement")
	private String statement;
	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy="student")
	@Expose
	private List<ShopCart> shopCarts = new ArrayList<ShopCart>();
	
	@Transient
	File stuphoto;
	@Transient
	String stuphotoFileName;
	@Transient
	String  stuphotoContentType;
	@Override
	public String toString()
	{
		return "Student [id=" + id + ", studentId=" + studentId + ", name="
				+ name + ", password=" + password + ", phone=" + phone
				+ ", mail=" + mail + ", address=" + address
				+ ", detailedAddress=" + detailedAddress + ", grade=" + grade
				+ ", introduction=" + introduction + ", regTime=" + regTime
				+ ", lastVisitTime=" + lastVisitTime + ", status=" + status
				+ ", statement=" + statement + "]";
	}
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public String getStudentId()
	{
		return studentId;
	}
	public void setStudentId(String studentId)
	{
		this.studentId = studentId;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getPhone()
	{
		return phone;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	public String getMail()
	{
		return mail;
	}
	public void setMail(String mail)
	{
		this.mail = mail;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public String getDetailedAddress()
	{
		return detailedAddress;
	}
	public void setDetailedAddress(String detailedAddress)
	{
		this.detailedAddress = detailedAddress;
	}
	public String getGrade()
	{
		return grade;
	}
	public void setGrade(String grade)
	{
		this.grade = grade;
	}
	public String getIntroduction()
	{
		return introduction;
	}
	public void setIntroduction(String introduction)
	{
		this.introduction = introduction;
	}
	public String getRegTime()
	{
		return regTime;
	}
	public void setRegTime(String regTime)
	{
		this.regTime = regTime;
	}
	public String getLastVisitTime()
	{
		return lastVisitTime;
	}
	public void setLastVisitTime(String lastVisitTime)
	{
		this.lastVisitTime = lastVisitTime;
	}
	public Integer getStatus()
	{
		return status;
	}
	public void setStatus(Integer status)
	{
		this.status = status;
	}
	public String getStatement()
	{
		return statement;
	}
	public void setStatement(String statement)
	{
		this.statement = statement;
	}
	public List<ShopCart> getShopCarts()
	{
		return shopCarts;
	}
	public void setShopCarts(List<ShopCart> shopCarts)
	{
		this.shopCarts = shopCarts;
	}
	public File getStuphoto() {
		return stuphoto;
	}
	public void setStuphoto(File stuphoto) {
		this.stuphoto = stuphoto;
	}
	public String getStuphotoFileName() {
		return stuphotoFileName;
	}
	public void setStuphotoFileName(String stuphotoFileName) {
		this.stuphotoFileName = stuphotoFileName;
	}
	public String getStuphotoContentType() {
		return stuphotoContentType;
	}
	public void setStuphotoContentType(String stuphotoContentType) {
		this.stuphotoContentType = stuphotoContentType;
	}
	
}
