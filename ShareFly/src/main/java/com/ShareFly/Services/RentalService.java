package com.ShareFly.Services;

import java.time.Period;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.ShareFly.Models.Rental;
import com.ShareFly.Repositories.RentalRepository;

@Service
public class RentalService {

	private final RentalRepository rentalRepository;
	
	public RentalService(RentalRepository rentalRepository) {
		this.rentalRepository = rentalRepository;
	}
	public Rental findOneRentalById(Long id) {
		Optional<Rental> rental = rentalRepository.findById(id);
		if (rental.isPresent()) {
			return rental.get();
		} else {
			return null;
		}
	}
	
	public List<Rental> findAllRental() {
		List<Rental> allRental = rentalRepository.findAll();
		return allRental;
	}
	
	public List<Rental> findAllRentalByUserId(Long id){
		List<Rental> allRentalByUser = rentalRepository.findByUserId(id);
		return allRentalByUser;
	}
	
	public Rental createRental(Rental newrental) {
		return rentalRepository.save(newrental);
	}
	
	public Rental updateRental(Rental rental) {
		return rentalRepository.save(rental);
	}
	
	public void deleteRental(Rental canceledRental) {
		rentalRepository.delete(canceledRental);
	}
	
	public Period findDateInBetween(Date startDate, Date returnDate) {
		Period daysBetween = Period.between(startDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate(),
				returnDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate());
		return daysBetween;
	}
	
	public Rental rentalDateValid(Rental newRental, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		} else if (newRental.getStartDate().after(newRental.getReturnDate())) {
			result.rejectValue("startDate", "rental.startDate.error", "StartDate must Before ReturnDate");
			}
			if (result.hasErrors()) {
				return null;
		} else {
			return newRental;
		}
	}
	
	public Rental rentalScheduleValid(Rental newRental, BindingResult result) {
		List<Rental> allRentalByAirplane = rentalRepository.findByAirplaneId(newRental.getAirplane().getId());
			for (Rental rental : allRentalByAirplane) {
				if (newRental.getStartDate().compareTo(rental.getStartDate())>= 0 && newRental.getStartDate().compareTo(rental.getReturnDate())<=0) {
					result.rejectValue("startDate", "rental.startDate.error", "StartDate Conflict With Other Rental");
					}
				if (newRental.getReturnDate().compareTo(rental.getStartDate())>= 0 && newRental.getReturnDate().compareTo(rental.getReturnDate())<=0) {
					result.rejectValue("returnDate", "rental.returnDate.error", "ReturnDate Conflict With Other Rental");
					} 
				if (result.hasErrors()) {
					return null;
				} else {
					continue;
				}
			}
		return newRental;
	}}

