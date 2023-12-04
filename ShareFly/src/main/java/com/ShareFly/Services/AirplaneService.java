package com.ShareFly.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.ShareFly.Models.Airplane;
import com.ShareFly.Repositories.AirplaneRepository;

@Service
public class AirplaneService {
	
	private final AirplaneRepository airplaneRepository;
	
	public AirplaneService(AirplaneRepository airplaneRepository) {
		this.airplaneRepository =  airplaneRepository;
	}
	
	public Airplane createAirplane(Airplane airplane) {
		return airplaneRepository.save(airplane);
	}
	
	public List<Airplane> findAllAirplane() {
		return airplaneRepository.findAll();
	}
	
	public List<Airplane> findAllAirplaneByUserId(Long id) {
		return airplaneRepository.findByUserId(id);
	}
	
	public Airplane findOneAirplaneById(Long id) {
		Optional<Airplane> airplane = airplaneRepository.findById(id);
		return airplane.get();
	}
	
	public Airplane findOneAirplaneByTail(String tailNumber) {
		Optional<Airplane> airplane = airplaneRepository.findByTailNumber(tailNumber);
		if (airplane.isPresent()) {
			return airplane.get();
		}else {
			return null;			
		}
	}
	
	public Airplane createAirplaneVaild(Airplane newAirplane, BindingResult result) {
		Optional<Airplane> airplane = airplaneRepository.findByTailNumber(newAirplane.getTailNumber());
		if (airplane.isPresent()) {
			result.rejectValue("tailNumber", "newAirplane.tailnumber.exist", "Tailnumber already exist");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			return newAirplane;
		}
	}
	
	public Airplane updateAirplane(Airplane airplane) {
		return airplaneRepository.save(airplane);
	}
	
	public void deleteAirplane(Airplane airplane) {
		airplaneRepository.delete(airplane);
	}
}
