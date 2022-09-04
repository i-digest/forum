package org.example.forum.dao.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class TopicDto {
    private Integer id;
    private String title;
    private Integer forumId;
    private UserDto user;
    private LocalDateTime date;
    private String content;
    private Boolean isAvailable;
}
