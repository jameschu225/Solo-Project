package com.ShareFly.Models;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class Login {

	@NotEmpty (message="email can not be blank")
	private String email;
	
	@NotEmpty(message="password can not be blank!")
	@Size(min= 8, message="passwrod must longer than 8!")
	private String password;	
	
	public Login() {
		
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
