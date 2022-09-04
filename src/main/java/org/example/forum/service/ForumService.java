package org.example.forum.service;

import org.example.forum.dao.dto.ForumDto;
import org.example.forum.dao.dto.UserDto;
import org.example.forum.dao.repository.ForumRepository;
import org.example.forum.mapper.ForumEntityToDtoMapper;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ForumService {
    private final ForumRepository forumRepository;
    private final ForumEntityToDtoMapper forumEntityToDtoMapper;
    private final UserService userService;

    public ForumService(final ForumEntityToDtoMapper forumEntityToDtoMapper, final ForumRepository forumRepository, final UserService userService) {
        this.forumEntityToDtoMapper = forumEntityToDtoMapper;
        this.forumRepository = forumRepository;
        this.userService = userService;
    }

    @NonNull
    public List<ForumDto> getList() {
        return this.forumEntityToDtoMapper.toDtos(this.forumRepository.getList());
    }

    public void write(@NonNull final String title, @NonNull final String userId) {
        final UserDto userDto = this.userService.findByUserId(userId);

        final ForumDto forumDto = new ForumDto();
        forumDto.setTitle(title);
        forumDto.setUser(userDto);
        forumDto.setDate(LocalDateTime.now());
        forumDto.setIsAvailable(true);

        this.forumRepository.save(this.forumEntityToDtoMapper.toEntity(forumDto));
    }

    public void remove(@NonNull final Integer forumId) {
        this.forumRepository.deleteById(forumId);
    }

    public void update(@NonNull final Integer forumId, @NonNull final String title) {
        this.forumRepository.updateForumTitle(forumId, title, LocalDateTime.now());
    }

    @Nullable
    public ForumDto getById(final int forumId) {
        return this.forumRepository.findById(forumId)
                .map(this.forumEntityToDtoMapper::toDto)
                .orElse(null);
    }
}
