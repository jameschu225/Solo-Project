package com.ShareFly.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ShareFly.Models.Rental;

@Repository
public interface RentalRepository extends CrudRepository<Rental, Long> {
	
	List<Rental> findAll();
	
	List<Rental> findByUserId(Long id);
	
	List<Rental> findByAirplaneId(Long id);
}
