package com.edububby.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.edububby.demo.service.UserService;

@RestController
public class UserRestController {
    
    @Autowired
    private UserService userService;

    @PostMapping("/IdCheck")
    public ResponseEntity<Map<String, Boolean>> IdCheck(@RequestParam String userId){
        boolean exist = userService.IdExist(userId);
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exist);
        return ResponseEntity.ok(response);
    }
}
