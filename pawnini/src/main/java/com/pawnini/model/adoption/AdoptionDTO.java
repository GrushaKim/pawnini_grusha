package com.pawnini.model.adoption;

import java.sql.Date;

public class AdoptionDTO {

	private int adoption_id;
	private String adoption_name;
	private String adoption_title;
	private String adoption_content;
	private String adoption_f_image;
	private Date adoption_date;
	private String member_id;
	private int paws_id;
	
	
	@Override
	public String toString() {
		return "AdoptionDTO [adoption_id=" + adoption_id + ", adoption_name=" + adoption_name + ", adoption_title="
				+ adoption_title + ", adoption_content=" + adoption_content + ", adoption_f_img=" + adoption_f_image
				+ ", adoption_date=" + adoption_date + ", member_id=" + member_id + ", paws_id=" + paws_id + "]";
	}
	public int getAdoption_id() {
		return adoption_id;
	}
	public void setAdoption_id(int adoption_id) {
		this.adoption_id = adoption_id;
	}
	public String getAdoption_name() {
		return adoption_name;
	}
	public void setAdoption_name(String adoption_name) {
		this.adoption_name = adoption_name;
	}
	public String getAdoption_title() {
		return adoption_title;
	}
	public void setAdoption_title(String adoption_title) {
		this.adoption_title = adoption_title;
	}
	public String getAdoption_content() {
		return adoption_content;
	}
	public void setAdoption_content(String adoption_content) {
		this.adoption_content = adoption_content;
	}
	public String getAdoption_f_image() {
		return adoption_f_image;
	}
	public void setAdoption_f_image(String adoption_f_image) {
		this.adoption_f_image = adoption_f_image;
	}
	public Date getAdoption_date() {
		return adoption_date;
	}
	public void setAdoption_date(Date adoption_date) {
		this.adoption_date = adoption_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPaws_id() {
		return paws_id;
	}
	public void setPaws_id(int paws_id) {
		this.paws_id = paws_id;
	}
	
	
}
