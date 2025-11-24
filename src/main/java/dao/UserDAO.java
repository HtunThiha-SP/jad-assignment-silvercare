package dao;

import model.User;
import util.Db;
import util.OperationResponse;
import util.PasswordUtil;

import java.sql.*;

public class UserDAO {
	public static OperationResponse insertNewUser(User user) {
		boolean success = false;
		String message = "";
		String code = "";
	    try {
	        Connection conn = Db.getConnection();
	        PreparedStatement stmt = conn.prepareStatement(
	                "INSERT INTO user(username, display_name, email, password, role_id) VALUES (?, ?, ?, ?, 1)"
	        );

	        stmt.setString(1, user.getUsername());
	        stmt.setString(2, user.getDisplayName());
	        stmt.setString(3, user.getEmail());
	        stmt.setString(4, user.getPassword());

	        int rowsAffected = stmt.executeUpdate();
	        conn.close();
	        
	        if(rowsAffected == 1) {
	        	success = true;
	        	code = "REGISTER_SUCCESS";
	        } else {
	        	success = false;
	        	code = "REGISTER_UNKNOWN_ERROR";
	        }
	    } catch (SQLException e) {
	    	success = false;
	        if (e.getErrorCode() == 1062) {
	            if (e.getMessage().contains("username")) {
	                code = "REGISTER_DUPLICATE_USERNAME";
	            } else if (e.getMessage().contains("email")) {
	                code = "REGISTER_DUPLICATE_EMAIL";
	            } else {
	            	code = "REGISTER_UNKNOWN_ERROR";
	            }
	        }

	        System.out.println("SQL Error Code: " + e.getErrorCode());
	        System.out.println("SQL State: " + e.getSQLState());
	        System.out.println("SQL Message: " + e.getMessage());
	    }
	    return new OperationResponse(success, message, code);
	}
}
