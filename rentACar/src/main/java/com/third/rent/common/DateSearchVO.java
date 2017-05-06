package com.third.rent.common;

public class DateSearchVO extends SearchVO{
	private String combinedSearchStartDate;
	private String combinedSearchEndDate;
	private String searchStartDate;
	private String startHour;
	private String startMin;
	private String searchEndDate;
	private String endHour;
	private String endMin;
	private int carType;
	private String sortBy;
	
	public String getSortBy() {
		return sortBy;
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}
	public String getCombinedSearchStartDate() {
		return combinedSearchStartDate;
	}
	public void setCombinedSearchStartDate(String combinedSearchStartDate) {
		this.combinedSearchStartDate = combinedSearchStartDate;
	}
	public String getCombinedSearchEndDate() {
		return combinedSearchEndDate;
	}
	public void setCombinedSearchEndDate(String combinedSearchEndDate) {
		this.combinedSearchEndDate = combinedSearchEndDate;
	}
	public String getSearchStartDate() {
		return searchStartDate;
	}
	public void setSearchStartDate(String searchStartDate) {
		this.searchStartDate = searchStartDate;
	}
	public String getStartHour() {
		return startHour;
	}
	public void setStartHour(String startHour) {
		this.startHour = startHour;
	}
	public String getStartMin() {
		return startMin;
	}
	public void setStartMin(String startMin) {
		this.startMin = startMin;
	}
	public String getSearchEndDate() {
		return searchEndDate;
	}
	public void setSearchEndDate(String searchEndDate) {
		this.searchEndDate = searchEndDate;
	}
	public String getEndHour() {
		return endHour;
	}
	public void setEndHour(String endHour) {
		this.endHour = endHour;
	}
	public String getEndMin() {
		return endMin;
	}
	public void setEndMin(String endMin) {
		this.endMin = endMin;
	}
	public int getCarType() {
		return carType;
	}
	public void setCarType(int carType) {
		this.carType = carType;
	}
	
	@Override
	public String toString() {
		return "DateSearchVO [combinedSearchStartDate=" + combinedSearchStartDate + ", combinedSearchEndDate="
				+ combinedSearchEndDate + ", searchStartDate=" + searchStartDate + ", startHour=" + startHour
				+ ", startMin=" + startMin + ", searchEndDate=" + searchEndDate + ", endHour=" + endHour + ", endMin="
				+ endMin + ", carType=" + carType + ", sortBy=" + sortBy + ", toString()=" + super.toString() + "]";
	}
	
}
