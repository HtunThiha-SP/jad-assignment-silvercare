package dao;

import java.sql.*;
import java.util.*;

import dto.UserLoginDto;
import dto.UserRegisterDto;
import dto.UserUpdateDto;
import util.Db;
import util.OperationResponse;
import util.PasswordUtil;

public class UserDao {

    public static OperationResponse insertNewUser(UserRegisterDto userRegisterData) {
        boolean success = false;
        String message = "";
        String code = "";
        Integer newUserId = null;

        try {
            Connection conn = Db.getConnection();
            String sqlStatement = "INSERT INTO user(username, email, display_name, password, role_id) "
                                + "VALUES (?, ?, ?, ?, 1)";
            PreparedStatement stmt = conn.prepareStatement(sqlStatement, Statement.RETURN_GENERATED_KEYS);

            stmt.setString(1, userRegisterData.username());
            stmt.setString(2, userRegisterData.email());
            stmt.setString(3, userRegisterData.displayName());
            stmt.setString(4, userRegisterData.password());

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected == 1) {
                success = true;
                code = "REGISTER_SUCCESS";
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    newUserId = rs.getInt(1);
                }
            } else {
                success = false;
                code = "REGISTER_UNKNOWN_ERROR";
            }

            conn.close();
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
            } else {
                code = "REGISTER_UNKNOWN_ERROR";
            }

            System.out.println("SQLException at UserDao.insertNewUser");
            System.out.println("SQL Error Code: " + e.getErrorCode());
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("SQL Message: " + e.getMessage());
        }

        return new OperationResponse(success, message, code, newUserId);
    }

    public static OperationResponse verifyUserLogin(UserLoginDto userLoginData) {
        boolean success = false;
        String message = "";
        String code = "";
        Map<String, Object> responseData = new HashMap<>();

        // Now we join the role table so we can get role_name directly
        String sqlStatement =
                "SELECT u.id, u.display_name, u.password, r.name AS role_name " +
                "FROM user u " +
                "JOIN role r ON u.role_id = r.id " +
                "WHERE u.username = ? " +
                "LIMIT 1";

        try (Connection conn = Db.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sqlStatement)) {

            stmt.setString(1, userLoginData.username());

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String dbHash = rs.getString("password");
                    String loginPassword = userLoginData.password();

                    boolean isCorrectPassword = PasswordUtil.verifyPassword(loginPassword, dbHash);

                    if (isCorrectPassword) {
                        success = true;
                        code = "LOGIN_SUCCESS";

                        responseData.put("userId", rs.getInt("id"));
                        responseData.put("displayName", rs.getString("display_name"));
                        // ⭐ NEW: include roleName so servlet can redirect admin/user differently
                        responseData.put("roleName", rs.getString("role_name"));
                    } else {
                        success = false;
                        code = "LOGIN_INCORRECT_PASSWORD";
                    }
                } else {
                    success = false;
                    code = "LOGIN_USERNAME_NOT_FOUND";
                }
            }

        } catch (SQLException e) {
            success = false;
            code = "LOGIN_UNKNOWN_ERROR";

            System.out.println("SQLException at UserDao.verifyUserLogin");
            System.out.println("SQL Error Code: " + e.getErrorCode());
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("SQL Message: " + e.getMessage());
        }

        return new OperationResponse(success, message, code, responseData);
    }

    public static UserUpdateDto selectUserById(Integer userId) {
        String username = "";
        String email = "";
        String displayName = "";
        try {
            Connection conn = Db.getConnection();
            String sqlStatement = "SELECT username, email, display_name FROM user "
                                + "WHERE id = ? LIMIT 1";
            PreparedStatement stmt = conn.prepareStatement(sqlStatement);
            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                username = rs.getString("username");
                email = rs.getString("email");
                displayName = rs.getString("display_name");
            }
        } catch (SQLException e) {
            System.out.println("SQLException at UserDao.selectUserById");
            System.out.println("SQL Error Code: " + e.getErrorCode());
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("SQL Message: " + e.getMessage());
        }

        return new UserUpdateDto(username, email, displayName);
    }

    // You can keep this helper if you use it elsewhere, but verifyUserLogin
    // no longer needs it because it already returns roleName in responseData.
    public static String getRoleNameByUsername(String username) {
        String roleName = null;

        String sql = """
            SELECT r.name
            FROM user u
            JOIN role r ON u.role_id = r.id
            WHERE u.username = ?
            LIMIT 1
            """;

        try (Connection conn = Db.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                roleName = rs.getString("name");
            }
        } catch (SQLException e) {
            System.out.println("SQL Error (getRoleNameByUsername): " + e.getMessage());
        }

        return roleName;
    }
}

