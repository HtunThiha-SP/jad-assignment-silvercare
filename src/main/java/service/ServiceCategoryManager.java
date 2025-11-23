package service;

import model.ServiceCategory;
import dao.ServiceCategoryDAO;

import java.util.*;

public class ServiceCategoryManager {
	public static List<ServiceCategory> getAllServiceCategories() {
		return ServiceCategoryDAO.selectAllServiceCategories();
	}
}
