package com.edububby.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edububby.demo.model.Solving;

@Repository
public interface SolvingRepository extends JpaRepository<Solving,Long>{






}
