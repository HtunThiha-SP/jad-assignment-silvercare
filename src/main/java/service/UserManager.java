package service;

import java.util.*;

import dao.UserDao;
import dto.UserLoginDto;
import dto.UserRegisterDto;
import dto.UserUpdateDto;
import util.OperationResponse;
import util.PasswordUtil;

public class UserManager {

    public static OperationResponse register(String username, String email, String displayName, String password) {
        boolean success = false;
        String message = "";
        String code = "";
        Integer newUserId = null;

        // 🔹 Normalize / trim input first
        username = (username == null) ? "" : username.trim();
        email = (email == null) ? "" : email.trim();
        displayName = (displayName == null || displayName.trim().isEmpty())
                      ? username
                      : displayName.trim();

        // --------- Basic validation ---------
        if (password == null || password.isEmpty()) {
            success = false;
            message = "Empty or invalid password. Please try again.";
            code = "REGISTER_VALIDATION_ERROR";
            return new OperationResponse(success, message, code, newUserId);
        }

        // 🔹 Use SAME rule as login (here I’ll go with min length = 8 for both)
        if (!username.matches("^[A-Za-z0-9]+(?:-[A-Za-z0-9]+)*$") ||
            username.length() < 8 || username.length() > 32) {

            success = false;
            message = "Invalid username format, please try again.";
            code = "REGISTER_VALIDATION_ERROR";
            return new OperationResponse(success, message, code, newUserId);
        }

        // --------- Hash password and call DAO ---------
        String hash = PasswordUtil.hashPassword(password);
        var userRegisterData = new UserRegisterDto(username, email, displayName, hash);

        OperationResponse registerSqlResponse = UserDao.insertNewUser(userRegisterData);
        code = registerSqlResponse.getCode();

        if (registerSqlResponse.isSuccess()) {
            success = true;
            message = "Redirecting to homepage...";
            newUserId = (Integer) registerSqlResponse.getResponseData();
        } else {
            success = false;
            if ("REGISTER_DUPLICATE_USERNAME".equals(registerSqlResponse.getCode())) {
                message = "Username already exists. Please try again.";
            } else if ("REGISTER_DUPLICATE_EMAIL".equals(registerSqlResponse.getCode())) {
                message = "Email already exists. Please try again.";
            } else {
                message = "Unknown error occurred. Please try again.";
            }
        }

        return new OperationResponse(success, message, code, newUserId);
    }

    public static OperationResponse loginUser(String username, String password) {
        boolean success = false;
        String message = "";
        String code = "";

        // 🔹 Normalize / trim username
        username = (username == null) ? "" : username.trim();

        // --------- Basic validation ---------
        if (password == null || password.isEmpty()) {
            success = false;
            message = "Empty or invalid password. Please try again.";
            code = "LOGIN_VALIDATION_ERROR";
            return new OperationResponse(success, message, code, null);
        }

        // 🔹 SAME rules as register
        if (!username.matches("^[A-Za-z0-9]+(?:-[A-Za-z0-9]+)*$") ||
            username.length() < 8 || username.length() > 32) {

            success = false;
            message = "Invalid username format, please try again.";
            code = "LOGIN_VALIDATION_ERROR";
            return new OperationResponse(success, message, code, null);
        }

        // --------- Call DAO to verify login ---------
        var userLoginData = new UserLoginDto(username, password);
        OperationResponse loginSqlResponse = UserDao.verifyUserLogin(userLoginData);
        code = loginSqlResponse.getCode();

        if (loginSqlResponse.isSuccess()) {
            success = true;
            message = "Redirecting...";
        } else {
            success = false;
            if ("LOGIN_USERNAME_NOT_FOUND".equals(loginSqlResponse.getCode())) {
                message = "Username not found. Please try again.";
            } else if ("LOGIN_INCORRECT_PASSWORD".equals(loginSqlResponse.getCode())) {
                message = "Incorrect password. Please try again.";
            } else {
                message = "Unknown error occurred. Please try again.";
            }
        }

        return new OperationResponse(success, message, code, loginSqlResponse.getResponseData());
    }

    public static UserUpdateDto getUserProfileInfo(Integer userId) {
        return UserDao.selectUserById(userId);
    }
}
