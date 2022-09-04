package org.example.forum.dao.repository;

import org.example.forum.dao.entity.Forum;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Transactional
@Repository
public interface ForumRepository extends CrudRepository<Forum, Integer> {

    @Query("SELECT f FROM Forum f ORDER BY f.date")
    List<Forum> getList();

    @Modifying
    @Query("UPDATE Forum f SET f.title = ?2, f.date = ?3 WHERE f.id = ?1")
    void updateForumTitle(final Integer forumId, final String title, final LocalDateTime date);

}
