package service;

import java.util.List;

import dao.ServiceCategoryDao;
import dto.ServiceCategoryDto;

public class ServiceCategoryManager {
	public static List<ServiceCategoryDto> getAllServiceCategories() {
		return ServiceCategoryDao.selectAllServiceCategories();
	}
}
