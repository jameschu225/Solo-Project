package com.ShareFly.Controllers;

import java.time.Period;
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
import com.ShareFly.Services.RentalService;
import com.ShareFly.Services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class RentalController {

	@Autowired
	UserService userService;
	
	@Autowired
	RentalService rentalService;
	
	@Autowired
	AirplaneService airplaneService;
	
	@GetMapping("/rental")
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("loginedUser")== null) {
			return "redirect:/";
		} else {
			List<Airplane> allAirplane=airplaneService.findAllAirplane();
			model.addAttribute("allAirplane", allAirplane);
			User user = (User) session.getAttribute("loginedUser");
			model.addAttribute("loginedUser", user);
			List<Rental> allRentalByUser = rentalService.findAllRentalByUserId(user.getId());
			model.addAttribute("allRentalByUser", allRentalByUser);
			return "rentalHome.jsp";		
		}
	}
	
	@GetMapping("/rental/airplane/{id}/detail")
	public String showAirplaneInformation(@PathVariable("id")Long id, Model model, HttpSession session) {
		if (session.getAttribute("loginedUser")== null) {
			return "redirect:/";
		} else {
		Airplane airplaneInformation = airplaneService.findOneAirplaneById(id);
		model.addAttribute("airplaneInformation", airplaneInformation);
		return "airplaneInformationForRental.jsp";
		}
	}

	@GetMapping("/rental/airplane/{id}/new")
	public String rentAirplane(@ModelAttribute("newRental") Rental newRental, @PathVariable("id")Long id, Model model, HttpSession session) {
		if (session.getAttribute("loginedUser")== null) {
			return "redirect:/";
		} else {
		Airplane airplaneToRent = airplaneService.findOneAirplaneById(id);
		model.addAttribute("airplaneToRent", airplaneToRent);
		model.addAttribute("loginedUser", (User) session.getAttribute("loginedUser"));
		return "addRental.jsp";
		}
	}
	
	@PostMapping("/newRental")
	public String addRental(@Valid@ModelAttribute("newRental") Rental newRental, BindingResult result, Model model, HttpSession session) {
		if (rentalService.rentalDateValid(newRental, result)==null){
			return "addRental.jsp";
		} else if(rentalService.rentalScheduleValid(newRental, result)==null) {
			return "addRental.jsp";
		}
		else {
			Period rentalPeriod = rentalService.findDateInBetween( newRental.getStartDate(), newRental.getReturnDate());
			Integer totalPrices = newRental.getAirplane().getRentalPrice()* (rentalPeriod.getDays()+1);
			newRental.setTotalPrice(totalPrices);
			rentalService.createRental(newRental);
			return "redirect:/rental";
		}
	}
	
	@DeleteMapping("/rental/{id}/cancel")
	public String cancelRental(@PathVariable("id")Long id, Model model, HttpSession session) {
		Rental canceledRental = rentalService.findOneRentalById(id);
		rentalService.deleteRental(canceledRental);
		return "redirect:/rental";
	}
	
	@GetMapping("/rental/{id}/edit")
	public String editRental(@PathVariable("id")Long id, Model model, HttpSession session) {
		if (session.getAttribute("loginedUser")== null) {
			return "redirect:/";
		} else {
		Rental editedRental = rentalService.findOneRentalById(id);
		model.addAttribute("editedRental", editedRental);
		return "editRental.jsp";
		}
	}
	
	@PutMapping("/rental/{id}/update")
	public String updateRental(@Valid@ModelAttribute("editedRental") Rental editedRental, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			return "editRental.jsp";
		} else {
			rentalService.updateRental(editedRental);
			return "redirect:/home";
		}
	}
}
