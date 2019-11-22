package com.mercury.TeamMercuryCradlePlatform.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.mercury.TeamMercuryCradlePlatform.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    public User findByUserId(Integer userid);
    public List<User> findAll();
    public User findByEmail(String email);

    @Query("SELECT u FROM User u WHERE u.roles LIKE %?1%")
    public ArrayList<User> findAllByRole(String role);

    public Boolean existsByEmail(String email);
}
