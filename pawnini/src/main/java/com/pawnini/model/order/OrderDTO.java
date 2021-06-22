package com.pawnini.model.order;

import java.sql.Date;

public class OrderDTO {
	private String ord_id;
	private String recipient_name;
	private Date ord_date;
	private String ord_postcode;
	private String ord_f_addr;
	private String ord_s_addr;
	private String ord_phone;
	private String member_id;
	private int ord_total;
	public String getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(String ord_id) {
		this.ord_id = ord_id;
	}
	public String getRecipient_name() {
		return recipient_name;
	}
	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}
	public Date getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(Date ord_date) {
		this.ord_date = ord_date;
	}
	public String getOrd_postcode() {
		return ord_postcode;
	}
	public void setOrd_postcode(String ord_postcode) {
		this.ord_postcode = ord_postcode;
	}
	public String getOrd_f_addr() {
		return ord_f_addr;
	}
	public void setOrd_f_addr(String ord_f_addr) {
		this.ord_f_addr = ord_f_addr;
	}
	public String getOrd_s_addr() {
		return ord_s_addr;
	}
	public void setOrd_s_addr(String ord_s_addr) {
		this.ord_s_addr = ord_s_addr;
	}
	public String getOrd_phone() {
		return ord_phone;
	}
	public void setOrd_phone(String ord_phone) {
		this.ord_phone = ord_phone;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getOrd_total() {
		return ord_total;
	}
	public void setOrd_total(int ord_total) {
		this.ord_total = ord_total;
	}
	@Override
	public String toString() {
		return "OrderDTO [ord_id=" + ord_id + ", recipient_name=" + recipient_name + ", ord_date=" + ord_date
				+ ", ord_postcode=" + ord_postcode + ", ord_f_addr=" + ord_f_addr + ", ord_s_addr=" + ord_s_addr
				+ ", ord_phone=" + ord_phone + ", member_id=" + member_id + ", ord_total=" + ord_total + "]";
	}
	
}
