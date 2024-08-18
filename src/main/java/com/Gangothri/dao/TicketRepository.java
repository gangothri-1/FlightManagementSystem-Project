package com.Gangothri.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Gangothri.bean.Ticket;

public interface TicketRepository extends JpaRepository<Ticket,Long>{
	@Query("SELECT max(ticketNumber) FROM Ticket")
	public Long findLastTicketNumber();

}
