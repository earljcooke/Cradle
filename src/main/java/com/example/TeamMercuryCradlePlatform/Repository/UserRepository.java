package com.example.TeamMercuryCradlePlatform.Repository;

import com.example.TeamMercuryCradlePlatform.Model.User;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserRepository extends CrudRepository <User, Integer>{
    public User findByUserId(Integer userid);
    public List<User> findAll();
//    @Modifying
//    @Query
//            ("update user u set u.first_name = :firstName, u.last_name = :lastName, u.email = :email, u.password = :password, u.roles = :roles where u.user_id = id")
//    public User updateUser(Integer id, User user);
}
