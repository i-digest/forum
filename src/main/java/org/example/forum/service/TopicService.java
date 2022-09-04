package org.example.forum.service;

import org.example.forum.dao.dto.TopicDto;
import org.example.forum.dao.dto.UserDto;
import org.example.forum.dao.repository.TopicRepository;
import org.example.forum.mapper.TopicEntityToDtoMapper;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class TopicService {
    private final TopicEntityToDtoMapper topicEntityToDtoMapper;
    private final TopicRepository topicRepository;
    private final UserService userService;

    public TopicService(final TopicEntityToDtoMapper topicEntityToDtoMapper, final TopicRepository topicRepository, final UserService userService) {
        this.topicEntityToDtoMapper = topicEntityToDtoMapper;
        this.topicRepository = topicRepository;
        this.userService = userService;
    }

    @NonNull
    public List<TopicDto> getList(@NonNull final Integer forumId) {
        return this.topicEntityToDtoMapper.toDtos(this.topicRepository.getListByForumId(forumId));
    }

    public void write(@NonNull final Integer forumId, @NonNull final String title, @NonNull final String userId, @NonNull final String content) {
        final UserDto forumUserByUserId = userService.findByUserId(userId);

        final TopicDto topicDto = new TopicDto();
        topicDto.setForumId(forumId);
        topicDto.setTitle(title);
        topicDto.setUser(forumUserByUserId);
        topicDto.setContent(content);
        topicDto.setDate(LocalDateTime.now());
        topicDto.setIsAvailable(true);

        this.topicRepository.save(this.topicEntityToDtoMapper.toEntity(topicDto));
    }

    @Nullable
    public TopicDto findById(@NonNull final Integer topicId) {
        return this.topicRepository.findById(topicId)
                .map(this.topicEntityToDtoMapper::toDto)
                .orElse(null);
    }

    public void update(@NonNull final Integer topicId, @NonNull final String title, @NonNull final String content) {
        this.topicRepository.updateTopicTitle(topicId, title, content, LocalDateTime.now());
    }

    public void delete(@NonNull final Integer topicId) {
        this.topicRepository.deleteById(topicId);
    }
}
