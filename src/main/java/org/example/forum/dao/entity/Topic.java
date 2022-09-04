package org.example.forum.dao.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "topic")
@Getter @Setter
@RequiredArgsConstructor
public class Topic {

    @Id @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "forum_id", nullable = false)
    private Integer forumId;

    @OneToOne @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @Column(name = "topic_date", nullable = false)
    private LocalDateTime date;

    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "is_available", nullable = false)
    private Boolean isAvailable;

}
