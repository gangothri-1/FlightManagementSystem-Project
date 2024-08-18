package com.Gangothri.service;

import java.time.LocalDate;


import java.time.Period;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Gangothri.bean.Flight;
import com.Gangothri.bean.Passenger;
import com.Gangothri.bean.Ticket;
import com.Gangothri.dao.FlightDao;
import com.Gangothri.dao.FlightRepository;
import com.Gangothri.dao.PassengerRepository;
import com.Gangothri.dao.TicketDao;
import com.Gangothri.dao.TicketRepository;
import com.Gangothri.exception.SeatNotFoundException;


@Service
public class TicketService {
	@Autowired
    private FlightDao flightDao;
	@Autowired
    private TicketDao ticketDao;
	 @Autowired
	    private TicketRepository ticketRepository;
	    
	    @Autowired
	    private PassengerRepository passengerRepository;
	    
	    @Autowired
	    private FlightRepository flightRepository;

	
	
	private int ageCalculation(String dob) {
		LocalDate today=LocalDate.now();
		String dateArr[]=dob.split("-");
		LocalDate birthDay=LocalDate.of(Integer.parseInt(dateArr[0]),Integer.parseInt(dateArr[1]),Integer.parseInt(dateArr[2]));
		Period period=Period.between(birthDay,today);
		int age=period.getYears();
		return age;
	}
	public Double discountFareCalculation(Passenger passenger) {
		int age=ageCalculation(passenger.getPassengerDOB());
		double finalFare=0.0;
		if(age<=14) {
			finalFare=passenger.getFare()/2;
			}
		else if(age>=60)
		{
			finalFare=passenger.getFare()-(passenger.getFare()*0.30);
		}
		else {
			finalFare=passenger.getFare();
		}
		return finalFare;
	}
	public boolean capacityCalculation(int numberOfSeatBooking,long flightNumber) 
	{
		Flight flight=flightDao.findFlightById(flightNumber);
		if (flight == null) {
            return false;
        }

		int bookedSeat=flight.getSeatBooked()+numberOfSeatBooking;
		int balance=flight.getSeatCapacity()-bookedSeat;
		//System.out.println(balance);
		if(balance<0)
			return false;
			//throw new SeatNotFoundException();
		else {
			flight.setSeatBooked(bookedSeat);
			flightDao.save(flight);
			return true;
		     }
	}
	public Double totalBillCalculation(List<Passenger> passengerList) {
		double totalValue=0.0;
		for(Passenger passenger:passengerList) {
			totalValue=totalValue+passenger.getFare();
			
		}
		return totalValue;
		
	}
	public boolean cancelTicket(Long ticketNumber) {
        Optional<Ticket> optionalTicket = ticketRepository.findById(ticketNumber);
        if (optionalTicket.isPresent()) {
            Ticket ticket = optionalTicket.get();
            
            // Fetch passengers associated with the ticket
            List<Passenger> passengers = passengerRepository.findByEmbeddedId_TicketNumber(ticketNumber);

            // Update seat capacity
            Optional<Flight> optionalFlight = flightRepository.findById(ticket.getFlightNumber());
            if (optionalFlight.isPresent()) {
                Flight flight = optionalFlight.get();
                int seatsToFree = passengers.size();
                flight.setSeatBooked(flight.getSeatBooked() - seatsToFree);
                flightRepository.save(flight);
            }
            
            // Delete ticket and associated passengers
            passengerRepository.deleteAll(passengers);
            ticketRepository.delete(ticket);
            return true;
        }
        return false;
    }

	public List<Ticket> getAllTickets() {
		return ticketRepository.findAll();
	}
}

	

	











	
	
	
	
	






