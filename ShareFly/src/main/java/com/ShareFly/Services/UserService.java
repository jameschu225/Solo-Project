package com.ShareFly.Services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.ShareFly.Models.Airplane;
import com.ShareFly.Models.Login;
import com.ShareFly.Models.Rental;
import com.ShareFly.Models.User;
import com.ShareFly.Repositories.UserRepository;

@Service
public class UserService {

	private final UserRepository userRepository;
	
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	public User create(User user) {
		return userRepository.save(user);
	}
	
	public User findOneUser(String email) {
		Optional<User> user=userRepository.findByEmail(email);
		if (user.isPresent()) {
			return user.get();
		} else {
			return null;
		}
	}

	public User registerValid(User registeruser, BindingResult result) {
		Optional<User> user=userRepository.findByEmail(registeruser.getEmail());
		if (user.isPresent()) {
			result.rejectValue("email", "registeruser.email.exist", "Account alread exist");
		}
		if (!registeruser.getPassword().equals(registeruser.getConfirmpassword())) {
			result.rejectValue("password", "registeruser.password.match", "Password not match");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			String hashed = BCrypt.hashpw(registeruser.getPassword(), BCrypt.gensalt());
			registeruser.setPassword(hashed);
			return registeruser;
		}
	}
	
	public Login loginValid(Login loginuser, BindingResult result) {
		Optional<User> user=userRepository.findByEmail(loginuser.getEmail());
		if (!user.isPresent()) {
			result.rejectValue("email", "login.email.notexist", "Account not exist!");
			return null;
		}
		if (!BCrypt.checkpw(loginuser.getPassword(), user.get().getPassword())) {
			result.rejectValue("password", "login.password.match", "Invalid entry!");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			return loginuser;
		}
	}
	public String userTypeIdentify(User loginuser) {
		Optional<User> user=userRepository.findByEmail(loginuser.getEmail());
		if (user.isPresent()) {
			String userType = user.get().getCategory();			
			return userType;
		} else {
			return null;
		}
	}
}
