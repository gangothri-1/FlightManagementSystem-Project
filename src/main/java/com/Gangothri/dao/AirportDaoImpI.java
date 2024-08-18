package com.Gangothri.dao;
import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.Gangothri.bean.Airport;


@Repository

@Service
public class AirportDaoImpI implements AirportDao {

	@Autowired
    private AirportRepository repository;
  
    @Override
    public void addAirport(Airport airport) {
        repository.save(airport);
    }
    
    @Override
    public List<Airport> findAllAirports() {
    	return repository.findAll();    
    	}

    @Override
    public Airport findAirportById(String id) {
        return repository.findById(id).get();
    }

    @Override
    public List<String> findAllAirportLocations() {
        return repository.findAllAirportCodes();
    }
    @Override
    public String findAirportCodeByLocation(String sourceAirportCode) {
    	return repository.findAirportCodeByLocation(sourceAirportCode);
    }

	@Override
	public void updateAirport(Airport airport) {
		// TODO Auto-generated method stub
		
	}
    
    
    }
