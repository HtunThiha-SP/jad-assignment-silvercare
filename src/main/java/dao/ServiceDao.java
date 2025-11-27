package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ServiceDto;
import util.Db;
import util.TimeUtil;

public class ServiceDao {
	public static List<ServiceDto> selectServicesByCategoryName(String serviceCategoryName) {
		var servicesList = new ArrayList<ServiceDto>();
		try {
			Connection conn = Db.getConnection();
			
			String sqlStatement = "SELECT name, title, description, price, img_index, duration, created_on, last_updated_on FROM service "
					+ "WHERE category_id = (SELECT id FROM service_category WHERE name = ?)";
			PreparedStatement stmt = conn.prepareStatement(sqlStatement);
			stmt.setString(1, serviceCategoryName);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString("name");
				String title = rs.getString("title");
				String description = rs.getString("description");
				BigDecimal price = rs.getBigDecimal("price");
				int imgIndex = rs.getInt("img_index");
				String durationStr = TimeUtil.convertDuration(rs.getInt("duration"));
				String createdTime = TimeUtil.convertDate(rs.getString("created_on"));
				String lastUpdatedTime = TimeUtil.convertDate(rs.getString("last_updated_on"));
				servicesList.add(new ServiceDto(name, title, description, price, imgIndex, durationStr, createdTime, lastUpdatedTime));
			}
			conn.close();
		} catch(SQLException e) {
	        System.out.println("SQLException at ServiceDao.selectServicesByCategoryName");
	        System.out.println("SQL Error Code: " + e.getErrorCode());
	        System.out.println("SQL State: " + e.getSQLState());
	        System.out.println("SQL Message: " + e.getMessage());
		}
		
		return servicesList;
	}
}
