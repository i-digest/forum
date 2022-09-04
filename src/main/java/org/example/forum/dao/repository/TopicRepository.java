package org.example.forum.dao.repository;

import org.example.forum.dao.entity.Topic;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Transactional
@Repository
public interface TopicRepository extends CrudRepository<Topic, Integer> {

    @Query("SELECT t FROM Topic t WHERE t.forumId = ?1 ORDER BY t.date")
    List<Topic> getListByForumId(final Integer forumId);

    @Modifying
    @Query("UPDATE Topic t SET t.title = ?2, t.content = ?3, t.date = ?4 WHERE t.id = ?1")
    void updateTopicTitle(final Integer forumId, final String title, final String content, final LocalDateTime date);

}
