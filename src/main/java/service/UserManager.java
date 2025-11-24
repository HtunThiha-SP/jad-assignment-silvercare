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
            response.setMessage("Please enter password");
            return response;
        }

        String hash = PasswordUtil.hashPassword(user.getPassword());
        user.setPassword(hash);

        OperationResponse sqlResponse = UserDAO.insertNewUser(user);
        if(sqlResponse.getCode().equals("REGISTER_SUCCESS")) {
        	response.setSuccess(true);
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
}
