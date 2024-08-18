package com.Gangothri.dao;

import java.util.List;

import com.Gangothri.bean.Airport;
public interface AirportDao {

	   public void addAirport(Airport airport);
	   public List<Airport> findAllAirports();
	   public Airport findAirportById(String id);
	   public List<String> findAllAirportLocations();
	   public String findAirportCodeByLocation(String sourceAirportCode);
	   public void updateAirport(Airport airport);
}

