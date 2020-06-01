package com.kosmo.mukja.service;

public class StoreDTO {
	private String username;
	private String password;
	private String store_name;
	private String store_regnum;
	private String store_phnum;
	private String store_email;
	private int store_avg;
	private String store_intro;
	private String store_time;
	private double store_lat;
	private double store_lng;
	private String store_role;
	private String enabled;
	private String authority;
	public StoreDTO() {
		
	}
	public StoreDTO(String username, String password, String store_name, String store_regnum, String store_phnum,
			String store_email, int store_avg, String store_intro, String store_time, double store_lat,
			double store_lng, String store_role, String enabled, String authority) {
		super();
		this.username = username;
		this.password = password;
		this.store_name = store_name;
		this.store_regnum = store_regnum;
		this.store_phnum = store_phnum;
		this.store_email = store_email;
		this.store_avg = store_avg;
		this.store_intro = store_intro;
		this.store_time = store_time;
		this.store_lat = store_lat;
		this.store_lng = store_lng;
		this.store_role = store_role;
		this.enabled = enabled;
		this.authority = authority;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_regnum() {
		return store_regnum;
	}
	public void setStore_regnum(String store_regnum) {
		this.store_regnum = store_regnum;
	}
	public String getStore_phnum() {
		return store_phnum;
	}
	public void setStore_phnum(String store_phnum) {
		this.store_phnum = store_phnum;
	}
	public String getStore_email() {
		return store_email;
	}
	public void setStore_email(String store_email) {
		this.store_email = store_email;
	}
	public int getStore_avg() {
		return store_avg;
	}
	public void setStore_avg(int store_avg) {
		this.store_avg = store_avg;
	}
	public String getStore_intro() {
		return store_intro;
	}
	public void setStore_intro(String store_intro) {
		this.store_intro = store_intro;
	}
	public String getStore_time() {
		return store_time;
	}
	public void setStore_time(String store_time) {
		this.store_time = store_time;
	}
	public double getStore_lat() {
		return store_lat;
	}
	public void setStore_lat(double store_lat) {
		this.store_lat = store_lat;
	}
	public double getStore_lng() {
		return store_lng;
	}
	public void setStore_lng(double store_lng) {
		this.store_lng = store_lng;
	}
	public String getStore_role() {
		return store_role;
	}
	public void setStore_role(String store_role) {
		this.store_role = store_role;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	
	
}
