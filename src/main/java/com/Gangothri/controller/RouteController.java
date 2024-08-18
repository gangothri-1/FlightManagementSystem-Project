package com.Gangothri.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.Gangothri.bean.Airport;
import com.Gangothri.bean.Flight;
import com.Gangothri.bean.Route;
import com.Gangothri.dao.AirportDao;
import com.Gangothri.dao.FlightDao;
import com.Gangothri.dao.RouteDao;
import com.Gangothri.exception.RouteNotFoundException;
import com.Gangothri.exception.SeatNotFoundException;
import com.Gangothri.service.FlightService;
import com.Gangothri.service.RouteService;





    
    @ControllerAdvice
	@RestController
	public class RouteController {
		@Autowired
		private RouteDao routeDao;
		@Autowired
		private RouteService routeService;
		@Autowired
		private AirportDao airportDao;
		@Autowired
		private FlightDao flightDao;
		
		@Autowired
		private FlightService flightService;
		
		@GetMapping("/route")
		public ModelAndView showRouteEntryPage() {
			Long newRouteId=routeDao.generateRouteId();
			Route route=new Route();
			route.setRouteId(newRouteId);
			ModelAndView mv=new ModelAndView("routeEntryPage");
			mv.addObject("routeRecord",route);
			return mv;
		}
		
		@PostMapping("/route")
	    public ModelAndView saveRoutes(@ModelAttribute("routeRecord")Route route1) {
			String source=route1.getSourceAirportCode().toUpperCase();
			String destination=route1.getDestinationAirportCode().toUpperCase();
			String sourceCode=airportDao.findAirportCodeByLocation(source);
		    String destinationCode=airportDao.findAirportCodeByLocation(destination);
			route1.setSourceAirportCode(sourceCode);
			route1.setDestinationAirportCode(destinationCode);
			Route route2=routeService.createReturnRoute(route1);
			routeDao.save(route1);
			routeDao.save(route2);
			//return new ModelAndView("index");
			return new ModelAndView("redirect:/index");
		}
		
		@GetMapping("/routes")
		public ModelAndView showRouteReportPage() {
			List<Route> routeList=routeDao.findAllRoutes();
			ModelAndView mv=new ModelAndView("routeReportPage");
			mv.addObject("abc",routeList);
			return mv;
		}
		@GetMapping("/flight")
		public ModelAndView showFlightEntryPage() {
		List<Long> routeList=routeDao.findAllRoutesId();
			Flight flight=new Flight();
			ModelAndView mv=new ModelAndView("FlightEntryPage");
			mv.addObject("flightRecord",flight);
			mv.addObject("routeList",routeList);
			return mv;
			}
		@PostMapping("/flight")
		public ModelAndView saveFlights(@ModelAttribute("flightRecord") Flight flight1,@RequestParam("dtime")
		String dtime,@RequestParam("atime") String atime) {
			Flight flight2=flightService.createReturnFlight(flight1,dtime,atime);
			flightDao.save(flight1);
			flightDao.save(flight2);
			//return new ModelAndView("index");
			return new ModelAndView("redirect:/index");
			}
		@GetMapping("/flights")
		public ModelAndView showFlightReportPage() {
			List<Flight> flightList=flightDao.findAllFlights();
			ModelAndView mv=new ModelAndView("flightReportPage");
			mv.addObject("efg",flightList);
			return mv;
			}
		@GetMapping("/flight-search")
		public ModelAndView showRouteSelectPage() {
			List<String> airportList=airportDao.findAllAirportLocations();
			ModelAndView mv=new ModelAndView("routeSelectPage");
			mv.addObject("airportList",airportList);
			return mv;
		}
		@PostMapping("/flight-search")
		public ModelAndView showRouteFlightPage(@RequestParam("fromCity")String fromCity,@RequestParam("toCity") String toCity)
		{
			String fromAirport=airportDao.findAirportCodeByLocation(fromCity);
			String toAirport=airportDao.findAirportCodeByLocation(toCity);
			if(fromAirport.equalsIgnoreCase(toAirport))
				throw new RouteNotFoundException();
			Route route=routeDao.findRouteBySourceAndDestination(fromAirport, toAirport);
			List<Flight> flightList=flightDao.findFlightsByRouteId(route.getRouteId());
			ModelAndView mv=new ModelAndView("routeFlightShowPage");
			mv.addObject("flightList",flightList);
			mv.addObject("fromAirport",fromCity);
			mv.addObject("toAirport",toCity);
			mv.addObject("fair",route.getFare());
			return mv;
		   }
		@ExceptionHandler(value=RouteNotFoundException.class)
		public ModelAndView handlingRouteException(RouteNotFoundException exception ) {
			String messsage="From-City & To-City cannot be the same....";
			ModelAndView mv=new ModelAndView("routeErrorPage");
			mv.addObject("errorMessage",messsage);
			return mv;
			
			
		}
		
		@PostMapping("/CancelRoute")
	    public ModelAndView cancelRoute(@RequestParam("RouteNumber") Long RouteNumber, Model model) {
	        boolean success = routeService.cancelRoute(RouteNumber);
	        if (success) {
	            model.addAttribute("message", "Route cancelled successfully.");
	        } else {
	            model.addAttribute("message", "Route cancellation failed.");
	        }
	        ModelAndView mv = new ModelAndView("cancellationRoute");
	        return mv;
	    }
		@PostMapping("/CancelFlight")
		public ModelAndView cancelFlight(@RequestParam("FlightNumber") Long FlightNumber, Model model) {
		    boolean success = flightService.cancelFlight(FlightNumber);
		    if (success) {
		        model.addAttribute("message", "Flight cancelled successfully.");
		    } else {
		        model.addAttribute("message", "Flight cancellation failed.");
		    }
		    ModelAndView mv = new ModelAndView("cancellationRoute");
		    return mv;
		}

	    		
		

	}



