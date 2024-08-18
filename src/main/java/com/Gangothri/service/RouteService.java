package com.Gangothri.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Gangothri.bean.Route;
import com.Gangothri.dao.RouteRepository;

@Service
public class RouteService {
	@ Autowired
	private RouteRepository routeRepository;
	
	public Route createReturnRoute(Route route) {
		Long newId=route.getRouteId()+1;
		String sourceCode=route.getDestinationAirportCode();
		String destinationCode=route.getSourceAirportCode();
		return new Route(newId,sourceCode,destinationCode,route.getFare() );
		
		
	}
	public boolean cancelRoute(Long routeNumber) {
		  Optional<Route> optionalRoute = routeRepository.findById(routeNumber);
	      if (optionalRoute.isPresent()) {
		  Route route = optionalRoute.get();
		  routeRepository.delete(route);
    return true;
	}
		return false;
	}

}
