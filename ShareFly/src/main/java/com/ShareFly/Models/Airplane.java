package com.ShareFly.Models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name= "airplanes")
public class Airplane {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message="make can not be blank!")
	@Size(min=3 , message="make must has at least 5 char!")
	private String make;
	
	@NotBlank(message="model can not be blank!")
	@Size(min=3 , message="model must has at least 5 char!")
	private String model;
	
	@NotBlank(message="type can not be blank!")
	@Size(min=3 , message="type must has at least 3 char!")
	private String type;
	
	@NotNull(message="flyRange can not be blank!")
	@Min(value =1000 ,message="flyRange must longer than 1000 NM!")
	private Integer flyRange;
	
	@NotBlank(message="tailnumber can not be blank!")
	@Size(min=6 , message="tailnumber must has at least 5 char!")
	@Size(max=6 , message="tailnumber must has at least 5 char!")
	private String tailNumber;
	
	@NotNull(message="flightHr can not be blank!")
	@Min(value =1 ,message="flightHr must great than 1!")
	private Integer flightHr;
	
	@NotNull(message="enginehr can not be blank!")
	@Min(value =0 ,message="enginehr must great than 0!")
	private Integer engineHr;
	
	@NotNull(message="rentalPrice can not be blank!")
	@Min(value =0 ,message="rentalPrice must great than 0!")
	private Integer rentalPrice;
	
	@Size(max = 2000)
	@Column(columnDefinition="TEXT")
	private String note;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToMany(mappedBy="airplane", fetch=FetchType.LAZY)
	private List<Rental> rentals;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern ="yyy-MM-dd-hh-m")
	private Date CreatedAt;
	
	@DateTimeFormat(pattern ="yyy-MM-dd-hh-m")
	private Date UpdatedAt;
	
	public Airplane() {
		
	}
	
	@PrePersist
	protected void onCreate() {
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

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getFlightHr() {
		return flightHr;
	}

	public void setFlightHr(Integer flightHr) {
		this.flightHr = flightHr;
	}


	public Integer getRentalPrice() {
		return rentalPrice;
	}

	public void setRentalPrice(Integer rentalPrice) {
		this.rentalPrice = rentalPrice;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public List<Rental> getRentals() {
		return rentals;
	}

	public void setRentals(List<Rental> rentals) {
		this.rentals = rentals;
	}

	public String getTailNumber() {
		return tailNumber;
	}

	public void setTailNumber(String tailNumber) {
		this.tailNumber = tailNumber;
	}

	public Integer getEngineHr() {
		return engineHr;
	}

	public void setEngineHr(Integer engineHr) {
		this.engineHr = engineHr;
	}

	public Integer getFlyRange() {
		return flyRange;
	}

	public void setFlyRange(Integer flyRange) {
		this.flyRange = flyRange;
	}
}
