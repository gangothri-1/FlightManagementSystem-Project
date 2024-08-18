package com.Gangothri.bean;

import javax.persistence.Entity;

import javax.persistence.Id;

@Entity
public class Ticket {
	@Id
	private Long ticketNumber;
	private Long flightNumber;
	private Long routeId;

	private String carrierName;
	private Double  totalAmount;
	
	public Ticket() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Ticket(Long ticketNumber, Long flightNumber, Long routeId, String carrierName, Double totalAmount) {
		super();
		this.ticketNumber = ticketNumber;
		this.flightNumber = flightNumber;
		this.routeId = routeId;
		this.carrierName = carrierName;
		this.totalAmount = totalAmount;
	}


	public Long getTicketNumber() {
		return ticketNumber;
	}


	public void setTicketNumber(Long ticketNumber) {
		this.ticketNumber = ticketNumber;
	}


	public Long getFlightNumber() {
		return flightNumber;
	}


	public void setFlightNumber(Long flightNumber) {
		this.flightNumber = flightNumber;
	}


	public Long getRouteId() {
		return routeId;
	}


	public void setRouteId(Long routeId) {
		this.routeId = routeId;
	}


	public String getCarrierName() {
		return carrierName;
	}


	public void setCarrierName(String carrierName) {
		this.carrierName = carrierName;
	}


	public Double getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}


	@Override
	public String toString() {
		return "Ticket [ticketNumber=" + ticketNumber + ", flightNumber=" + flightNumber + ", routeId=" + routeId
				+ ", carrierName=" + carrierName + ", totalAmount=" + totalAmount + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
