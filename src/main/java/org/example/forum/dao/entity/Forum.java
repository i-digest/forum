package org.example.forum.dao.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "forum")
@Getter @Setter
@RequiredArgsConstructor
public class Forum {

    @Id @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "title", nullable = false)
    private String title;

    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn (name = "forum_id", referencedColumnName = "id")
    private List<Topic> topics;

    @OneToOne @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @Column(name = "forum_date", nullable = false)
    private LocalDateTime date;

    @Column(name = "is_available", nullable = false)
    private Boolean isAvailable;

    @Override
    public boolean equals(final Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        final Forum forum = (Forum) o;

        if (!Objects.equals(id, forum.id)) return false;
        if (!Objects.equals(title, forum.title)) return false;
        if (!Objects.equals(topics, forum.topics)) return false;
        if (!Objects.equals(user, forum.user)) return false;
        if (!Objects.equals(date, forum.date)) return false;
        return Objects.equals(isAvailable, forum.isAvailable);
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (topics != null ? topics.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (isAvailable != null ? isAvailable.hashCode() : 0);
        return result;
    }
}
