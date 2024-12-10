package com.edububby.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edububby.demo.model.User;


@Repository
public interface UserRepository extends JpaRepository<User,String>{

    public User findByIdAndPassword(String userId, String userPw);

    



    

}
