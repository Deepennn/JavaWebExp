package bean;

import java.io.Serializable;

public class Abean implements Serializable {

	private String name="";
	private String sex="";
	private String birthday="";
	private String degree="";
	private String bio="";
	
	public String getName(){
		return this.name;
	}
	public void setName(String name) {
		this.name=name;
	}
	public String getSex(){
	    return this.sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
}
