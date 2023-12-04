package com.ShareFly.Repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ShareFly.Models.Airplane;

@Repository
public interface AirplaneRepository extends CrudRepository<Airplane, Long> {

	List<Airplane> findAll();
	
	List<Airplane> findByUserId(Long id);
	
	Optional<Airplane> findByTailNumber(String tailNumber);
}
