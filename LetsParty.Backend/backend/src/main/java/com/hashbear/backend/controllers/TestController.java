package com.hashbear.backend.controllers;
import lombok.AllArgsConstructor;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
@AllArgsConstructor
public class TestController {

    @GetMapping("/health")
    public String healthCheck() {
        // check if backend is alive
        boolean isBackendAlive = true;
        if(isBackendAlive) {
            return "Backend is alive";
        } else {
            return "Backend is dead";
        }
    }

    @GetMapping("/databaseHealthCheck")
    public String databaseHealthCheck() {
        // check if db works and is reachable
        boolean isDbAlive = true;
        if(isDbAlive) {
            return "The Db is alive";
        } else {
            return "The Db is not responding";
        }
    }
}
