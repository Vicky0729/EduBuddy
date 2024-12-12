package com.edububby.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edububby.demo.model.Academic;



@Repository
public interface AcademicRepository extends JpaRepository<Academic, Long>{

    

    public Academic findByUserId(String userId);

    
}
