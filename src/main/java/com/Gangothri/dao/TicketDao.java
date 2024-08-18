package com.Gangothri.dao;

import com.Gangothri.bean.Ticket;

public interface TicketDao {
	public void save(Ticket ticket);
	public Long findLastTicketNumber();

	

}
