package org.example.forum.mapper;

import org.example.forum.dao.dto.TopicDto;
import org.example.forum.dao.dto.UserDto;
import org.example.forum.dao.entity.Topic;
import org.example.forum.dao.entity.User;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class TopicEntityToDtoMapper {
    private final UserEntityToDtoMapper userEntityToDtoMapper;

    public TopicEntityToDtoMapper(final UserEntityToDtoMapper userEntityToDtoMapper) {
        this.userEntityToDtoMapper = userEntityToDtoMapper;
    }

    public Topic toEntity(final TopicDto dto) {
        final Topic entity = new Topic();
        entity.setId(dto.getId());
        entity.setTitle(dto.getTitle());
        final User user = this.userEntityToDtoMapper.toEntity(dto.getUser());
        entity.setUser(user);
        entity.setContent(dto.getContent());
        entity.setIsAvailable(dto.getIsAvailable());
        entity.setDate(dto.getDate());
        entity.setForumId(dto.getForumId());

        return entity;
    }

    public TopicDto toDto(final Topic entity) {
        final TopicDto dto = new TopicDto();
        dto.setId(entity.getId());
        dto.setId(entity.getId());
        dto.setTitle(entity.getTitle());
        final UserDto userDto = this.userEntityToDtoMapper.toDto(entity.getUser());
        dto.setUser(userDto);
        dto.setContent(entity.getContent());
        dto.setIsAvailable(entity.getIsAvailable());
        dto.setDate(entity.getDate());
        dto.setForumId(entity.getForumId());
        return dto;
    }

    public List<TopicDto> toDtos(final List<Topic> topicList) {
        return topicList.stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    public List<Topic> toEntities(final List<TopicDto> topicDtoList) {
        return topicDtoList.stream()
                .map(this::toEntity)
                .collect(Collectors.toList());
    }
}
