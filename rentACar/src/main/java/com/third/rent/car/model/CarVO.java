package com.third.rent.car.model;

import java.sql.Timestamp;

public class CarVO {
	private String car_code;
	private String car_name;
	private String car_inc;
	private int car_size;
	private String car_trans;
	private Timestamp car_regdate;
	private String car_type;
	private String car_img;

	public String getCar_code() {
		return car_code;
	}

	public void setCar_code(String car_code) {
		this.car_code = car_code;
	}

	public String getCar_name() {
		return car_name;
	}

	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}

	public String getCar_inc() {
		return car_inc;
	}

	public void setCar_inc(String car_inc) {
		this.car_inc = car_inc;
	}

	public int getCar_size() {
		return car_size;
	}

	public void setCar_size(int car_size) {
		this.car_size = car_size;
	}

	public String getCar_trans() {
		return car_trans;
	}

	public void setCar_trans(String car_trans) {
		this.car_trans = car_trans;
	}

	public Timestamp getCar_regdate() {
		return car_regdate;
	}

	public void setCar_regdate(Timestamp car_regdate) {
		this.car_regdate = car_regdate;
	}

	public String getCar_type() {
		return car_type;
	}

	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}

	public String getCar_img() {
		return car_img;
	}

	public void setCar_img(String car_img) {
		this.car_img = car_img;
	}

	@Override
	public String toString() {
		return "CarVO [car_code=" + car_code + ", car_name=" + car_name + ", car_inc=" + car_inc + ", car_size="
				+ car_size + ", car_trans=" + car_trans + ", car_regdate=" + car_regdate + ", car_type=" + car_type
				+ ", car_img=" + car_img + "]";
	}

}
