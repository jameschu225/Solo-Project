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
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name= "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message="username can not be blank!")
	@Size(min=5 , message="username must has at least 5 char!")
	private String username;
	
	@NotBlank(message="email can not be blank!")
	@Email
	private String email;
	
	@NotBlank(message="password can not be blank!")
	@Size(min= 8, message="passwrod must longer than 8!")
	private String password;
	
	@Transient
	@NotBlank(message="password not match!")
	private String confirmpassword;
	
	
	@NotBlank(message="Category can not be blank!")
	private String category;
	
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	private List<Airplane> airplanes;
	
	@OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	private List<Rental> rentals;
	
	@Column(updatable = false)
	@DateTimeFormat(pattern ="yyy-MM-dd-hh-m")
	private Date CreatedAt;
	
	@DateTimeFormat(pattern ="yyy-MM-dd-hh-m")
	private Date UpdatedAt;
	
	public User() {
		
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<Airplane> getAirplanes() {
		return airplanes;
	}

	public void setAirplanes(List<Airplane> airplanes) {
		this.airplanes = airplanes;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Rental> getRentals() {
		return rentals;
	}

	public void setRentals(List<Rental> rentals) {
		this.rentals = rentals;
	}
}
