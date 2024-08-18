package com.Gangothri.dao;

import java.util.List;

import com.Gangothri.bean.Passenger;


public interface PassengerDao {
	public void save(Passenger passenger);
	public List<Passenger> findByTicketNumber(Long ticketNumber);
	

}
