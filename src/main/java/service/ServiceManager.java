package service;

import java.util.List;

import dao.ServiceDao;
import dto.ServiceDto;

public class ServiceManager {
	public static List<ServiceDto> getServicesByCategoryName(String name) {
		return ServiceDao.selectServicesByCategoryName(name);
	}
}
