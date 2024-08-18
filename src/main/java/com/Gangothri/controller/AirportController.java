package com.Gangothri.controller;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Gangothri.bean.Airport;
import com.Gangothri.dao.AirportDao;

@Controller
public class AirportController {
	 @Autowired
	    private AirportDao airportDao;

	
	    @GetMapping("/airport")
	    public ModelAndView showAirportEntryPage() {
	        Airport airport = new Airport();
	        ModelAndView mv = new ModelAndView("airportEntryPage");
	        mv.addObject("airportRecord", airport);
	        return mv;
	    }

	    @PostMapping("/airport")
	    public ModelAndView saveAirport(@ModelAttribute("airportRecord") Airport airport) {
	        String str = airport.getAirportCode().toUpperCase();
	        airport.setAirportCode(str);
	        String stg= airport.getAirportLocation().toUpperCase();
	        airport.setAirportLocation(stg);
	        airportDao.addAirport(airport);
	        //return new ModelAndView("index");
	        return new ModelAndView("redirect:/index");
	    }

	    
	   
	    @GetMapping("/airport/{id}")
	    public ModelAndView showSingleAirportReportPage(@PathVariable("id") String id) {
	        Airport airport = airportDao.findAirportById(id);
	        ModelAndView mv = new ModelAndView("airportShowPage");
	        mv.addObject("airport", airport);
	        return mv;
	    }
	    @GetMapping("/airports")
	    public ModelAndView showAirportReportPage() {
	        List<Airport> airportList = airportDao.findAllAirports();
	        ModelAndView mv = new ModelAndView("airportReportPage");
	        mv.addObject("bcd", airportList);
	        return mv;
	    }
	    @GetMapping("/editAirportForm")
	    public ModelAndView showEditForm(@RequestParam("id") String id) {
	        Airport airport = airportDao.findAirportById(id);
	        ModelAndView mv = new ModelAndView("editAirportPage");
	        mv.addObject("airportRecord", airport);
	        return mv;
	    }

	    @PostMapping("/updateAirport")
	    public ModelAndView updateAirport(@ModelAttribute("airportRecord") Airport airport) {
	        airportDao.updateAirport(airport);
	        return new ModelAndView("redirect:/airports"); // Corrected redirect URL
	    }
	}


