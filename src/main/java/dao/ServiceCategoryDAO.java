package dao;

import model.ServiceCategory;
import util.Db;

import java.util.*;
import java.sql.*;

public class ServiceCategoryDAO {
	public static List<ServiceCategory> selectAllServiceCategories() {
		var serviceCategoriesList = new ArrayList<ServiceCategory>();

		try {
			Connection conn = Db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT name, description, img_index FROM service_category");
			
			while(rs.next()) {
				String name = rs.getString("name");
				String description = rs.getString("description");
				int imgIndex = rs.getInt("img_index");
				serviceCategoriesList.add(new ServiceCategory(name, description, imgIndex));
			}
			conn.close();
		} catch (SQLException e) {
			System.out.println("SQL Exception: " + e.getMessage());
		}
		
		return serviceCategoriesList;
	}
}
