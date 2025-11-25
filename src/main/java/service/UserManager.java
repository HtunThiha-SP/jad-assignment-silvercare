package service;

import dao.UserDAO;
import model.User;
import util.OperationResponse;
import util.PasswordUtil;

import java.util.*;

public class UserManager {
    public static OperationResponse registerUser(User user) {
    	var response = new OperationResponse();
        if (user.getDisplayName() == null || user.getDisplayName().isEmpty()) {
            user.setDisplayName(user.getUsername());
        }
        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            response.setSuccess(false);
            response.setMessage("Please enter password.");
            return response;
        }
        
        if(!user.getUsername().matches("^[A-Za-z0-9]+(?:-[A-Za-z0-9]+)*$") || user.getUsername().length() < 8 || user.getUsername().length() > 32) {
        	response.setSuccess(false);
        	response.setMessage("Invalid username format, please try again.");
        }

        String hash = PasswordUtil.hashPassword(user.getPassword());
        user.setPassword(hash);

        OperationResponse sqlResponse = UserDAO.insertNewUser(user);
        if(sqlResponse.getCode().equals("REGISTER_SUCCESS")) {
        	response.setSuccess(true);
        	response.setMessage(user.getDisplayName());
        } else {
        	response.setSuccess(false);
        	if(sqlResponse.getCode().equals("REGISTER_DUPLICATE_USERNAME")) {
        		response.setMessage("Username already exists. Please try again.");
        	} else if (sqlResponse.getCode().equals("REGISTER_DUPLICATE_EMAIL")) {
        		response.setMessage("Email already exists. Please try again.");
        	} else {
        		response.setMessage("Unknown error occurred. Please try again.");
        	}
        }
        return response;
    }
    
    public static OperationResponse loginUser(User user) {
    	var response = new OperationResponse();

        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            response.setSuccess(false);
            response.setMessage("Please enter password");
            return response;
        }

        OperationResponse sqlResponse = UserDAO.verifyUser(user);
        if(sqlResponse.getCode().equals("LOGIN_SUCCESS")) {
        	response.setSuccess(true);
        	response.setMessage(sqlResponse.getMessage());
        } else {
        	response.setSuccess(false);
        	if(sqlResponse.getCode().equals("LOGIN_INCORRECT_PASSWORD")) {
        		response.setMessage("Incorrect password. Please try again.");
        	} else if (sqlResponse.getCode().equals("LOGIN_USER_NOT_FOUND")) {
        		response.setMessage("User not found. Please try again.");
        	} else {
        		response.setMessage("Unknown error occurred. Please try again.");
        	}
        }
        return response;
    }
    
    public static User getUserProfileInfo(String username) {
    	User userRes = UserDAO.selectUserByUsername(username);
    	return userRes;
    }
    
    public static OperationResponse updateUserProfileInfo(User user, String oldUsername) {
    	var response = new OperationResponse();
        if (user.getDisplayName() == null || user.getDisplayName().isEmpty()) {
            user.setDisplayName(user.getUsername());
        }
        
        if(!user.getUsername().matches("^[A-Za-z0-9]+(?:-[A-Za-z0-9]+)*$") || user.getUsername().length() < 8 || user.getUsername().length() > 32) {
        	response.setSuccess(false);
        	response.setMessage("Invalid username format, please try again.");
        }

        OperationResponse sqlResponse = UserDAO.updateUser(user, oldUsername);
        if(sqlResponse.getCode().equals("UPDATE_SUCCESS")) {
        	response.setSuccess(true);
        	response.setMessage(user.getDisplayName());
        } else {
        	response.setSuccess(false);
        	if(sqlResponse.getCode().equals("UPDATE_DUPLICATE_USERNAME")) {
        		response.setMessage("Username already exists. Please try again.");
        	} else if (sqlResponse.getCode().equals("UPDATE_DUPLICATE_EMAIL")) {
        		response.setMessage("Email already exists. Please try again.");
        	} else {
        		response.setMessage("Unknown error occurred. Please try again.");
        	}
        }
        return response;
    }
}
