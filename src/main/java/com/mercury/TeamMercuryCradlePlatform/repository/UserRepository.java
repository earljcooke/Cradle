package com.mercury.TeamMercuryCradlePlatform.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.mercury.TeamMercuryCradlePlatform.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUserId(Integer userid);
    List<User> findAll();
    User findByEmail(String email);

    @Query("SELECT u FROM User u WHERE u.roles LIKE %?1%")
    ArrayList<User> findAllByRole(String role);

    Boolean existsByEmail(String email);

    @Query("select u from User u where u.userId <> ?1")
    List<User> findAllNotMe(Integer userId);
}
