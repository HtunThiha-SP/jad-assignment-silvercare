package dto;

import java.math.BigDecimal;

public record ServiceDto(String name, String title, String description,
		BigDecimal price, int imgIndex, String durationStr, String createdTime, String lastUpdatedTime) {

}
