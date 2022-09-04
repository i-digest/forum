package org.example.forum.mapper;

import org.example.forum.dao.dto.UserDto;
import org.example.forum.dao.entity.User;
import org.springframework.stereotype.Component;

@Component
public class UserEntityToDtoMapper {

    public User toEntity(final UserDto dto) {
        final User entity = new User();
        entity.setId(dto.getId());
        entity.setUserId(dto.getUserId());
        entity.setUsername(dto.getUsername());
        entity.setPassword(dto.getPassword());
        entity.setGender(dto.getGender());
        entity.setEmail(dto.getEmail());
        entity.setRole(dto.getRole());
        return entity;
    }

    public UserDto toDto(final User entity) {
        final UserDto dto = new UserDto();
        dto.setId(entity.getId());
        dto.setUserId(entity.getUserId());
        dto.setUsername(entity.getUsername());
        dto.setPassword(entity.getPassword());
        dto.setGender(entity.getGender());
        dto.setEmail(entity.getEmail());
        dto.setRole(entity.getRole());
        return dto;
    }
}
