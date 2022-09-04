package org.example.forum.dao.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;


@Data
public class ForumDto {
    private Integer id;
    private String title;
    private List<TopicDto> topics;
    private UserDto user;
    private LocalDateTime date;
    private Boolean isAvailable;
}
