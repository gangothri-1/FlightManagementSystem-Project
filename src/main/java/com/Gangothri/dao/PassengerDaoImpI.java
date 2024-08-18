package com.Gangothri.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.Gangothri.bean.Passenger;

@Service
@Repository
public class PassengerDaoImpI implements PassengerDao {
	@Autowired
	private PassengerRepository repository;
	@Override
	public void save(Passenger passenger) {
		repository.save(passenger);
	}
	@Override
	public List<Passenger> findByTicketNumber(Long ticketNumber) {
		// TODO Auto-generated method stub
		return repository.findByEmbeddedId_TicketNumber(ticketNumber);
	}
	

}
