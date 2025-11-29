package dto;

public record ReviewCreateDto(
        Integer userId,
        Integer serviceId,
        Integer rating,
        String comment
) {}

