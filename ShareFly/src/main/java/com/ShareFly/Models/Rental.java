package com.ShareFly.Models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name= "rentals")
public class Rental {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message="Ets. fly range must be filled!")
	@Min(value = 100, message="estimated fly range must be at least 100 NM!")
	private Integer estimatedFlyRange;
	
	@NotBlank(message="Start Date must be entered!")
	@DateTimeFormat(pattern ="yyy-MM-dd")
	private Date startDate;
	
	@NotBlank(message="Return Date must be entered!")
	@DateTimeFormat(pattern ="yyy-MM-dd")
	private Date returnDate;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="airplane_id")
	private Airplane airplane;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern ="yyy-MM-dd-hh-m")
	private Date CreatedAt;
	
	@DateTimeFormat(pattern ="yyy-MM-dd-hh-m")
	private Date UpdatedAt;
	
	public Rental() {
		
	}
	
	@PrePersist
	private void onCreate() {
		this.CreatedAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.UpdatedAt = new Date();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getEstimatedFlyRange() {
		return estimatedFlyRange;
	}

	public void setEstimatedFlyRange(Integer estimatedFlyRange) {
		this.estimatedFlyRange = estimatedFlyRange;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Airplane getAirplane() {
		return airplane;
	}

	public void setAirplane(Airplane airplane) {
		this.airplane = airplane;
	}

	public Date getCreatedAt() {
		return CreatedAt;
	}

	public void setCreatedAt(Date createdAt) {
		CreatedAt = createdAt;
	}

	public Date getUpdatedAt() {
		return UpdatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		UpdatedAt = updatedAt;
	}
}
