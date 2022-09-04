package org.example.forum.dao.repository;


import org.example.forum.dao.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Transactional
@Repository
public interface UserRepository extends CrudRepository<User, Integer> {

    Optional<User> findUserByUserId(final String userId);

}
