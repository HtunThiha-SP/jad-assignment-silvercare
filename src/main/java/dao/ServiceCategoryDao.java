package dao;

import java.util.*;
import java.sql.*;

import util.Db;
import dto.ServiceCategoryDto;

public class ServiceCategoryDao {
	public static List<ServiceCategoryDto> selectAllServiceCategories() {
		var serviceCategoriesList = new ArrayList<ServiceCategoryDto>();
		
		try {
			Connection conn = Db.getConnection();
			String sqlStatement = "SELECT name, description, img_index FROM service_category";
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(sqlStatement);
			
			while(rs.next()) {
				String name = rs.getString("name");
				String description = rs.getString("description");
				int imgIndex = rs.getInt("img_index");
				
				serviceCategoriesList.add(new ServiceCategoryDto(name, description, imgIndex));
			}
			conn.close();
		} catch(SQLException e) {
	        System.out.println("SQLException at ServiceCategoryDao.selectAllServiceCategories");
	        System.out.println("SQL Error Code: " + e.getErrorCode());
	        System.out.println("SQL State: " + e.getSQLState());
	        System.out.println("SQL Message: " + e.getMessage());
		}
		
		return serviceCategoriesList;
	}
}
