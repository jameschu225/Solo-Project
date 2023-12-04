package com.ShareFly.Controllers;

import java.util.List;

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
import com.ShareFly.Services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class OwnerContoller {
	
	@Autowired
	AirplaneService airplaneService;
	@Autowired
	UserService userService;
	
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
			return "welcome.jsp";				
		} 
		if (userService.userTypeIdentify((User) session.getAttribute("loginedUser")).equals("Airplane Loaner")) {
			List<Airplane> allAirplane=airplaneService.findAllAirplane();
			model.addAttribute("allAirplane", allAirplane);
			model.addAttribute("loginedUser", (User) session.getAttribute("loginedUser"));
			return "rentalHome.jsp";		
		} else {
			return null;
		}
	}
	
	@GetMapping("/airplane/new")
	public String createAirplane(@ModelAttribute("newAirplane") Airplane newAirplane) {
		return "newAirplane.jsp";
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
		Airplane editedairplane = airplaneService.findOneAirplaneById(id);
		model.addAttribute("loginedUser", session.getAttribute("loginedUser"));
		model.addAttribute("editedairplane", editedairplane);
		return "editAirplane.jsp";
	}
	
	@PutMapping("/updateAirplane/{id}")
	public String updateAirplane(@Valid@ModelAttribute("editedairplane") Airplane editedairplane, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "editAirplane.jsp";
		} else {
			airplaneService.updateAirplane(editedairplane);
			return "redirect:/home";
		}
	}
	
	@DeleteMapping("/deleteAirplane/{id}")
	public String deleteAirplane(@PathVariable("id")Long id) {
		Airplane deleteAirplane = airplaneService.findOneAirplaneById(id);
		airplaneService.deleteAirplane(deleteAirplane);
		return "redirect:/home";
	}
	
	@GetMapping("/airplane/{id}/detail")
	public String showDetailAirplane(@PathVariable("id")Long id, Model model, HttpSession session) {
		Airplane detailAirplane = airplaneService.findOneAirplaneById(id);
		model.addAttribute("detailAirplane", detailAirplane);
		return "detailAirplane.jsp";
	}
	
	@GetMapping("/rental/airplane/{id}/detail")
	public String showAirplaneInformation(@PathVariable("id")Long id, Model model, HttpSession session) {
		Airplane airplaneInformation = airplaneService.findOneAirplaneById(id);
		model.addAttribute("airplaneInformation", airplaneInformation);
		return "airplaneInformationForRental.jsp";
	}

	@GetMapping("/rental/airplane/{id}/new")
	public String rentAirplane(@ModelAttribute("newRental") Rental newRental, @PathVariable("id")Long id, Model model, HttpSession session) {
		Airplane airplaneToRent = airplaneService.findOneAirplaneById(id);
		model.addAttribute("airplaneToRent", airplaneToRent);
		return "addRental.jsp";
	}
	
	@PostMapping()
}
