package org.example.forum.mapper;

import org.example.forum.dao.dto.ForumDto;
import org.example.forum.dao.dto.TopicDto;
import org.example.forum.dao.dto.UserDto;
import org.example.forum.dao.entity.Forum;
import org.example.forum.dao.entity.Topic;
import org.example.forum.dao.entity.User;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class ForumEntityToDtoMapper {
    private final TopicEntityToDtoMapper topicEntityToDtoMapper;
    private final UserEntityToDtoMapper userEntityToDtoMapper;

    public ForumEntityToDtoMapper(final UserEntityToDtoMapper userEntityToDtoMapper, final TopicEntityToDtoMapper topicEntityToDtoMapper) {
        this.userEntityToDtoMapper = userEntityToDtoMapper;
        this.topicEntityToDtoMapper = topicEntityToDtoMapper;
    }

    public Forum toEntity(final ForumDto dto) {
        final Forum entity = new Forum();
        entity.setId(dto.getId());
        entity.setTitle(dto.getTitle());
        final User user = this.userEntityToDtoMapper.toEntity(dto.getUser());
        final List<Topic> topicList = dto.getTopics() != null ? this.topicEntityToDtoMapper.toEntities(dto.getTopics()) : null;
        entity.setUser(user);
        entity.setTopics(topicList);
        entity.setDate(dto.getDate());
        entity.setIsAvailable(dto.getIsAvailable());
        return entity;
    }

    public ForumDto toDto(final Forum entity) {
        final ForumDto dto = new ForumDto();
        dto.setId(entity.getId());
        dto.setTitle(entity.getTitle());
        final UserDto userDto = this.userEntityToDtoMapper.toDto(entity.getUser());
        final List<TopicDto> topicDtoList = entity.getTopics() != null ? this.topicEntityToDtoMapper.toDtos(entity.getTopics()) : null;
        dto.setTopics(topicDtoList);
        dto.setUser(userDto);
        dto.setDate(entity.getDate());
        dto.setIsAvailable(entity.getIsAvailable());
        return dto;
    }

    public List<ForumDto> toDtos(final List<Forum> forumList) {
        return forumList.stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }
}
