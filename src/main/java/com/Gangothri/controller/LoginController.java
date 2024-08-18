package com.Gangothri.controller;


import org.springframework.web.servlet.ModelAndView;






import com.Gangothri.bean.FlightUser;
import com.Gangothri.service.FlightUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class LoginController {
	@Autowired
	private FlightUserService service;
	
	

    /*@GetMapping("/index")
    public ModelAndView showIndexPage() {
        return new ModelAndView("index");
    }*/
	@GetMapping("/register")
	public ModelAndView showUserRegisterPage() {
		FlightUser user= new FlightUser();
		ModelAndView mv=new ModelAndView("newUserEntry");
		mv.addObject("userRecord",user);
		return mv;
	}

	@Autowired
	private BCryptPasswordEncoder bCrypt;
	@PostMapping("/register")
	public ModelAndView saveSignUpPage(@ModelAttribute("userRecord") FlightUser user) {
	String encodedPassword = bCrypt.encode(user.getPassword()); // encryptes the password
	FlightUser newUser=new FlightUser();
	newUser.setUsername(user.getUsername());
	newUser.setPassword(encodedPassword);
	newUser.setType(user.getType());
	service.save(newUser);
	return new ModelAndView("loginPage");
	}
	@GetMapping("/loginpage")
	public ModelAndView showLoginPage() {
		return new ModelAndView("loginPage");
	}
	@GetMapping("/loginerror")
	public ModelAndView showLoginErrorPage() {
		ModelAndView mv = new ModelAndView("loginError");
        mv.addObject("error", "Invalid username or password.");
        return mv;
	}
	@GetMapping("/index")
	public ModelAndView showIndexPage() {
	String indexPage="";
	String userType=service.getType();
	if(userType.equalsIgnoreCase("Admin"))
	     indexPage="index1";
	 else if(userType.equalsIgnoreCase("Customer"))
	      indexPage="index2";
	 return new ModelAndView(indexPage);
		
	}
		
	}

