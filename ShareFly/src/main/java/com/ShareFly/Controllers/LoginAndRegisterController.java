package com.ShareFly.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ShareFly.Models.Login;
import com.ShareFly.Models.User;
import com.ShareFly.Services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class LoginAndRegisterController {
	
	@Autowired
	UserService userservice;
	
	@GetMapping("/")
	public String main(@ModelAttribute("registeruser") User registeruser, 
			@ModelAttribute("loginuser") Login loginuser, Model model) {
		String[] category = {"Admin", "Airplane Owner", "Airplane Loaner"};
		model.addAttribute("category", category);
		return "dashboard.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid@ModelAttribute("registeruser") User registeruser, 
			BindingResult result, Model model, HttpSession session) {
		User validedRegisterUser = userservice.registerValid(registeruser, result);
		if (validedRegisterUser== null) {
			model.addAttribute("loginuser", new Login() );
			String[] category = {"Admin", "Airplane Owner", "Airplane Loaner"};
			model.addAttribute("category", category);
			return "dashboard.jsp";
		}else {
			userservice.create(registeruser);
			session.setAttribute("loginedUser", registeruser);
			return "redirect:/home";
		}
	}
	
	@PostMapping("/login")
	public String login(@Valid@ModelAttribute("loginuser") Login loginuser, 
			BindingResult result, Model model, HttpSession session) {
		Login loginUser = userservice.loginValid(loginuser, result);
		if (loginUser==null) {
			model.addAttribute("registeruser", new User());
			String[] category = {"Admin", "Airplane Owner", "Airplane Loaner"};
			model.addAttribute("category", category);
			return "dashboard.jsp";
		}else {
			User user = userservice.findOneUser(loginUser.getEmail());
			session.setAttribute("loginedUser", user);
			return "redirect:/home";
		}
	}
	
	@PostMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginedUser");
		return "redirect:/";
	}
}
