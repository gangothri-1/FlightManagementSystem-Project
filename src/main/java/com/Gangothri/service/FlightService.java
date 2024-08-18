package com.Gangothri.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.Gangothri.bean.Flight;
import com.Gangothri.bean.Route;
import com.Gangothri.dao.FlightRepository;
import com.Gangothri.dao.RouteDao;

@Service
public class FlightService {
	@Autowired
	private RouteDao routeDao;
	@Autowired
	private FlightRepository flightRepository;
	
	public Flight createReturnFlight(Flight flight,String dtime,String atime) {
		Long newId=flight.getFlightNumber()+1L;
		Route route=routeDao.findRouteById(flight.getRouteId());
		String sourceCode=route.getDestinationAirportCode();
		String destinationCode=route.getSourceAirportCode();
		Route route2=routeDao.findRouteBySourceAndDestination(sourceCode,destinationCode);
		return new Flight(newId ,flight.getCarrierName(),route2.getRouteId(),flight.getSeatCapacity(),dtime,atime);
		
	}
	public boolean cancelFlight(Long flightNumber) {
		Optional<Flight> optionalFlight = flightRepository.findById(flightNumber);
	    if (optionalFlight.isPresent()) {
	        Flight flight = optionalFlight.get();
	        flightRepository.delete(flight);
	        return true;
	    }
	    return false;
	}
	
	
	

}