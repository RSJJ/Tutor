package com.tutor.entity;

import java.io.File;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

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



/**
 * @author STerOTto
 * 教师实体类
 */
@Entity
@Scope("prototype")
@Table(name = "teacher")
public class Teacher implements Serializable
{
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id",nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="teacher_id",nullable=false)
	private String teacherId;//主键
	@Column(name="name")
	private String name;
	@Column(name="password")
	private String password;
	@Column(name="sex")
	private String sex;
	@Column(name="mail")
	private String mail;
	@Column(name="phone")
	private String phone;
	@Column(name="address")
	private String address;
	@Column(name="detailed_address")
	private String detailedAddress;
	@Column(name="job")
	private String job;
	@Column(name="icon")
	private String icon;
	@Column(name="licence")
	private String licence;
	@Column(name="instroduction")
	private String introduction;
	@Column(name="detailed_introduction")
	private String detailedIntroduction;
	@Column(name="card_no")
	private String cardNo;
	@Column(name="reg_time")
	private String regTime;
	@Column(name="pass_time")
	private String passTime;
	@Column(name="last_visit_time")
	private String lastVisitTime;
	@Column(name="best_nums",nullable=false)
	private Integer bestNums;
	@Column(name="normal_nums")
	private Integer normalNums;
	@Column(name="bad_nums")
	private Integer badNums;
	@Column(name="all_nums")
	private Integer allNums;
	@Column(name="status",nullable=false)
	private Integer status;
	@Column(name="statement")
	private String statement;
	

	@Column(name="lng")
	private Double lng;
	@Column(name="lat")
	private Double lat;
	@Column(name="school")
	private String school;
	@Column(name="profession")
	private String profession;
	@Column(name="city")
	private String city;
	@Column(name="card_type")
	private String cardType;

	@OneToMany(fetch=FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="teacher")
	@Expose
	private Set<NorCourse> norCourse 	= new HashSet<NorCourse>();
	
	@OneToMany(fetch=FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="teacher")
	@Expose
	private Set<GraCourse> graCourse 	= new HashSet<GraCourse>();
	

	@Transient
	File iconphoto;
	@Transient
	String iconphotoFileName;
	@Transient
	String  iconphotoContentType;
	@Transient
	File licencephoto;
	@Transient
	String licencephotoFileName;
	@Transient
	String  licencephotoContentType;
	
	@Override
	public String toString()
	{
		return "Teacher [id=" + id + ", teacherId=" + teacherId + ", name="
				+ name + ", password=" + password + ", sex=" + sex + ", mail="
				+ mail + ", phone=" + phone + ", address=" + address
				+ ", detailedAddress=" + detailedAddress + ", job=" + job
				+ ", icon=" + icon + ", licence=" + licence + ", introduction="
				+ introduction + ", detailedIntroduction="
				+ detailedIntroduction + ", cardNo=" + cardNo + ", regTime="
				+ regTime + ", passTime=" + passTime + ", lastVisitTime="
				+ lastVisitTime + ", bestNums=" + bestNums + ", normalNums="
				+ normalNums + ", badNums=" + badNums + ", allNums=" + allNums
				+ ", status=" + status + ", statement=" + statement + "]";
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	
	public String getTeacherId()
	{
		return teacherId;
	}
	public void setTeacherId(String teacherId)
	{
		this.teacherId = teacherId;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getSex()
	{
		return sex;
	}
	public void setSex(String sex)
	{
		this.sex = sex;
	}
	public String getMail()
	{
		return mail;
	}
	public void setMail(String mail)
	{
		this.mail = mail;
	}
	public String getPhone()
	{
		return phone;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
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
	public String getJob()
	{
		return job;
	}
	public void setJob(String job)
	{
		this.job = job;
	}
	public String getIcon()
	{
		return icon;
	}
	public void setIcon(String icon)
	{
		this.icon = icon;
	}
	public String getLicence()
	{
		return licence;
	}
	public void setLicence(String licence)
	{
		this.licence = licence;
	}
	public String getIntroduction()
	{
		return introduction;
	}
	public void setIntroduction(String introduction)
	{
		this.introduction = introduction;
	}
	public String getDetailedIntroduction()
	{
		return detailedIntroduction;
	}
	public void setDetailedIntroduction(String detailedIntroduction)
	{
		this.detailedIntroduction = detailedIntroduction;
	}
	public String getCardNo()
	{
		return cardNo;
	}
	public void setCardNo(String cardNo)
	{
		this.cardNo = cardNo;
	}
	
	public Integer getBestNums()
	{
		return bestNums;
	}
	public void setBestNums(Integer bestNums)
	{
		this.bestNums = bestNums;
	}
	public Integer getNormalNums()
	{
		return normalNums;
	}
	public void setNormalNums(Integer normalNums)
	{
		this.normalNums = normalNums;
	}
	public Integer getBadNums()
	{
		return badNums;
	}
	public void setBadNums(Integer badNums)
	{
		this.badNums = badNums;
	}
	public Integer getAllNums()
	{
		return allNums;
	}
	public void setAllNums(Integer allNums)
	{
		this.allNums = allNums;
	}
	public String getRegTime()
	{
		return regTime;
	}
	public void setRegTime(String regTime)
	{
		this.regTime = regTime;
	}
	public String getPassTime()
	{
		return passTime;
	}
	public void setPassTime(String passTime)
	{
		this.passTime = passTime;
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
	
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String carType) {
		this.cardType = carType;
	}
	
	
	public File getIconphoto() {
		return iconphoto;
	}
	public void setIconphoto(File iconphoto) {	
		this.iconphoto = iconphoto;
	}
	public String getIconphotoFileName() {
		return iconphotoFileName;
	}
	public void setIconphotoFileName(String iconphotoFileName) {
		this.iconphotoFileName = iconphotoFileName;
	}
	public String getIconphotoContentType() {
		return iconphotoContentType;
	}
	public void setIconphotoContentType(String iconphotoContentType) {
		this.iconphotoContentType = iconphotoContentType;
	}
	public File getLicencephoto() {
		return licencephoto;
	}
	public void setLicencephoto(File licencephoto) {
		this.licencephoto = licencephoto;
	}
	public String getLicencephotoFileName() {
		return licencephotoFileName;
	}
	public void setLicencephotoFileName(String licencephotoFileName) {
		this.licencephotoFileName = licencephotoFileName;
	}
	public String getLicencephotoContentType() {
		return licencephotoContentType;
	}
	public void setLicencephotoContentType(String licencephotoContentType) {
		this.licencephotoContentType = licencephotoContentType;
	}
	public Set<NorCourse> getNorCourse() {
		return norCourse;
	}
	public void setNorCourse(Set<NorCourse> norCourse) {
		this.norCourse = norCourse;
	}
	public Set<GraCourse> getGraCourse() {
		return graCourse;
	}
	public void setGraCourse(Set<GraCourse> graCourse) {
		this.graCourse = graCourse;
	}
	

}
