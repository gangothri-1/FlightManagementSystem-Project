package com.Gangothri.bean;





import java.util.ArrayList;


import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;


import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class FlightUser extends User {
	@Id
	private String username;
	private String password;
	private String type;
	private transient Collection<? extends GrantedAuthority> authorities;
	public FlightUser(){
		super("abc","pqr",new ArrayList<>());
	}
	
	public FlightUser(String username, String password, String type, Collection<? extends GrantedAuthority> authorities,String username2, String password2,String type2 ) {
		super(username,password,authorities);
		this.username = username2;
		this.password = password2;
		this.type = type2;
	}
     
	@Override
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
     
	@Override
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "FlightUser [username=" + username + ", password=" + password + ", type=" + type + "]";
	}

	

	
	}
    
	
	
	
	

