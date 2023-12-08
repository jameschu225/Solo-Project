package com.ShareFly.Controllers;

import java.util.List;

import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.ShareFly.Models.Airplane;
import com.ShareFly.Models.Rental;
import com.ShareFly.Models.User;
import com.ShareFly.Services.AirplaneService;
import com.ShareFly.Services.RentalService;
import com.ShareFly.Services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class OwnerContoller {
	
	@Autowired
	AirplaneService airplaneService;
	@Autowired
	UserService userService;
	@Autowired
	RentalService rentalService;
	
	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("loginedUser")== null) {
			return "redirect:/";
		} 
		if (userService.userTypeIdentify((User) session.getAttribute("loginedUser")).equals("Airplane Owner")) {
			User user = (User) session.getAttribute("loginedUser");
			List<Airplane> allAirplane=airplaneService.findAllAirplaneByUserId(user.getId());
			model.addAttribute("allAirplane", allAirplane);
			model.addAttribute("loginedUser", (User) session.getAttribute("loginedUser"));
			System.out.println(allAirplane);
			
			return "welcome.jsp";				
		} 
		if (userService.userTypeIdentify((User) session.getAttribute("loginedUser")).equals("Airplane Loaner")) {	
			return "redirect:/rental";
		} 
		if (userService.userTypeIdentify((User) session.getAttribute("loginedUser")).equals("Admin")) {	
			List<Airplane> allAirplane=airplaneService.findAllAirplane();
			model.addAttribute("allAirplane", allAirplane);
			model.addAttribute("loginedUser", (User) session.getAttribute("loginedUser"));
			List<Rental> allRental=rentalService.findAllRental();
			model.addAttribute("allRental", allRental);
			return "adminPage.jsp";
		} else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/airplane/new")
	public String createAirplane(@ModelAttribute("newAirplane") Airplane newAirplane, HttpSession session) {
		if (session.getAttribute("loginedUser")== null) {
			return "redirect:/";
		} else {
		return "newAirplane.jsp";
		}
	}
	
	@PostMapping("/newAirplane")
	public String addAirplane(@Valid@ModelAttribute("newAirplane")Airplane newAirplane,
			BindingResult result, Model model, HttpSession session) {
		Airplane validedNewAirplane = airplaneService.createAirplaneVaild(newAirplane, result);
		if(validedNewAirplane==null) {
			return "newAirplane.jsp";
		} else {
			validedNewAirplane.setUser((User) session.getAttribute("loginedUser"));
			airplaneService.createAirplane(validedNewAirplane);
			return "redirect:/home";
		}
	}
	
	@GetMapping("/airplane/{id}/edit")
	public String editAirplane(Model model,@PathVariable("id")Long id, HttpSession session) {
		if (session.getAttribute("loginedUser")== null) {
			return "redirect:/";
		} else {
		Airplane editedairplane = airplaneService.findOneAirplaneById(id);
		model.addAttribute("loginedUser", session.getAttribute("loginedUser"));
		model.addAttribute("editedairplane", editedairplane);
		return "editAirplane.jsp";
		}
	}
	
	@PutMapping("/updateAirplane/{id}")
	public String updateAirplane(@Valid@ModelAttribute("editedairplane") Airplane editedairplane, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute("loginedUser", session.getAttribute("loginedUser"));
			return "editAirplane.jsp";
		} else {
			airplaneService.updateAirplane(editedairplane);
			return "redirect:/home";
		}
	}
	
	@DeleteMapping("/deleteAirplane/{id}")
	public String deleteAirplane(@PathVariable("id")Long id, HttpSession session, Model model) {
		Airplane deleteAirplane = airplaneService.findOneAirplaneById(id);
		if (deleteAirplane.getRentals()!= null) {
			String alertMessage = "alert";
			model.addAttribute("alertMessage", alertMessage);		
			return "redirect:/home";
		} else {
		airplaneService.deleteAirplane(deleteAirplane);
		return "redirect:/home";
		}
	}
	
	@GetMapping("/airplane/{id}/detail")
	public String showDetailAirplane(@PathVariable("id")Long id, Model model, HttpSession session) {
		if (session.getAttribute("loginedUser")== null) {
			return "redirect:/";
		} else {
		Airplane detailAirplane = airplaneService.findOneAirplaneById(id);
		model.addAttribute("detailAirplane", detailAirplane);
		return "detailAirplane.jsp";
		}
	}
}
